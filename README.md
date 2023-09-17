[EAimTY/tuic](https://github.com/EAimTY/tuic) in docker

Dockerfile请查看 https://raw.githubusercontent.com/Jiraiya8/docker-tuic/main/Dockerfile

## 服务端

docker-compose.yml

```yaml
version: '3.9'
services:
  tuic-server:
    image: liyuanbiao/tuic-server:latest
    container_name: tuic-server
    restart: unless-stopped
    volumes:
      # 替换成你的证书目录
      - /root/cert/:/root/cert/
      - ./server.json:/etc/tuic/server.json
    network_mode: host
```
server.json 参考 https://github.com/EAimTY/tuic/tree/dev/tuic-server


## 客户端

docker-compose.yml

```yaml
version: '3.9'
services:
  tuic-server:
    image: liyuanbiao/tuic-client:latest
    container_name: tuic-client
    restart: unless-stopped
    volumes:
      - ./client.json:/etc/tuic/client.json
    network_mode: host
```
client.json 参考 https://github.com/EAimTY/tuic/tree/dev/tuic-client

