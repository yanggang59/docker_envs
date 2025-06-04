FROM seladb-centos7:latest
WORKDIR /workspace

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN cd /etc/yum.repos.d/ && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
RUN yum makecache && yum update -y
RUN yum install libelf libelf-devel elfutils-libelf-devel.x86_64 elfutils-libelf.x86_64 openssl openssl-devel openssl-devel.x86_64 openssl-libs.x86_64 -y 
