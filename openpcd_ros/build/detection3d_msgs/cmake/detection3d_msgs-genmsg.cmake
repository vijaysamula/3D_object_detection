# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "detection3d_msgs: 3 messages, 0 services")

set(MSG_I_FLAGS "-Idetection3d_msgs:/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(detection3d_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_custom_target(_detection3d_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection3d_msgs" "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_custom_target(_detection3d_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection3d_msgs" "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:detection3d_msgs/OrientedBox:geometry_msgs/Point"
)

get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_custom_target(_detection3d_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection3d_msgs" "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" "detection3d_msgs/OrientedBox:detection3d_msgs/DetectedObject3D:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_cpp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_cpp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg"
  "${MSG_I_FLAGS}"
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(detection3d_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(detection3d_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(detection3d_msgs_generate_messages detection3d_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_cpp _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_cpp _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_cpp _detection3d_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection3d_msgs_gencpp)
add_dependencies(detection3d_msgs_gencpp detection3d_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection3d_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_eus(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_eus(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg"
  "${MSG_I_FLAGS}"
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(detection3d_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(detection3d_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(detection3d_msgs_generate_messages detection3d_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_eus _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_eus _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_eus _detection3d_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection3d_msgs_geneus)
add_dependencies(detection3d_msgs_geneus detection3d_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection3d_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_lisp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_lisp(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg"
  "${MSG_I_FLAGS}"
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(detection3d_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(detection3d_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(detection3d_msgs_generate_messages detection3d_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_lisp _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_lisp _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_lisp _detection3d_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection3d_msgs_genlisp)
add_dependencies(detection3d_msgs_genlisp detection3d_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection3d_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_nodejs(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_nodejs(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg"
  "${MSG_I_FLAGS}"
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(detection3d_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(detection3d_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(detection3d_msgs_generate_messages detection3d_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_nodejs _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_nodejs _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_nodejs _detection3d_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection3d_msgs_gennodejs)
add_dependencies(detection3d_msgs_gennodejs detection3d_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection3d_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_py(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs
)
_generate_msg_py(detection3d_msgs
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg"
  "${MSG_I_FLAGS}"
  "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg;/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(detection3d_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(detection3d_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(detection3d_msgs_generate_messages detection3d_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/OrientedBox.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_py _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3D.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_py _detection3d_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/3D-object-detection/openpcd_ros/src/detection3d_msgs/msg/DetectedObject3DArray.msg" NAME_WE)
add_dependencies(detection3d_msgs_generate_messages_py _detection3d_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection3d_msgs_genpy)
add_dependencies(detection3d_msgs_genpy detection3d_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection3d_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection3d_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(detection3d_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(detection3d_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection3d_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(detection3d_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(detection3d_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection3d_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(detection3d_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(detection3d_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection3d_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(detection3d_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(detection3d_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection3d_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(detection3d_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(detection3d_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
