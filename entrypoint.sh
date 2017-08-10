#!/bin/bash

if [[ "$SLAVE" == "true" ]]
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
  sleep 5
  rabbitmqctl add_user $RABBITMQ_DEFAULT_USER $RABBITMQ_DEFAULT_PASS
  rabbitmqctl set_user_tags $RABBITMQ_DEFAULT_USER administrator
  rabbitmqctl set_permissions $RABBITMQ_DEFAULT_USER ".*" ".*" ".*"
fi

sleep infinity
