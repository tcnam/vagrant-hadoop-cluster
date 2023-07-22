#!/bin/bash
source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"
	yum -y install iptables-services
	service iptables save
	service iptables stop
	chkconfig iptables off
}

echo "setup centos"

disableFirewall