FROM rabbitmq:3.6.9-management

MAINTAINER Nicolas Singh <nicolas.singh@gmail.com>

RUN apt-get update && \
  apt-get install netcat -y && \
  rm -rf /var/lib/apt/lists/* 

COPY entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh

CMD ["/sbin/entrypoint.sh"]
