#!/bin/bash

if [ "$SLAVE" == "true" ]
then
  /usr/sbin/rabbitmq-server -detached
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@rabbit-master
  rabbitmqctl start_app
else
  rabbitmq-server -detached
fi

sleep infinity
