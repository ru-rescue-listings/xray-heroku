FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip && \
    curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip -o /tmp/xray.zip -d /usr/local/bin xray geoip.dat geosite.dat && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip && \
    apk del curl unzip
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
