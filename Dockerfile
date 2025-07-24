FROM lscr.io/linuxserver/obsidian:latest

# 設定環境變數
ENV PUID=1000
ENV PGID=1000
ENV TZ=Asia/Tokyo
ENV CUSTOM_PORT=8080
ENV CUSTOM_HTTPS_PORT=8443
ENV TITLE=Obsidian

# 暴露端口
EXPOSE 8080 8443

# 修改啟動設定以適應 Zeabur
RUN echo "#!/bin/bash\n\
mkdir -p /config /vaults\n\
exec /init" > /custom-init.sh && \
chmod +x /custom-init.sh

ENTRYPOINT ["/custom-init.sh"]
