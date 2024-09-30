FROM node:latest

#设置工作目录
WORKDIR /hexo

RUN apt update

RUN apt install vim -y

RUN npm cache clean --force

RUN npm config set registry http://registry.npm.taobao.org/

# 安装hexo
RUN npm install hexo-cli -g

# 映射端口
EXPOSE 4000