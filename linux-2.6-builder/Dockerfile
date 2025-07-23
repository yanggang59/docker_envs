FROM uilianries/conangcc41
WORKDIR /workspace

RUN sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY CentOS-Base.repo /etc/yum.repos.d/

RUN sudo yum clean all &&  sudo yum makecache 
RUN sudo yum install libelf libelf-devel elfutils-libelf-devel.x86_64 elfutils-libelf.x86_64 openssl openssl-devel openssl-devel.x86_64 openssl-libs.x86_64 -y 
RUN sudo yum install flex ncurses.x86_64 ncurses-devel.x86_64 ncurses-libs.x86_64 vim -y
RUN sudo yum install autoconf automake -y

  
