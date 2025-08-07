FROM ubuntu:22.04
WORKDIR /workspace

RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/
RUN apt-get update

RUN apt-get install bc libelf-dev libc6-dev bison bc autotools-dev libncurses5-dev flex -y
RUN apt-get install vim cmake git gcc make build-essential libssl-dev -y
