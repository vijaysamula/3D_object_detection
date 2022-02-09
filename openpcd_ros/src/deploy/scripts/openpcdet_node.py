#!/usr/bin/env python3

import sys
import time
import warnings
import numpy as np
import ros_numpy
import rospy
import torch
from deploy.srv import CheckFor3DObjects, CheckFor3DObjectsResponse
from jsk_recognition_msgs.msg import BoundingBox, BoundingBoxArray
from sensor_msgs.msg import PointCloud2, PointField

from NetTorch import InferenceModel
from utils import extract_points, yaw2quat

warnings.filterwarnings("ignore", category=UserWarning)

sys.path.append('./')


def xyz_to_pointcloud2(points_sum, stamp=None, frame_id=None):
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
    '''
    InferenceRos class to infer the images streaming form service and client or subsribing
    '''

    def __init__(self):
        rospy.init_node('3D object detection', anonymous=True)
        self.cfg_path = rospy.get_param("~cfg_file")
        self.model_path = rospy.get_param("~model_path")
        self.translate = rospy.get_param("~translate_x")
        self.input_pointcloud_topic = rospy.get_param(
            "~input_pointcloud_topic")
        self.modelInference = InferenceModel(self.cfg_path, self.model_path)
        self.modelInference.init_model()

        self.pub_arr_bbox = rospy.Publisher(
            'detected_objects', BoundingBoxArray, queue_size=10)
        rospy.Subscriber(self.input_pointcloud_topic,
                         PointCloud2, self.subscriber_callback)
        self.checkForObjectsService = rospy.Service(
            "check_for_3D_objects", CheckFor3DObjects, self.service_callback)
        rospy.spin()

    def subscriber_callback(self, msg):
        pre_t = time.time()
        arr_bbox = BoundingBoxArray()

        msg_cloud = ros_numpy.point_cloud2.pointcloud2_to_array(msg)
        numpy_points = extract_points(msg_cloud, self.translate, True)
        print("  ")
        scores, pred_bbox, types = self.modelInference.infer(numpy_points)

        #transformed_cloud = PointCloud2()

        if scores.size != 0:
            for i in range(scores.size):
                bbox = BoundingBox()
                bbox.header.frame_id = msg.header.frame_id
                bbox.header.stamp = msg.header.stamp
                q = yaw2quat(float(pred_bbox[i][6]))
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

    def service_callback(self, req):
        pre_t = time.time()
        arr_bbox = BoundingBoxArray()

        msg_cloud = ros_numpy.point_cloud2.pointcloud2_to_array(req.pc2)
        numpy_points = extract_points(msg_cloud, self.translate, True)
        print("  ")
        scores, pred_bbox, types = self.modelInference.infer(numpy_points)

        #transformed_cloud = PointCloud2()

        if scores.size != 0:
            for i in range(scores.size):
                bbox = BoundingBox()
                q = yaw2quat(float(pred_bbox[i][6]))
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
        torch.cuda.empty_cache()
        if len(arr_bbox.boxes) is not 0:
            return CheckFor3DObjectsResponse(req.id, arr_bbox)
            arr_bbox.boxes = []
        else:
            arr_bbox.boxes = []
            return CheckFor3DObjectsResponse(req.id, arr_bbox)


if __name__ == "__main__":

    InferenceRos()
    rospy.spin()
