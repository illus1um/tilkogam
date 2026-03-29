FROM pkpofficial/ojs:stable-3_4_0

RUN echo "SetEnvIf X-Forwarded-Proto https HTTPS=on" >> /etc/apache2/conf.d/ojs.conf
