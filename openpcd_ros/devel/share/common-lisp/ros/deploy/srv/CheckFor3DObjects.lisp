; Auto-generated. Do not edit!


(cl:in-package deploy-srv)


;//! \htmlinclude CheckFor3DObjects-request.msg.html

(cl:defclass <CheckFor3DObjects-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (pc2
    :reader pc2
    :initarg :pc2
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass CheckFor3DObjects-request (<CheckFor3DObjects-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckFor3DObjects-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckFor3DObjects-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deploy-srv:<CheckFor3DObjects-request> is deprecated: use deploy-srv:CheckFor3DObjects-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CheckFor3DObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deploy-srv:id-val is deprecated.  Use deploy-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'pc2-val :lambda-list '(m))
(cl:defmethod pc2-val ((m <CheckFor3DObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deploy-srv:pc2-val is deprecated.  Use deploy-srv:pc2 instead.")
  (pc2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckFor3DObjects-request>) ostream)
  "Serializes a message object of type '<CheckFor3DObjects-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pc2) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckFor3DObjects-request>) istream)
  "Deserializes a message object of type '<CheckFor3DObjects-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pc2) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckFor3DObjects-request>)))
  "Returns string type for a service object of type '<CheckFor3DObjects-request>"
  "deploy/CheckFor3DObjectsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckFor3DObjects-request)))
  "Returns string type for a service object of type 'CheckFor3DObjects-request"
  "deploy/CheckFor3DObjectsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckFor3DObjects-request>)))
  "Returns md5sum for a message object of type '<CheckFor3DObjects-request>"
  "121b3f4d608b21c3413c103ca56ebd0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckFor3DObjects-request)))
  "Returns md5sum for a message object of type 'CheckFor3DObjects-request"
  "121b3f4d608b21c3413c103ca56ebd0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckFor3DObjects-request>)))
  "Returns full string definition for message of type '<CheckFor3DObjects-request>"
  (cl:format cl:nil "int16 id~%sensor_msgs/PointCloud2 pc2~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckFor3DObjects-request)))
  "Returns full string definition for message of type 'CheckFor3DObjects-request"
  (cl:format cl:nil "int16 id~%sensor_msgs/PointCloud2 pc2~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckFor3DObjects-request>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pc2))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckFor3DObjects-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckFor3DObjects-request
    (cl:cons ':id (id msg))
    (cl:cons ':pc2 (pc2 msg))
))
;//! \htmlinclude CheckFor3DObjects-response.msg.html

(cl:defclass <CheckFor3DObjects-response> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (bounding_boxes
    :reader bounding_boxes
    :initarg :bounding_boxes
    :type jsk_recognition_msgs-msg:BoundingBoxArray
    :initform (cl:make-instance 'jsk_recognition_msgs-msg:BoundingBoxArray)))
)

(cl:defclass CheckFor3DObjects-response (<CheckFor3DObjects-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckFor3DObjects-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckFor3DObjects-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deploy-srv:<CheckFor3DObjects-response> is deprecated: use deploy-srv:CheckFor3DObjects-response instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CheckFor3DObjects-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deploy-srv:id-val is deprecated.  Use deploy-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'bounding_boxes-val :lambda-list '(m))
(cl:defmethod bounding_boxes-val ((m <CheckFor3DObjects-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deploy-srv:bounding_boxes-val is deprecated.  Use deploy-srv:bounding_boxes instead.")
  (bounding_boxes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckFor3DObjects-response>) ostream)
  "Serializes a message object of type '<CheckFor3DObjects-response>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_boxes) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckFor3DObjects-response>) istream)
  "Deserializes a message object of type '<CheckFor3DObjects-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_boxes) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckFor3DObjects-response>)))
  "Returns string type for a service object of type '<CheckFor3DObjects-response>"
  "deploy/CheckFor3DObjectsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckFor3DObjects-response)))
  "Returns string type for a service object of type 'CheckFor3DObjects-response"
  "deploy/CheckFor3DObjectsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckFor3DObjects-response>)))
  "Returns md5sum for a message object of type '<CheckFor3DObjects-response>"
  "121b3f4d608b21c3413c103ca56ebd0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckFor3DObjects-response)))
  "Returns md5sum for a message object of type 'CheckFor3DObjects-response"
  "121b3f4d608b21c3413c103ca56ebd0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckFor3DObjects-response>)))
  "Returns full string definition for message of type '<CheckFor3DObjects-response>"
  (cl:format cl:nil "int16 id~%jsk_recognition_msgs/BoundingBoxArray bounding_boxes~%~%================================================================================~%MSG: jsk_recognition_msgs/BoundingBoxArray~%# BoundingBoxArray is a list of BoundingBox.~%# You can use jsk_rviz_plugins to visualize BoungingBoxArray on rviz.~%Header header~%BoundingBox[] boxes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: jsk_recognition_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckFor3DObjects-response)))
  "Returns full string definition for message of type 'CheckFor3DObjects-response"
  (cl:format cl:nil "int16 id~%jsk_recognition_msgs/BoundingBoxArray bounding_boxes~%~%================================================================================~%MSG: jsk_recognition_msgs/BoundingBoxArray~%# BoundingBoxArray is a list of BoundingBox.~%# You can use jsk_rviz_plugins to visualize BoungingBoxArray on rviz.~%Header header~%BoundingBox[] boxes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: jsk_recognition_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckFor3DObjects-response>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_boxes))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckFor3DObjects-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckFor3DObjects-response
    (cl:cons ':id (id msg))
    (cl:cons ':bounding_boxes (bounding_boxes msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckFor3DObjects)))
  'CheckFor3DObjects-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckFor3DObjects)))
  'CheckFor3DObjects-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckFor3DObjects)))
  "Returns string type for a service object of type '<CheckFor3DObjects>"
  "deploy/CheckFor3DObjects")