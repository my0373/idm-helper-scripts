#!/usr/bin/bash 
PASSWORD="redhat123"
DOMAIN="lab.nixgeek.co.uk" 
REALM="LAB.NIXGEEK.CO.UK" 
HOSTNAME="idm-server.lab.nixgeek.co.uk"
INSTALL_LOG_LOCATION="/var/log/idm-install-log"
NTP_SERVER="172.16.0.1"
/usr/sbin/ipa-server-install  \
			    --unattended  \
    			    --ds-password=${PASSWORD}  \
    			    --admin-password=${PASSWORD}  \
    			    --domain=${DOMAIN} \
    			    --realm=${REALM} \
    			    --hostname=${HOSTNAME} \
    			    --no-host-dns  \
    			    --setup-kra  \
                            --setup-dns	 \
    			    --allow-zone-overlap  \
    			    --auto-reverse  \
    			    --auto-forwarders  \
    			    --forward-policy=only  \
    			    --log-file=${INSTALL_LOG_LOCATION}  \
			    --mkhomedir  \
			    --ntp-server=${NTP_SERVER}
## Convenience as i'm lazy
systemctl stop firewalld
systemctl disable firewalld
