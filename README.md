# metis-kali
#给kali-metis使用的专用kali镜像
#1.直接拉取使用镜像

#2.直接构建镜像
docker build -t ghcr.io/lambsouls/metis-kali:latest https://github.com/lambsouls/metis-kali.git#main

#2.推送镜像到仓库（示例）
docker push ghcr.io/lambsouls/metis-kali:latest
