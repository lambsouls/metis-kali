# metis-kali
#给kali-metis使用的专用kali镜像

#1.直接拉取使用镜像
```bash
docker pull ghcr.io/lambsouls/metis-kali:latest
docker run -d --network=host --name metis-kali --privileged ghcr.io/lambsouls/metis-kali:latest bash -c 'echo "root:你的ssh密码" | chpasswd && sed -i "s/#Port 22/Port 你的对外ssh端口/" /etc/ssh/sshd_config && /usr/sbin/sshd -D'
```

#2.直接构建镜像
```bash
docker build -t ghcr.io/lambsouls/metis-kali:latest https://github.com/lambsouls/metis-kali.git#main
```

#2.推送镜像到仓库（示例）
```bash
docker push ghcr.io/lambsouls/metis-kali:latest
```
