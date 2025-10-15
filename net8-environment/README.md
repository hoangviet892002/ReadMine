# .NET 8 Development Environment (Docker)

Môi trường phát triển .NET 8 chạy bằng Docker.

## Khởi chạy môi trường

```bash
cd net8-environment
# chạy nền
docker compose up -d
# hoặc chạy foreground để xem log
# docker compose up
```

## Vào container và chạy lệnh dotnet

```bash
docker exec -it net8-sdk bash
# trong container:
dotnet --info
# restore/build/test
cd /src
dotnet restore
dotnet build -c Release
# chạy app console
# dotnet run --project path/to/YourApp.csproj
# chạy web (đã map port 8080)
# ASPNETCORE_URLS=http://0.0.0.0:8080 dotnet run --project path/to/YourWebApp.csproj
```

## Chạy one-off không cần up nền

```bash
# Restore
docker run --rm -v "$PWD":/src -v "$HOME/.nuget/packages":/root/.nuget/packages -w /src mcr.microsoft.com/dotnet/sdk:8.0 dotnet restore
# Build
docker run --rm -v "$PWD":/src -v "$HOME/.nuget/packages":/root/.nuget/packages -w /src mcr.microsoft.com/dotnet/sdk:8.0 dotnet build -c Release
# Run web (map port)
docker run --rm -v "$PWD":/src -w /src -p 8080:8080 -e ASPNETCORE_URLS=http://0.0.0.0:8080 mcr.microsoft.com/dotnet/sdk:8.0 dotnet run --project path/to/YourWebApp.csproj
```

## Tránh file build thuộc root (Linux)

Mở comment dòng `user: "${UID}:${GID}"` trong `docker-compose.yml` hoặc thêm option `-u $(id -u):$(id -g)` khi `docker run`.

## MySQL (tùy chọn)

Nếu cần DB, mở comment service `mysql` trong `docker-compose.yml` và chỉnh `ConnectionStrings`:
```
Server=mysql;Port=3306;Database=appdb;User Id=app;Password=app123;
```

## Dừng môi trường

```bash
docker compose down
# xóa volumes (nếu bật mysql)
# docker compose down -v
```
