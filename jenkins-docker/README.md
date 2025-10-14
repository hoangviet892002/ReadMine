# Jenkins Docker Setup

Thư mục này chứa cấu hình Docker Compose để chạy Jenkins trong container.

## Cấu trúc thư mục

```
jenkins-docker/
├── docker-compose.yml    # Cấu hình Docker Compose
├── jenkins.yaml        # Cấu hình Jenkins tự động
└── README.md            # Hướng dẫn sử dụng
```

## Cách sử dụng

### 1. Khởi động Jenkins

```bash
cd jenkins-docker
docker-compose up -d
```

### 2. Truy cập Jenkins

Mở trình duyệt và truy cập: http://localhost:8080

### 3. Lấy mật khẩu admin ban đầu

```bash
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### 4. Dừng Jenkins

```bash
docker-compose down
```

### 5. Dừng và xóa volumes (cẩn thận - sẽ mất dữ liệu)

```bash
docker-compose down -v
```

## Cấu hình

### Ports

- **8080**: Jenkins Web UI
- **50000**: Jenkins Agent Port

### Volumes

- `jenkins_home`: Lưu trữ dữ liệu Jenkins
- Docker socket được mount để Jenkins có thể sử dụng Docker

### Networks

- `jenkins-network`: Network riêng cho Jenkins và Docker-in-Docker

## Tính năng

- ✅ Jenkins LTS version
- ✅ Docker-in-Docker support
- ✅ Persistent data storage
- ✅ Auto-restart policy
- ✅ Network isolation
- ✅ Cấu hình tự động với jenkins.yaml

## Lưu ý

1. Đảm bảo Docker đã được cài đặt trên máy host
2. Port 8080 không được sử dụng bởi ứng dụng khác
3. Dữ liệu Jenkins được lưu trong Docker volume `jenkins_home`
4. Để sử dụng Docker trong Jenkins jobs, cần cài đặt Docker plugin

## Troubleshooting

### Jenkins không khởi động được

```bash
docker-compose logs jenkins
```

### Kiểm tra trạng thái containers

```bash
docker-compose ps
```

### Reset Jenkins (xóa tất cả dữ liệu)

```bash
docker-compose down -v
docker-compose up -d
```
