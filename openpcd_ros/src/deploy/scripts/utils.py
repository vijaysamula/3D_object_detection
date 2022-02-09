#!/usr/bin/env python3

import numpy as np
from pyquaternion import Quaternion


def yaw2quat(yaw: float) -> Quaternion:
    return Quaternion(axis=[0, 0, 1], radians=yaw)


def get_annotations_indices(types, thresh, label_preds, scores):
    indexs = []
    annotation_indices = []
    for i in range(label_preds.shape[0]):
        if label_preds[i] == types:
            indexs.append(i)
    for index in indexs:
        if scores[index] >= thresh:
            annotation_indices.append(index)
    return annotation_indices


def filter_points(image_anno, threshold_score):
    '''
    Filters the points based on threshold
    '''
    img_filtered_annotations = {}
    label_preds_ = image_anno["pred_labels"].detach().cpu().numpy()
    scores_ = image_anno["pred_scores"].detach().cpu().numpy()
    # print(image_anno["pred_boxes"].detach().cpu().numpy())
    # print(image_anno["pred_labels"].detach().cpu().numpy())
    car_indices = get_annotations_indices(1, threshold_score, label_preds_, scores_)
    pedestrain_indices = get_annotations_indices(2, threshold_score, label_preds_, scores_)
    cyclist_indices = get_annotations_indices(3, threshold_score, label_preds_, scores_)

    for key in image_anno.keys():
        if key == 'metadata':
            continue
        # img_filtered_annotations[key] = (
        #     image_anno[key][car_indices +
        #                     pedestrain_indices +
        #                     cyclist_indices +
        #                     ])
        img_filtered_annotations[key] = (
            image_anno[key][pedestrain_indices])

    return img_filtered_annotations


def extract_points(cloud_array, translate=25, remove_nans=True, dtype=np.float):
    '''
    Extracts the points from cloud after translation.
    '''
    if remove_nans:
        mask = np.isfinite(cloud_array['x']) & np.isfinite(
            cloud_array['y']) & np.isfinite(cloud_array['z'])
        cloud_array = cloud_array[mask]

    points = np.zeros(cloud_array.shape + (4,), dtype=dtype)
    points[..., 0] = cloud_array['x'] + translate
    points[..., 1] = cloud_array['y']
    points[..., 2] = cloud_array['z']
    return points
