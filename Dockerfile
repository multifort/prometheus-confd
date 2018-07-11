FROM quay.io/prometheus/prometheus:latest
MAINTAINER bocloud.lining
ARG ETCD_ENDPOINT 
USER root
COPY confd-0.16 /bin/confd
COPY curl.ermine /bin/curl
COPY start.sh /start.sh
COPY confd /etc/confd
COPY prometheus/prometheus.yml /etc/prometheus/prometheus.yml
RUN chmod +x /bin/confd && chmod +x /start.sh && chmod +x /bin/curl
ENTRYPOINT exec /bin/sh /start.sh
