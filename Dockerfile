# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }
FROM gcc:latest

RUN apt-get -y update && apt-get install -y

RUN apt-get -y install build-essential

RUN apt-get -y install gdb

RUN apt-get -y install make cmake 

RUN apt-get -y install net-tools

# qemu emulator starting dependencies {
RUN apt-get -y install libpulse0
RUN apt-get -y install libpulse-dev
RUN apt-get -y install pulseaudio

RUN apt-get -y install libnss3
RUN apt-get -y install libnss3-dev
RUN apt-get -y install libnss3-tools

RUN apt-get -y install libxi6
RUN apt-get -y install libxi-dev

RUN apt-get -y install libxkbfile1
RUN apt-get -y install libxkbfile-dev
# }

# TurboVNC dependencies {

# Install window managers {

RUN apt-get -y install lxde
RUN apt-get -y install xfce4

# }

# Install X11 server and related drivers {
RUN apt-get -y install xserver-xorg-video-intel libdrm-intel1
# }

RUN apt-get -y install libpam-dev
RUN apt-get -y install libssl-dev

# }


##################################################################
# Workdir is mounted at this location on the container
# putting working_dir in compose.yaml instead of here.
#
#WORKDIR /usr/src/app001


##################################################################
# Rather that running from here we run in the container
#
#RUN mkdir build; cd build; cmake ..; cmake --build .;

##################################################################
# Disabling direct run and exit(instead keep live so commented)
#
#CMD [ "/usr/bin/bash" ]
