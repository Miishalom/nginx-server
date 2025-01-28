# About
Nginx server with CertBot in Docker-Compose

# How to start
### 1. Clone repository
```
git clone https://github.com/Miishalom/Nginx-Certbot-With-Auto-Renew.git
```

### 2. Setting nginx
Set your domain and settings in nginx/nginx.conf. **No need to remove comments yet ("#")!**

For example:
```
server_name ~^(?<subdomain>.*)\.mysitedomain\.online mysitedomain.online;
```

### 3. Start Docker
```
docker compose up -d
```

### 4. Connect SSL certificate
Delete all comments ("#") from nginx/nginx.conf. And restart nginx
```
docker compose down
```
```
docker compose up -d --build
```

### 5. Enable auto renewing certificate
Go to crontab
```
crontab -e
```

```
docker compose up -d --build
```

sudo apt install apache2-utils
sudo htpasswd -c /etc/nginx/.htpasswd your_username

docker compose run --rm certbot certdocker-compose run --rm certbot certonly --webroot -w /var/www/html --email mail@mail.com -d domain.domain --cert-name=certfolder --key-type rsa --agree-tos --non-interactiveonly --webroot -w /var/www/html --email mail@mail.com -d domain.domain --cert-name=certfolder --key-type rsa --agree-tos --non-interactive