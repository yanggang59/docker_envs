# 阶段1：构建GCC（使用临时镜像）
FROM ubuntu:22.04 AS builder

# 安装构建依赖项
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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

# 下载GCC源码
WORKDIR /tmp/gcc-build
RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-12.3.0/gcc-12.3.0.tar.xz && \
    tar -xf gcc-12.3.0.tar.xz && \
    cd gcc-12.3.0 && \
    ./contrib/download_prerequisites

# 配置并编译GCC
RUN mkdir build && cd build && \
    ../gcc-12.3.0/configure \
        --prefix=/opt/gcc-12.3.0 \
        --enable-languages=c,c++ \
	--enable-indirect-branch \
        --disable-multilib \
        --disable-bootstrap \
        --enable-checking=release && \
    make -j$(nproc) && \
    make install-strip

# ----------------------------
# 阶段2：生成最终镜像（仅保留运行时文件）
FROM ubuntu:22.04

# 复制GCC安装文件和运行时依赖
COPY --from=builder /opt/gcc-12.3.0 /opt/gcc-12.3.0

# 安装运行时依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgmp10 \
        libmpfr6 \
        libmpc3 \
        libstdc++6 \
	make \
	binutils \
    && rm -rf /var/lib/apt/lists/*

# 配置环境变量
ENV PATH="/opt/gcc-12.3.0/bin:$PATH" \
    LD_LIBRARY_PATH="/opt/gcc-12.3.0/lib64:$LD_LIBRARY_PATH"
# 验证GCC版本
RUN gcc --version

# 设置非root用户（安全最佳实践）
#RUN useradd -m developer && \
#chown -R developer:developer /opt/gcc-12.3.0
#USER developer
WORKDIR /home/developer
