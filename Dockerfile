from osrf/ros:melodic-desktop-full
LABEL maintainer "dhanjalsahib@gmail.com"

# Install basics
RUN apt-get update && apt-get install -y \
apt-utils \
dirmngr \
curl \
cmake \
wget \
git \
python-dev \
python-pip \
python3-dev \
python3-pip \
terminator \
libatlas-base-dev \
libeigen3-dev \
libgtest-dev \
libgoogle-glog-dev \
libgflags-dev \
libboost-dev \
libyaml-cpp-dev \
libpcl-dev \
libsuitesparse-dev \
liblz4-tool

RUN pip install -U catkin_tools

RUN mkdir -p /home/deps/ && \
    cd /home/deps/ && \
    wget http://ceres-solver.org/ceres-solver-2.1.0.tar.gz && \
    tar zxf ceres-solver-2.1.0.tar.gz && \
    mkdir ceres-bin && cd ceres-bin && \
    cmake ../ceres-solver-2.1.0 && \
    make -j8 && make install

# https://github.com/ethz-asl/lidar_align/issues/16#issuecomment-504348488
RUN mv /usr/include/flann/ext/lz4.h /usr/include/flann/ext/lz4.h.bak && \
    mv /usr/include/flann/ext/lz4hc.h /usr/include/flann/ext/lz4.h.bak && \
    ln -s /usr/include/lz4.h /usr/include/flann/ext/lz4.h && \
    ln -s /usr/include/lz4hc.h /usr/include/flann/ext/lz4hc.h

# build the ROS package
RUN cd /home/catkin_ws/ && catkin build
