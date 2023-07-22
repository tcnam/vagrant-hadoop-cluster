#!/bin/bash
tr -d '\r' < "/vagrant/scripts/commontemp.sh" > "/vagrant/scripts/common.sh"
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