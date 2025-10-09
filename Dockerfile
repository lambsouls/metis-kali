# 使用官方 Kali Linux 滚动发布镜像
# 用于构建给kalimetis的专用kali镜像metis-kali的dockerfile
FROM kalilinux/kali-rolling

RUN echo 'deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib' > /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list

# 更新软件包列表并安装所需软件
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        kali-linux-headless \
        openssh-server \
        --no-install-recommends && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# 允许root通过SSH登录
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# 设置固定的默认root密码
RUN echo 'root:kali' | chpasswd

# 暴露SSH端口
EXPOSE 22

# 启动SSH守护进程
CMD ["/usr/sbin/sshd", "-D"]
