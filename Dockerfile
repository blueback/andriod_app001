# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }
FROM gcc:latest

RUN apt-get -y update && apt-get install -y

RUN apt-get -y install build-essential

RUN apt-get -y install gdb

RUN apt-get -y install make cmake 

RUN apt-get -y install net-tools
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
