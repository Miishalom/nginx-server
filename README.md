# ReadMe

Nginx server with CertBot in Docker-Compose 

```
docker compose up --build -d
```

certonly --webroot -w /var/www/html --email mmlomonosov@gmail.com -d cloudgram.online -d api.cloudgram.online -d app.cloudgram.online -d funpay.cloudgram.online -d test.cloudgram.online --cert-name=certfolder --key-type rsa --agree-tos --non-interactive