#!/usr/bin/env python3
'''
It contains both dataloader and network loader
'''

import sys
import time
import warnings
import numpy as np
import rospy
import torch

from pcdet.config import cfg, cfg_from_yaml_file
from pcdet.datasets import DatasetTemplate
from pcdet.models import build_network, load_data_to_gpu
from pcdet.utils import common_utils
from utils import filter_points

warnings.filterwarnings("ignore", category=UserWarning)
sys.path.append('./')


class InferenceDataset(DatasetTemplate):
    '''
    Dataset loader to load the data.
    '''

    def __init__(
            self, dataset_cfg, class_names, training=True, root_path=None,
            logger=None):
        """
        Args:
            root_path:
            dataset_cfg:
            class_names:
            training:
            logger:
        """
        super().__init__(dataset_cfg=dataset_cfg, class_names=class_names,
                         training=training, root_path=root_path, logger=logger)
        self.ros_msg = None
        self.sample_file_list = [self.ros_msg]

    def __len__(self):
        return len(self.sample_file_list)

    def __getitem__(self, index):
        if self.sample_file_list[index] is not None:
            points = np.array(self.sample_file_list[index], dtype=np.float32)
        else:
            raise NotImplementedError

        input_dict = {
            'points': points,
            'frame_id': index,
        }

        data_dict = self.prepare_data(data_dict=input_dict)
        return data_dict


class InferenceModel:
    '''
    Network model to load the Network.
    '''

    def __init__(self, config_path, model_path):
        print("Started Node")
        self.points = None
        self.config_path = config_path
        self.model_path = model_path
        self.device = None
        self.model = None
        self.threshold_score = rospy.get_param("~threshold_score")

    def init_model(self):
        self.logger = common_utils.create_logger()
        self.logger.info(
            '-----------------Model loader of OpenPCDet-------------------------')
        cfg_from_yaml_file(self.config_path, cfg)
        self.demo_dataset = InferenceDataset(
            dataset_cfg=cfg.DATA_CONFIG, class_names=cfg.CLASS_NAMES,
            training=False, root_path=None, logger=self.logger)
        self.device = torch.device(
            "cuda" if torch.cuda.is_available() else "cpu")
        self.model = build_network(model_cfg=cfg.MODEL, num_class=len(
            cfg.CLASS_NAMES), dataset=self.demo_dataset)
        self.model.load_params_from_file(
            filename=self.model_path, logger=self.logger, to_cpu=False)
        self.model = self.model.to(self.device).eval()

    def infer(self, points):

        print(f"input points shape: {points.shape}")
        num_features = 4
        self.points = points.reshape([-1, num_features])

        input_dict = {
            'points': self.points,
            'frame_id': 0,
        }

        data_dict = self.demo_dataset.prepare_data(data_dict=input_dict)
        data_dict = self.demo_dataset.collate_batch([data_dict])
        load_data_to_gpu(data_dict)

        torch.cuda.synchronize()
        now = time.time()

        pred_dicts, _ = self.model.forward(data_dict)

        torch.cuda.synchronize()
        print(f"3D Object detection inference cost time: {time.time() - now} sec")

        pred = filter_points(pred_dicts[0], self.threshold_score)
        pred_bboxes = pred["pred_boxes"].detach().cpu().numpy()
        scores = pred["pred_scores"].detach().cpu().numpy()
        types = pred["pred_labels"].detach().cpu().numpy()

        return scores, pred_bboxes, types
