FROM rabbitmq:3.6.10-management

MAINTAINER Nicolas Singh <nicolas.singh@gmail.com>

COPY entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh

CMD ["/sbin/entrypoint.sh"]
