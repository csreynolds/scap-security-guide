# platform = Red Hat Enterprise Linux 6
#
# Set runtime for net.ipv4.conf.default.accept_source_route
#
/sbin/sysctl -q -n -w net.ipv4.conf.default.accept_source_route=0

#
# If net.ipv4.conf.default.accept_source_route present in /etc/sysctl.conf, change value to "0"
#	else, add "net.ipv4.conf.default.accept_source_route = 0" to /etc/sysctl.conf
#
if grep --silent ^net.ipv4.conf.default.accept_source_route /etc/sysctl.conf ; then
	sed -i 's/^net.ipv4.conf.default.accept_source_route.*/net.ipv4.conf.default.accept_source_route = 0/g' /etc/sysctl.conf
else
	echo -e "\n# Set net.ipv4.conf.default.accept_source_route to 0 per security requirements" >> /etc/sysctl.conf
	echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf
fi
