set shell := ["bash", "-ic"]

build-px4:
    docker build -f docker/px4-simulator.dockerfile \
    --network=host \
    -t px4-gazebo-harmonic:v1 .

run-px4:
    docker run -it --gpus all \
        --rm \
        --entrypoint bash \
        --privileged --network host \
        -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 \
        -e ACCEPT_EULA=Y -e PRIVACY_CONSENT=Y \
        -v $HOME/.Xauthority:/root/.Xauthority \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --name px4-gazebo-harmonic-tmp \
        px4-gazebo-harmonic:v1

clean-image:
    docker rmi -f px4-gazebo-harmonic:v1

enter-px4:
    docker exec -it px4-gazebo-harmonic-tmp /bin/bash

clean-px4:
    docker rm -f px4-gazebo-harmonic-tmp

df-docker:
    docker system df

# for development
build-dev:
    docker build -f docker/px4-gazebo-dev.dockerfile \
    --network=host \
    -t px4-gazebo-harmonic-dev:v1 .

run-dev:
    docker run -it --gpus all \
        --rm \
        --entrypoint bash \
        --privileged --network host \
        -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 \
        -e ACCEPT_EULA=Y -e PRIVACY_CONSENT=Y \
        -v $HOME/.Xauthority:/root/.Xauthority \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v {{justfile_directory()}}:/root/PX4-Neupilot \
        --name px4-gazebo-harmonic-dev \
        --workdir /root/PX4-Neupilot \
        px4-gazebo-harmonic-dev:v1 \
        -c "git config --global --add safe.directory '*'; exec bash"


enter-dev:
    docker exec -it px4-gazebo-harmonic-dev /bin/bash

make:
    make px4_sitl_default

clean-dev:
    docker rmi px4-gazebo-harmonic-dev:v1
