FROM ghcr.io/sytone/obsidian-remote:latest

# 安裝 nginx 和認證工具
RUN apt-get update && apt-get install -y nginx apache2-utils

# 複製 nginx 設定
COPY nginx.conf /etc/nginx/nginx.conf

# 建立認證檔案
RUN htpasswd -cb /etc/nginx/.htpasswd admin your_password

EXPOSE 8080	
