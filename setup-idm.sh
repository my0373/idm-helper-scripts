#!/usr/bin/bash 
PASSWORD="redhat123"
DOMAIN="lab.nixgeek.co.uk" 
REALM="LAB.NIXGEEK.CO.UK" 
HOSTNAME="idm-server.lab.nixgeek.co.uk"
INSTALL_LOG_LOCATION="/var/log/idm-install-log"
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
			    --mkhomedir
## Convenience as i'm lazy
systemctl stop firewalld
systemctl disable firewalld
