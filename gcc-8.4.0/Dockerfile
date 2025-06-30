# 阶段1：构建GCC 8.4.0
FROM ubuntu:20.04 AS builder

# 安装构建依赖
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        wget \
        tar \
        xz-utils \
        gzip \
        bison \
        flex \
        libgmp-dev \
        libmpfr-dev \
        libmpc-dev \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 下载GCC 8.4.0源码
WORKDIR /tmp
RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-8.4.0/gcc-8.4.0.tar.xz && \
    tar -xf gcc-8.4.0.tar.xz && \
    cd gcc-8.4.0 && \
    ./contrib/download_prerequisites

# 配置并编译
RUN mkdir build && cd build && \
    ../gcc-8.4.0/configure \
        --prefix=/opt/gcc-8.4.0 \
        --enable-languages=c,c++ \
        --enable-indirect-branch \
	--disable-multilib \
        --disable-bootstrap \
        --enable-checking=release && \
    make -j$(nproc) && \
    make install-strip

# ----------------------------
# 阶段2：生成最终镜像
FROM ubuntu:20.04

# 复制GCC安装文件
COPY --from=builder /opt/gcc-8.4.0 /opt/gcc-8.4.0

# 安装运行时依赖
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libgmp10 \
        libmpfr6 \
        libmpc3 \
	make \
	libc-dev \
        libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV PATH="/opt/gcc-8.4.0/bin:$PATH" \
    LD_LIBRARY_PATH="/opt/gcc-8.4.0/lib64:$LD_LIBRARY_PATH"

# 验证版本
RUN gcc --version

WORKDIR /home/developer
