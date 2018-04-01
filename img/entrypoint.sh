#!/bin/bash
set -e

sed -i "s|$servers->setValue('login','bind_id',.*|$servers->setValue('login','bind_id','cn=admin,$LDAP_BASE');|" /etc/phpldapadmin/config.php
sed -i "s|$servers->setValue('server','host',.*|$servers->setValue('server','host', '$LDAP_SERVER_HOST');|" /etc/phpldapadmin/config.php
sed -i "s|$servers->setValue('server','base',.*|$servers->setValue('server','base',array('$LDAP_BASE'));|" /etc/phpldapadmin/config.php

apachectl -DFOREGROUND
