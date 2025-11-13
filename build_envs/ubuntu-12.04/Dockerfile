FROM ubuntu:12.04
WORKDIR /workspace

RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i "s@archive@old-releases@g" /etc/apt/sources.list

RUN apt-get update

RUN apt-get install bc libelf-dev bison bc autotools-dev libncurses5-dev flex -y
RUN apt-get install vim cmake git gcc make build-essential libssl-dev e2fsprogs -y

