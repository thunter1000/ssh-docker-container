FROM alpine:3.8

RUN apk add --no-cache openssh; \
    adduser -D user; mkdir /home/user/.ssh; chown user:user /home/user/.ssh; chmod 0700 /home/user/.ssh; \
    touch /home/user/.ssh/authorized_keys; chown user:user /home/user/.ssh/authorized_keys; \
    mkdir /config ;

ADD docker-entry.sh /docker-entry.sh

ADD config /config

EXPOSE 22

CMD ["sh", "/docker-entry.sh"]
