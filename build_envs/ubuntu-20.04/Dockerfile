FROM dokken/ubuntu-20.04
WORKDIR /data

# 配置镜像源
RUN sudo cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sudo sed -i "s@http://.*archive.ubuntu.com@https://mirrors.ustc.edu.cn@g" /etc/apt/sources.list
RUN sudo sed -i "s@http://.*security.ubuntu.com@https://mirrors.ustc.edu.cn@g" /etc/apt/sources.list

RUN sudo apt update

RUN sudo apt install bc libelf-dev bison bc autotools-dev libncurses5-dev flex -y
RUN sudo apt install vim cmake git gcc make build-essential libssl-dev -y
