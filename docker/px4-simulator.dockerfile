
#
# PX4 Gazebo 8 (Harmonic) development environment in Ubuntu 22.04 Jammy
#

FROM px4io/px4-dev-base-jammy:2024-05-18
LABEL maintainer="Steven Cheng <zhenghw23@foxmail.com>"

# Some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM=1

RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
		ant \
		binutils \
		bc \
		dirmngr \
        dmidecode \
		gz-harmonic \
        libunwind-dev \
        gstreamer1.0-libav \
		pkg-config \
		gstreamer1.0-plugins-bad \
		gstreamer1.0-plugins-base \
		gstreamer1.0-plugins-good \
		gstreamer1.0-plugins-ugly \
		libeigen3-dev \
		libgstreamer-plugins-base1.0-dev \
		libimage-exiftool-perl \
		libopencv-dev \
		libxml2-utils \
		mesa-utils \
		protobuf-compiler \
		x-window-system \
	&& apt-get -y autoremove \
	&& apt-get clean autoclean \
	&& rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*


RUN apt update && apt install -y \
    vim \
    python3-pip python3-venv \
    curl lsb-release gnupg wget

RUN apt update && apt install -y locales \
    && locale-gen en_US.UTF-8 \
    &&  locale-gen zh_CN.UTF-8 \
    &&  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN apt install -y software-properties-common \
    && add-apt-repository universe \
    && apt update \
    && export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') \
    && curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" \
    && dpkg -i /tmp/ros2-apt-source.deb \
    && rm /tmp/ros2-apt-source.deb \
    && apt update

RUN apt install -y ros-humble-ros-base \
    && echo "source /opt/ros/humble/setup.bash" >> ${HOME}/.bashrc


WORKDIR /root/workspace/px4_gazebo_harmonic
COPY . /root/workspace/px4_gazebo_harmonic
RUN bash install-dds-agent.bash

RUN make px4_sitl_default
ENV PATH="/root/workspace/px4_gazebo_harmonic/Tools:$PATH"
# FROM osrf/ros:humble-desktop AS ros-deps

# WORKDIR /plugins
# COPY ../src/aerodynamics plugins/aerodynamics
# COPY ../src/external_libraries plugins/external_libraries
# RUN colcon build


# Version2 is FROM osrf/ros:humble-desktop to install px4-depencies and gazebo-deps,
# which is very slow, since the downloading speed of gazebo server is only around 20KB/s.
# Both two deps can be install by scripts in <PX4-ROOT>Tools/setup/ubuntu.sh
# Here, we provide in docker/px4-setup to avoid the nuttx toolchain installation.
