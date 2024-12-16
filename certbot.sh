#!/bin/sh

# Выполнение первоначальной команды certonly
certbot certonly --webroot -w /var/www/html --email mmlomonosov@gmail.com -d cloudgram.online -d api.cloudgram.online -d app.cloudgram.online -d funpay.cloudgram.online -d test.cloudgram.online --cert-name=certfolder --key-type rsa --agree-tos --non-interactive

# Запуск бесконечного цикла для обновления сертификатов
while true; do
  certbot renew --quiet
  sleep 12h
done
