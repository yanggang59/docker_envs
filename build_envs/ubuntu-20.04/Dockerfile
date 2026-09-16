FROM dokken/ubuntu-20.04


WORKDIR /workspace

COPY sources.list /etc/apt/sources.list

RUN apt-get update

RUN apt-get install bc libelf-dev bison bc autotools-dev libncurses5-dev flex -y
RUN apt-get install vim cmake git gcc make build-essential libssl-dev -y
RUN apt install python3 python3-pip bear autoconf -y
RUN apt-get install linux-headers-5.4.0-42-generic -y
