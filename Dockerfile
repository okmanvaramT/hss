
FROM alpine:3.22

RUN apk add --no-cache openssh-server shadow \
    && mkdir -p /run/sshd \
    && adduser -D -h /home/vpnuser vpnuser

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh

RUN sed -i 's/\r$//' /entrypoint.sh \
    && chmod +x /entrypoint.sh

EXPOSE 2222

CMD ["/bin/sh", "/entrypoint.sh"]
