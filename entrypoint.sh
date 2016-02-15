#!/bin/bash

curl -X PUT -d '{"Datacenter":"dc1", "Node":"postgrey","Address": "postgrey", "Service": {"Service":"postgrey", "Port": 60000}}' http://${CONSUL_PORT_8500_TCP_ADDR}:${CONSUL_PORT_8500_TCP_PORT}/v1/catalog/register

exec $@
