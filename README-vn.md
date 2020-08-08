# React-Docker

Demo đóng gói và triển khai dự án ReactJs với Docker.
Source code đã được phát sinh sử dụng lệnh

```
npx create-react-app
```

Demo này nhằm giúp các bạn hiểu cách đóng gói Docker Image cho một dự án ReactJs như thế nào.

## Đóng gói React với Docker

Chạy lệnh sau

```
docker build -t nhtua/react-docker .
```

Mình sẽ giải thích một chút về cách Dockerfile hoạt động.
Dockerfile này được viết sử dụng chức năng multi-stage build có từ Docker 1.17.
Với chức năng này, Dockerfile chia làm hai phần.

Phần đầu, sử dụng base image là Node:14 để chạy lệnh build

```
npm install && npm run build
```

Sau khi build, toàn bộ html và các file assets như js, css được đặt ở thư mục /app/build

Phần hai, sử dụng nginx để chạy web server phục vụ static html.
Dockerfile sẽ copy file từ stage 1 vào /usr/share/nginx/html là thư mục mặc định chạy webserver của nginx.

Như vậy, chúng ta sử dụng Nginx để làm web server phục vụ ReactJS, sẽ tối ưu hiệu năng hơn là sử dụng `npm start` chạy ở development mode.

## Triển khai react-docker lên server

Có hai file chính:
- `docker-compose.yaml` đây là file để khai báo cách chạy image react-docker
- `deploy.sh` script này giúp triển khai image mới nhất của react-docker. Mỗi lần chạy nó sẽ xóa container hiện tại, tải về image mới nhất và chạy phiên bản mới lên.

Cách chạy đơn giản như sau:

```
./deploy.sh
```
