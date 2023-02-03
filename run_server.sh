# https://roboticseabass.com/2021/04/21/docker-and-ros/
XSOCK=/tmp/.X11-unix
xhost +"local:docker@"

docker run -it \
    --gpus 'all,"capabilities=compute,utility,display"' \
    -e DISPLAY=$DISPLAY \
    -v $XSOCK=$XSOCK \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v $PWD:/home/catkin_ws/src/ \
    -v /Users/sdhanjal/Documents/Output/:/home/data/ \
    --privileged \
    --net=host \
    "$@"
