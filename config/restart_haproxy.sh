nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --buffer
haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -D -sf $(cat /var/run/haproxy.pid) &> /dev/null
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --release-indefinite
