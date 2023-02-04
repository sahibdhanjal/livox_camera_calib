# https://roboticseabass.com/2021/04/21/docker-and-ros/

xhost + local:
docker run -it -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority -v $HOME/code/catkin_ws/src/:/home/catkin_ws/src -v $HOME/code/catkin_ws/data/:/home/data/ --net=host --name=livox ros:latest
xhost - local:
