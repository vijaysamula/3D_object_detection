# 3D-Object-Detection
This repository represents the real-time implementation of 3D Object Detection by use of [OpenPCDet](https://github.com/open-mmlab/OpenPCDet). The execution is carried out entirely in [docker](https://www.docker.com/).
Some parts of the code are inspired from [here](https://github.com/Cram3r95/OpenPCDet-ROS).
## Docker 
```
git pull https://github.com/vijaysamula/3D_object_detection.git
docker build -t pcdet .

```
#### 1) To create container of the image.
```
nvidia-docker run  -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:$HOME/.Xauthority -v /path/to/openpcd:/shared/ --net=host --pid=host --ipc=host --cap-add=SYS_PTRACE --name openpcdet_cont pcdet:latest /bin/bash
```

#### 2) Open the container and follow the below procedure to run.
```
cd OpenPCDet 
python3 setup.py develop
cd ../openpcd_ros
catkin_make
source devel/setup.bash
```

#### 3) Change the model_path argument in [openpcd_detector.launch](openpcd_ros/src/deploy/launch/openpcd_detector.launch) to your own path. (These model files can be downloaded from [OpenPCDet](https://github.com/open-mmlab/OpenPCDet))
#### 4) Change the rosbag path in [play_rosbag.launch](openpcd_ros/src/deploy/launch/play_rosbag.launch) to your own path.

#### 5) Finally run the launch file.
```
roslaunch deploy openpcd_detector.launch
```