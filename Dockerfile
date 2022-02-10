FROM nvidia/cuda:11.5.0-devel-ubuntu18.04

CMD ["bash"]

# ENVIRONMENT STUFF FOR CUDA

RUN ls /usr/local/cuda/bin
ENV LD_LIBRARAY_PATH /usr/local/cuda/lib64:$LD_LIBRARAY_PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
ENV PATH=/usr/local/cuda/bin:$PATH
ENV CUDA_ROOT /usr/local/cuda


RUN apt-get update && apt-get install -yqq  build-essential ninja-build \
  python3-dev python3-pip tig apt-utils curl git cmake unzip autoconf autogen \
  libtool mlocate zlib1g-dev python python3-numpy python3-wheel wget \
  software-properties-common openjdk-8-jdk libpng-dev  \
  libxft-dev vim meld sudo ffmpeg python3-pip libboost-all-dev \
  libyaml-cpp-dev -y && updatedb

# python packages
RUN pip3 install -U pip
RUN pip3 install numpy==1.16.4 \
  onnx==1.5.0 \
  torchvision==0.4.2 \
  pycuda==2018.1.1 \
  opencv_python==3.4.0.12 \
  scipy==1.1.0 \
  Pillow==6.2.0 \
  genpy==2016.1.3 \
  scikit_learn==0.21.3 \
  tensorflow==1.14 \
  PyYAML==5.1  \
  matplotlib==3.3.2 \
  torch==1.3.1 \
  plyfile \
  trimesh==2.35.39 \
  networkx==2.2
  

RUN pip3 install mayavi \
  shapely \
  easydict \
  tqdm 

RUN export uid=1000 gid=1000 && \
  mkdir -p /home/wms && \
  mkdir -p /etc/sudoers.d && \
  echo "wms:x:${uid}:${gid}:wms,,,:/home/wms:/bin/bash" >> /etc/passwd && \
  echo "wms:x:${uid}:" >> /etc/group && \
  echo "wms ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wms && \
  chmod 0440 /etc/sudoers.d/wms && \
  chown ${uid}:${gid} -R /home/wms && \
  adduser wms sudo

# set working directory
ENV HOME /home/wms
WORKDIR $HOME/3d_object_detection/


RUN chown -R wms:wms $HOME/3d_object_detection/
RUN chmod 755 $HOME/3d_object_detection/

ADD . $HOME/3d_object_detection/


# install ros
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
  apt update && \ 
  DEBIAN_FRONTEND=noninteractive apt install -yqq ros-melodic-desktop-full && \
  apt-get install python-rosdep && \
  rosdep init && \
  rosdep update

# install catkin tools
RUN apt-get install -y python-empy 
RUN pip install -U pip catkin-tools trollius

# clean the cache
RUN apt update && \
  apt autoremove --purge -y && \
  apt clean -y

RUN rm -rf /var/lib/apt/lists/*


# to use nvidia driver from within
LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN echo 'source /opt/ros/melodic/setup.bash' >> $HOME/.bashrc && \
  echo 'export PYTHONPATH=/usr/local/lib/python3.5/dist-packages/cv2/:$PYTHONPATH' >> $HOME/.bashrc && \
  echo 'export NO_AT_BRIDGE=1' >> $HOME/.bashrc
