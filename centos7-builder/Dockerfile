FROM seladb-centos7:latest
WORKDIR /workspace

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN cd /etc/yum.repos.d/ && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
RUN yum makecache && yum update -y
RUN yum install libelf libelf-devel elfutils-libelf-devel.x86_64 elfutils-libelf.x86_64 openssl openssl-devel openssl-devel.x86_64 openssl-libs.x86_64 -y 
RUN yum install flex ncurses.x86_64 ncurses-devel.x86_64 ncurses-libs.x86_64 vim -y
RUN yum install autoconf automake -y

### Build Bear
RUN mkdir /test
COPY Bear-2.4.4.zip /test
RUN cd /test && unzip Bear-2.4.4.zip && cd Bear-2.4.4 && mkdir build && cd build && cmake ../ && make -j32 && make install 
  
