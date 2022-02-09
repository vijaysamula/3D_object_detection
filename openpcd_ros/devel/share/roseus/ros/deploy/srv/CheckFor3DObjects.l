;; Auto-generated. Do not edit!


(when (boundp 'deploy::CheckFor3DObjects)
  (if (not (find-package "DEPLOY"))
    (make-package "DEPLOY"))
  (shadow 'CheckFor3DObjects (find-package "DEPLOY")))
(unless (find-package "DEPLOY::CHECKFOR3DOBJECTS")
  (make-package "DEPLOY::CHECKFOR3DOBJECTS"))
(unless (find-package "DEPLOY::CHECKFOR3DOBJECTSREQUEST")
  (make-package "DEPLOY::CHECKFOR3DOBJECTSREQUEST"))
(unless (find-package "DEPLOY::CHECKFOR3DOBJECTSRESPONSE")
  (make-package "DEPLOY::CHECKFOR3DOBJECTSRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(if (not (find-package "JSK_RECOGNITION_MSGS"))
  (ros::roseus-add-msgs "jsk_recognition_msgs"))


(defclass deploy::CheckFor3DObjectsRequest
  :super ros::object
  :slots (_id _pc2 ))

(defmethod deploy::CheckFor3DObjectsRequest
  (:init
   (&key
    ((:id __id) 0)
    ((:pc2 __pc2) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pc2 __pc2)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pc2
   (&rest __pc2)
   (if (keywordp (car __pc2))
       (send* _pc2 __pc2)
     (progn
       (if __pc2 (setq _pc2 (car __pc2)))
       _pc2)))
  (:serialization-length
   ()
   (+
    ;; int16 _id
    2
    ;; sensor_msgs/PointCloud2 _pc2
    (send _pc2 :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _id
       (write-word _id s)
     ;; sensor_msgs/PointCloud2 _pc2
       (send _pc2 :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; sensor_msgs/PointCloud2 _pc2
     (send _pc2 :deserialize buf ptr-) (incf ptr- (send _pc2 :serialization-length))
   ;;
   self)
  )

(defclass deploy::CheckFor3DObjectsResponse
  :super ros::object
  :slots (_id _bounding_boxes ))

(defmethod deploy::CheckFor3DObjectsResponse
  (:init
   (&key
    ((:id __id) 0)
    ((:bounding_boxes __bounding_boxes) (instance jsk_recognition_msgs::BoundingBoxArray :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _bounding_boxes __bounding_boxes)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:bounding_boxes
   (&rest __bounding_boxes)
   (if (keywordp (car __bounding_boxes))
       (send* _bounding_boxes __bounding_boxes)
     (progn
       (if __bounding_boxes (setq _bounding_boxes (car __bounding_boxes)))
       _bounding_boxes)))
  (:serialization-length
   ()
   (+
    ;; int16 _id
    2
    ;; jsk_recognition_msgs/BoundingBoxArray _bounding_boxes
    (send _bounding_boxes :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _id
       (write-word _id s)
     ;; jsk_recognition_msgs/BoundingBoxArray _bounding_boxes
       (send _bounding_boxes :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; jsk_recognition_msgs/BoundingBoxArray _bounding_boxes
     (send _bounding_boxes :deserialize buf ptr-) (incf ptr- (send _bounding_boxes :serialization-length))
   ;;
   self)
  )

(defclass deploy::CheckFor3DObjects
  :super ros::object
  :slots ())

(setf (get deploy::CheckFor3DObjects :md5sum-) "121b3f4d608b21c3413c103ca56ebd0a")
(setf (get deploy::CheckFor3DObjects :datatype-) "deploy/CheckFor3DObjects")
(setf (get deploy::CheckFor3DObjects :request) deploy::CheckFor3DObjectsRequest)
(setf (get deploy::CheckFor3DObjects :response) deploy::CheckFor3DObjectsResponse)

(defmethod deploy::CheckFor3DObjectsRequest
  (:response () (instance deploy::CheckFor3DObjectsResponse :init)))

(setf (get deploy::CheckFor3DObjectsRequest :md5sum-) "121b3f4d608b21c3413c103ca56ebd0a")
(setf (get deploy::CheckFor3DObjectsRequest :datatype-) "deploy/CheckFor3DObjectsRequest")
(setf (get deploy::CheckFor3DObjectsRequest :definition-)
      "int16 id
sensor_msgs/PointCloud2 pc2

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
int16 id
jsk_recognition_msgs/BoundingBoxArray bounding_boxes

================================================================================
MSG: jsk_recognition_msgs/BoundingBoxArray
# BoundingBoxArray is a list of BoundingBox.
# You can use jsk_rviz_plugins to visualize BoungingBoxArray on rviz.
Header header
BoundingBox[] boxes

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: jsk_recognition_msgs/BoundingBox
# BoundingBox represents a oriented bounding box.
Header header
geometry_msgs/Pose pose
geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)
# You can use this field to hold value such as likelihood
float32 value
uint32 label

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get deploy::CheckFor3DObjectsResponse :md5sum-) "121b3f4d608b21c3413c103ca56ebd0a")
(setf (get deploy::CheckFor3DObjectsResponse :datatype-) "deploy/CheckFor3DObjectsResponse")
(setf (get deploy::CheckFor3DObjectsResponse :definition-)
      "int16 id
sensor_msgs/PointCloud2 pc2

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
int16 id
jsk_recognition_msgs/BoundingBoxArray bounding_boxes

================================================================================
MSG: jsk_recognition_msgs/BoundingBoxArray
# BoundingBoxArray is a list of BoundingBox.
# You can use jsk_rviz_plugins to visualize BoungingBoxArray on rviz.
Header header
BoundingBox[] boxes

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: jsk_recognition_msgs/BoundingBox
# BoundingBox represents a oriented bounding box.
Header header
geometry_msgs/Pose pose
geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)
# You can use this field to hold value such as likelihood
float32 value
uint32 label

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :deploy/CheckFor3DObjects "121b3f4d608b21c3413c103ca56ebd0a")


