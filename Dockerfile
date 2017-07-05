FROM rabbitmq:3.6.9-management

MAINTAINER Nicolas Singh <nicolas.singh@gmail.com>

RUN apt-get update && \
  apt-get install netcat -y && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/
RUN chmod +x /sbin/entrypoint.sh

ADD https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/rabbitmq-3.6.9.1/accept-0.3.0.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
ADD https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/rabbitmq-3.6.9.1/prometheus-3.2.2.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
ADD https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/rabbitmq-3.6.9.1/prometheus_httpd-1.1.1.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
ADD https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/rabbitmq-3.6.9.1/prometheus_process_collector-1.0.2.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
ADD https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/rabbitmq-3.6.9.1/prometheus_rabbitmq_exporter-v3.6.9.1.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
RUN rabbitmq-plugins enable --offline prometheus accept prometheus_rabbitmq_exporter prometheus_process_collector prometheus_httpd

CMD ["/sbin/entrypoint.sh"]
