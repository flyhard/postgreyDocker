#!/bin/bash

if [[ $# -eq 0 ]]
then
	consul_node=consul
else
	consul_node=$1
fi
consul agent -config-dir /etc/consul -join ${consul_node} &

/usr/sbin/postgrey --inet=0.0.0.0:60000