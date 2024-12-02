FROM dokken/ubuntu-20.04
WORKDIR /data

# 配置镜像源
RUN sudo cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sudo sed -i "s@http://.*archive.ubuntu.com@https://mirrors.ustc.edu.cn@g" /etc/apt/sources.list
RUN sudo sed -i "s@http://.*security.ubuntu.com@https://mirrors.ustc.edu.cn@g" /etc/apt/sources.list

RUN sudo apt update

RUN sudo apt install bc libelf-dev bison bc autotools-dev libncurses5-dev flex -y
RUN sudo apt install vim cmake git gcc make build-essential libssl-dev gcc-multilib -y
RUN sudo apt install nasm qemu qemu-kvm libgmp3-dev libmpc-dev libmpfr-dev texinfo curl -y


RUN mkdir /tmp/src && cd /tmp/src
RUN curl -O https://mirror.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.39.tar.gz && tar xf binutils-2.39.tar.gz
RUN mkdir binutils-build && cd binutils-build 
RUN ../binutils-2.39/configure --target=i386-elf --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=/usr/local/i386elfgcc 2>&1 | tee configure.log
RUN sudo make all install 2>&1 | tee make.log

RUN cd /tmp/src
RUN curl -O https://mirror.tuna.tsinghua.edu.cn/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.gz
RUN tar xf gcc-12.2.0.tar.gz
RUN cd gcc-12.2.0 && ./configure --target=i386-elf --prefix=/usr/local/i386elfgcc --disable-nls --disable-libssp --enable-language=c,c++ --without-headers --enable-multilib
RUN echo "MAKE ALL-GCC:"
RUN cd gcc-12.2.0 && sudo make all-gcc -j16
RUN echo "MAKE ALL-TARGET-LIBGCC:"
RUN cd gcc-12.2.0 && sudo make all-target-libgcc -j16
RUN echo "MAKE INSTALL-GCC:"
RUN cd gcc-12.2.0 && sudo make install-gcc -j16
RUN echo "MAKE INSTALL-TARGET-LIBGCC:"
RUN cd gcc-12.2.0 && sudo make install-target-libgcc -j16