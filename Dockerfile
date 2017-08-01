FROM demoregistry.dataman-inc.com/pufa/rhel-go:1.8.3


RUN yum install -y epel-release --releasever=7 && \    
    yum install -y  --releasever=7 software-properties-common git libnl3-cli libnl3 mercurial supervisor  haproxy  && \
    rm -rf /var/cache/yum/x86_64

ADD builder/supervisord.conf.prod /etc/supervisord.conf.prod
ADD builder/run.sh /run.sh

WORKDIR /go/src/github.com/QubitProducts/bamboo

RUN go get github.com/tools/godep && \
    go get -t github.com/smartystreets/goconvey

ADD . /go/src/github.com/QubitProducts/bamboo

RUN go build && \
    ln -s /go/src/github.com/QubitProducts/bamboo /var/bamboo && \
    mkdir -p /run/haproxy && \
    mkdir -p /var/log/supervisor && \
    rm -rf /etc/haproxy
   

ADD /builder/haproxy /etc/haproxy 

EXPOSE 80 8000

CMD /run.sh

