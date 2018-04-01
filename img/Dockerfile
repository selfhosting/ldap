FROM ubuntu:latest
MAINTAINER mickael@kerjean.me
    
RUN apt-get update && \
    #####################
    # INSTALL APPLICATION    
    apt-get install -y phpldapadmin && \
    #####################
    # CONFIGURATION    
    sed -i 's|#ServerName|ServerName|' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's|DocumentRoot.*|DocumentRoot /usr/share/phpldapadmin|' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's|ServerName.*|ServerName localhost|' /etc/apache2/sites-available/000-default.conf && \
    sed -i "s|// \$config->custom->appearance\['hide_template_warning'\] = false;|\$config->custom->appearance['hide_template_warning'] = true;|" /etc/phpldapadmin/config.php && \
    sed -i "s|$servers->setValue('server','name',.*|$servers->setValue('server','name','LDAP');|" /etc/phpldapadmin/config.php && \
    sed -i '75i<value id="/bin/bash">/bin/bash</value>' /etc/phpldapadmin/templates/creation/posixAccount.xml && \
    #####################
    # INSTALL OTHER RELATED STUFF
    apt-get install -y vim telnet curl ldap-utils && \
    #####################
    # CLEANUP
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
EXPOSE 80
WORKDIR "/etc/phpldapadmin"
ADD entrypoint.sh /entrypoint.sh
CMD ["bash", "/entrypoint.sh"]
    

    