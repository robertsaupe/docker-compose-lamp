FROM phpmyadmin/phpmyadmin

# Enable apache ssl
RUN cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default-ssl.conf
RUN sed -ri -e 's,80,443,' /etc/apache2/sites-available/default-ssl.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLEngine on' /etc/apache2/sites-available/default-ssl.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateFile "/etc/apache2/ssl/ssl.crt"' /etc/apache2/sites-available/default-ssl.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateKeyFile "/etc/apache2/ssl/ssl.key"' /etc/apache2/sites-available/default-ssl.conf
RUN mkdir -p /etc/apache2/ssl/
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=../ST=...../L=..../O=..../CN=..." \
    -keyout /etc/apache2/ssl/ssl.key -out /etc/apache2/ssl/ssl.crt
RUN mkdir -p /var/run/apache2/
RUN a2enmod ssl \
    && a2ensite default-ssl \
    && c_rehash /etc/apache2/ssl/
