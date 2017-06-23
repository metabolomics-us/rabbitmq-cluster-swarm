#!/bin/bash

if [ "$SLAVE" == "true" ]
then
  while ! nc -z rabbit-master 4369
  do
    sleep 1
  done
  rabbitmq-server -detached
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@rabbit-master
  rabbitmqctl start_app
else
  rabbitmq-server -detached
fi

sleep infinity
