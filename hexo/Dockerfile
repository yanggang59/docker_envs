FROM node:latest

#设置工作目录
WORKDIR /hexo

RUN npm cache clean --force

RUN npm config set registry http://registry.npm.taobao.org/

# 安装hexo
RUN npm install hexo-cli -g

# 映射端口
EXPOSE 4000

RUN hexo init .
RUN npm install

# 构建Hexo静态文件
RUN hexo generate

# 设置容器启动时执行的命令
CMD ["hexo", "server"]