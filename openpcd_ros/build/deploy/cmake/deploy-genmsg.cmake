# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "deploy: 0 messages, 1 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Ijsk_recognition_msgs:/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Ipcl_msgs:/opt/ros/melodic/share/pcl_msgs/cmake/../msg;-Ijsk_footstep_msgs:/opt/ros/melodic/share/jsk_footstep_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(deploy_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_custom_target(_deploy_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deploy" "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" "jsk_recognition_msgs/BoundingBox:sensor_msgs/PointCloud2:sensor_msgs/PointField:geometry_msgs/Vector3:geometry_msgs/Pose:jsk_recognition_msgs/BoundingBoxArray:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(deploy
  "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBoxArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deploy
)

### Generating Module File
_generate_module_cpp(deploy
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deploy
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(deploy_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(deploy_generate_messages deploy_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_dependencies(deploy_generate_messages_cpp _deploy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deploy_gencpp)
add_dependencies(deploy_gencpp deploy_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deploy_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(deploy
  "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBoxArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deploy
)

### Generating Module File
_generate_module_eus(deploy
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deploy
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(deploy_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(deploy_generate_messages deploy_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_dependencies(deploy_generate_messages_eus _deploy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deploy_geneus)
add_dependencies(deploy_geneus deploy_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deploy_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(deploy
  "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBoxArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deploy
)

### Generating Module File
_generate_module_lisp(deploy
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deploy
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(deploy_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(deploy_generate_messages deploy_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_dependencies(deploy_generate_messages_lisp _deploy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deploy_genlisp)
add_dependencies(deploy_genlisp deploy_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deploy_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(deploy
  "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBoxArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deploy
)

### Generating Module File
_generate_module_nodejs(deploy
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deploy
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(deploy_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(deploy_generate_messages deploy_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_dependencies(deploy_generate_messages_nodejs _deploy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deploy_gennodejs)
add_dependencies(deploy_gennodejs deploy_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deploy_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(deploy
  "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/jsk_recognition_msgs/cmake/../msg/BoundingBoxArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deploy
)

### Generating Module File
_generate_module_py(deploy
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deploy
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(deploy_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(deploy_generate_messages deploy_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/deploy/srv/CheckFor3DObjects.srv" NAME_WE)
add_dependencies(deploy_generate_messages_py _deploy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deploy_genpy)
add_dependencies(deploy_genpy deploy_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deploy_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deploy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deploy
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(deploy_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET jsk_recognition_msgs_generate_messages_cpp)
  add_dependencies(deploy_generate_messages_cpp jsk_recognition_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deploy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deploy
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(deploy_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET jsk_recognition_msgs_generate_messages_eus)
  add_dependencies(deploy_generate_messages_eus jsk_recognition_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deploy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deploy
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(deploy_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET jsk_recognition_msgs_generate_messages_lisp)
  add_dependencies(deploy_generate_messages_lisp jsk_recognition_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deploy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deploy
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(deploy_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET jsk_recognition_msgs_generate_messages_nodejs)
  add_dependencies(deploy_generate_messages_nodejs jsk_recognition_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deploy)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deploy\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deploy
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(deploy_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET jsk_recognition_msgs_generate_messages_py)
  add_dependencies(deploy_generate_messages_py jsk_recognition_msgs_generate_messages_py)
endif()
