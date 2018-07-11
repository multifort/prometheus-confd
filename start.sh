#!/bin/bash
etcd=$ETCD_ENDPOINT

# Start prometheus in the background 
/bin/prometheus --web.enable-lifecycle --config.file=/etc/prometheus/prometheus.yml &
echo "[prometheus-confd] starting prometheus service..."

#Run confd to watch the prometheus server
echo "[prometheus-confd] confd is listening for changes on etcd..."
/bin/confd -interval=10 -backend=etcdv3 -node=$etcd  -confdir=/etc/confd 
