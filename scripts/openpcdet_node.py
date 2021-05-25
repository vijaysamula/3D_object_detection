#!/usr/bin/env python3

import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2, PointField
import rospy
import rospkg
import numpy as np
import sys
import os
import time
import warnings
import ros_numpy

import cv2
import torch

import glob
from pathlib import Path

from pcdet.config import cfg, cfg_from_yaml_file
from pcdet.datasets import DatasetTemplate
from pcdet.models import build_network, load_data_to_gpu
from pcdet.utils import common_utils

from jsk_recognition_msgs.msg import BoundingBox, BoundingBoxArray
from deploy.srv import CheckFor3DObjects, CheckFor3DObjectsResponse

from utils import get_xyz_points, remove_low_score_nu, yaw2quaternion
from NetTorch import InferenceModel
warnings.filterwarnings("ignore", category=UserWarning)

sys.path.append('./')



def xyz_array_to_pointcloud2(points_sum, stamp=None, frame_id=None):
    '''
    Create a sensor_msgs.PointCloud2 from an array of points.
    '''
    msg = PointCloud2()
    if stamp:
        msg.header.stamp = stamp
    if frame_id:
        msg.header.frame_id = frame_id
    msg.height = 1
    msg.width = points_sum.shape[0]
    msg.fields = [
        PointField('x', 0, PointField.FLOAT32, 1),
        PointField('y', 4, PointField.FLOAT32, 1),
        PointField('z', 8, PointField.FLOAT32, 1)
        # PointField('i', 12, PointField.FLOAT32, 1)
        ]
    msg.is_bigendian = False
    msg.point_step = 12
    msg.row_step = points_sum.shape[0]
    msg.is_dense = int(np.isfinite(points_sum).all())
    msg.data = np.asarray(points_sum, np.float32).tostring()
    return msg

class InferenceRos:
    def __init__(self):
        #self.cfg_path = 
        rospy.init_node('3D object detection', anonymous=True)
        self.cfg_path = rospy.get_param("~cfg_file")
        self.model_path = rospy.get_param("~model_path")
        self.translate = rospy.get_param("~translate_x")
        self.input_pointcloud_topic = rospy.get_param("~input_pointcloud_topic")
        self.modelInference = InferenceModel(self.cfg_path,self.model_path)
        self.modelInference.init_model()
        
        
        self.pub_arr_bbox = rospy.Publisher('detected_objects', BoundingBoxArray, queue_size=10)
        rospy.Subscriber(self.input_pointcloud_topic, PointCloud2, self.subscriberCallback)
        self.checkForObjectsService = rospy.Service("check_for_3D_objects",CheckFor3DObjects,self.serviceCallback)
        rospy.spin()
    
    def subscriberCallback(self,msg):
        pre_t = time.time()
        arr_bbox = BoundingBoxArray()

        msg_cloud = ros_numpy.point_cloud2.pointcloud2_to_array(msg)
        numpy_points = get_xyz_points(msg_cloud, self.translate, True)
        print("  ")
        scores, pred_bbox, types = self.modelInference.infer(numpy_points)

        #transformed_cloud = PointCloud2()

        if scores.size != 0:
            for i in range(scores.size):
                bbox = BoundingBox()
                bbox.header.frame_id = msg.header.frame_id
                bbox.header.stamp = msg.header.stamp
                q = yaw2quaternion(float(pred_bbox[i][6]))
                bbox.pose.orientation.x = q[1]
                bbox.pose.orientation.y = q[2]
                bbox.pose.orientation.z = q[3]
                bbox.pose.orientation.w = q[0]           
                bbox.pose.position.x = float(pred_bbox[i][0]-self.translate) 
                bbox.pose.position.y = float(pred_bbox[i][1])
                bbox.pose.position.z = float(pred_bbox[i][2])
                bbox.dimensions.x = float(pred_bbox[i][3])
                bbox.dimensions.y = float(pred_bbox[i][4])
                bbox.dimensions.z = float(pred_bbox[i][5])
                bbox.value = scores[i]
                bbox.label = int(types[i])
                arr_bbox.boxes.append(bbox)
                
        print("total callback time: ", time.time() - pre_t)
        arr_bbox.header.frame_id = msg.header.frame_id
        arr_bbox.header.stamp = msg.header.stamp
        if len(arr_bbox.boxes) is not 0:
            self.pub_arr_bbox.publish(arr_bbox)
            arr_bbox.boxes = []
        else:
            arr_bbox.boxes = []
            self.pub_arr_bbox.publish(arr_bbox)
        
    def serviceCallback(self,req):
        pre_t = time.time()
        arr_bbox = BoundingBoxArray()

        msg_cloud = ros_numpy.point_cloud2.pointcloud2_to_array(req.pc2)
        numpy_points = get_xyz_points(msg_cloud, self.translate, True)
        print("  ")
        scores, pred_bbox, types = self.modelInference.infer(numpy_points)

        #transformed_cloud = PointCloud2()

        if scores.size != 0:
            for i in range(scores.size):
                bbox = BoundingBox()
                bbox.header.frame_id = msg.header.frame_id
                bbox.header.stamp = msg.header.stamp
                q = yaw2quaternion(float(pred_bbox[i][6]))
                bbox.pose.orientation.x = q[1]
                bbox.pose.orientation.y = q[2]
                bbox.pose.orientation.z = q[3]
                bbox.pose.orientation.w = q[0]           
                bbox.pose.position.x = float(pred_bbox[i][0]-self.translate) 
                bbox.pose.position.y = float(pred_bbox[i][1])
                bbox.pose.position.z = float(pred_bbox[i][2])
                bbox.dimensions.x = float(pred_bbox[i][3])
                bbox.dimensions.y = float(pred_bbox[i][4])
                bbox.dimensions.z = float(pred_bbox[i][5])
                bbox.value = scores[i]
                bbox.label = int(types[i])
                arr_bbox.boxes.append(bbox)
                
        print("total callback time: ", time.time() - pre_t)
        arr_bbox.header.frame_id = msg.header.frame_id
        arr_bbox.header.stamp = msg.header.stamp
        if len(arr_bbox.boxes) is not 0:
            return CheckFor3DObjectsResponse(arr_bbox)
            arr_bbox.boxes = []
        else:
            arr_bbox.boxes = []
            return CheckFor3DObjectsResponse(arr_bbox)


if __name__ == "__main__":
    
    
    InferenceRos()
    rospy.spin()