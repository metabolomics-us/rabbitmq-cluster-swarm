FROM rabbitmq:3.7-management

MAINTAINER Nicolas Singh <nicolas.singh@gmail.com>

RUN apt-get update && \
  apt-get install apt-transport-https ca-certificates -y && \
  apt-get install netcat -y && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh

CMD ["/sbin/entrypoint.sh"]
