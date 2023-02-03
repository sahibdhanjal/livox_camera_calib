# https://roboticseabass.com/2021/04/21/docker-and-ros/

docker run --rm -it \
    --net=host \
    -e "DISPLAY=$DISPLAY" \
    -v "/tmp/.X11-unix/:/tmp/.X11-unix/" \
    -v ${PWD}:/home/catkin_ws/src/ \
    ros:latest

# Go into the docker container and launch
# cd /home/catkin_ws/ && catkin build && source devel/setup.bash && roslaunch livox_camera_calib calib.launch