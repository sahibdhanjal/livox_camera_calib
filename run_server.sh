# https://roboticseabass.com/2021/04/21/docker-and-ros/

docker run --rm -it --net=host -v ${PWD}:/home/catkin_ws/src/ ros:latest
