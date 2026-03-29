FROM pkpofficial/ojs:stable-3_4_0

RUN echo "SetEnvIf X-Forwarded-Proto https HTTPS=on" >> /etc/apache2/conf.d/ojs.conf

# Bundle Pragma theme in the image so styling is reproducible after rebuilds.
COPY themes/pragma /var/www/html/plugins/themes/pragma
