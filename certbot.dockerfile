# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN apt-get update && \
    apt-get install -y certbot cron

RUN mkdir -p /var/spool/cron/crontabs

echo $DOMAINS_ARGS

# Команда для получения сертификатов
CMD ["/bin/bash", "-c", "\
  if [ -z \"$DOMAINS\" ]; then \
    echo 'No DOMAINS var. Exiting.'; \
    exit 1; \
  fi; \
  if [ -z \"$EMAIL\" ]; then \
    echo 'No EMAIL var. Exiting.'; \
    exit 1; \
  fi; \
  if [ -z \"$WORKDIR\" ]; then \
    echo 'No WORKDIR var. Exiting.'; \
    exit 1; \
  fi; \
  DOMAINS_ARGS=\"\"; \
  for DOMAIN in ${DOMAINS//,/ }; do \
    DOMAINS_ARGS=\"$DOMAINS_ARGS -d $DOMAIN\"; \
  done; \
  certbot certonly --webroot -w $WORKDIR --email $EMAIL $DOMAINS_ARGS --cert-name=certfolder --key-type rsa --agree-tos --non-interactive; \
  echo 'Certbot certificates:'; \
  certbot certificates; \
  echo 'Crontab entries:'; \
  crontab -l; \
  echo 'Adding cron job for certbot renewal...'; \
  echo '0 3 * * 1 /usr/bin/certbot renew --quiet' >> /var/spool/cron/crontabs/root; \
  cron -f \
"]
#
#RUN echo "0 3 * * 1 /usr/bin/certbot renew --quiet" >> /var/spool/cron/crontabs/root
#CMD cron -f
