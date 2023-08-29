# tuic-docker
[EAimTY/tuic-server](https://github.com/EAimTY/tuic) in docker

## 使用docker-compose部署

需替换users，还有certificate，private_key

docker-compose.yml

```yaml
version: '3.9'
services:
  tuic-server:
    image: liyuanbiao/tuic-server:latest
    container_name: tuic-server
    restart: unless-stopped
    volumes:
      - /root/cert/:/root/cert/
      - ./config.json:/etc/tuic-server/config.json
    network_mode: host
    command: -c /etc/tuic-server/config.json
```
config.json 参考 https://github.com/EAimTY/tuic/tree/dev/tuic-server
```json
{
  "server": "[::]:58838",
  "users": {
    "732a12f5-4a1c-4fe5-abb3-f4adb166e618": "qjRAsMaJN8xu",
    "cf9adadf-9826-441b-aa03-caa50b8e16c1": "HVLaqDbWa9ro"
  },
  "certificate": "/root/cert/fullchain.cer",
  "private_key": "/root/cert/example.com.key",
  "congestion_control": "cubic",
  "alpn": [
    "h3",
    "spdy/3.1"
  ],
  "udp_relay_ipv6": true,
  "zero_rtt_handshake": false,
  "dual_stack": true,
  "auth_timeout": "3s",
  "task_negotiation_timeout": "3s",
  "max_idle_time": "10s",
  "max_external_packet_size": 1500,
  "send_window": 16777216,
  "receive_window": 8388608,
  "gc_interval": "3s",
  "gc_lifetime": "15s",
  "log_level": "warn"
}
```
