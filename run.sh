docker run -d  --net host --name=dcos-bamboo \
       --log-opt max-file=10 --log-opt max-size=20k \
       -e MARATHON_ENDPOINT=http://172.30.131.25:8080,http://172.30.131.26:8080,http://172.30.131.27:8080 \
       -e MARATHON_USER=admin \
       -e MARATHON_PASSWORD=xxxx \
       -e BAMBOO_ENDPOINT=http://172.30.131.21:8000 \
       -e BAMBOO_ZK_HOST=172.30.131.25:2181,172.30.131.26:2181,172.30.131.27:2181 \
       -e MARATHON_USE_EVENT_STREAM=true \
       --privileged=true \
       demoregistry.dataman-inc.com/pufa/rhel-bamboo-0.3.0
