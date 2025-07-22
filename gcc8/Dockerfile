FROM conanio/gcc8
WORKDIR /data

# 配置镜像源
RUN sudo cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sudo sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list
RUN sudo sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list

RUN sudo apt update


RUN sudo apt install bc libelf-dev bison bc libncurses5-dev flex cmake git make build-essential libssl-dev -y
RUN sudo apt install bear vim -y
