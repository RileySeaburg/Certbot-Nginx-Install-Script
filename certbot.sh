#!/bin/bash
#This script will install everything needed to run the certbot script for nginx.
#This script is taken directly from https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx
echo "Installing curl"
apt-get install curl build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev -y
echo "Installing Nginx"
curl http://nginx.org/download/nginx-1.24.0.tar.gz | tar zx
cd nginx-1.24.0

./configure  --sbin-path=/usr/bin/nginx \
  --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx/error.log \
  --http-log-path=/var/log/nginx/access.log \
  --with-pcre \
  --pid-path=/var/run/nginx.pid \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-http_gzip_static_module \
  --with-http_realip_module \
  --with-http_sub_module \
  --with-http_v2_module \
  --with-http_gunzip_module \
  --with-threads \
  --with-stream \
  --with-stream_ssl_module \
  --with-stream_ssl_preread_module \
  --with-stream_realip_module \
  --with-pcre-jit \
  --with-http_geoip_module=dynamic \
  --with-http_flv_module \
  --with-http_mp4_module \
  --with-http_secure_link_module \


make 
make install
cd ..
echo "Nginx is now installed"
ls -l /etc/nginx
nginx -v

echo "Setting up systemd service for nginx"
cat <<EOF > /lib/systemd/system/nginx.service
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/bin/nginx -t
ExecStart=/usr/bin/nginx
ExecReload=/usr/bin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target

EOF
echo "Ensuring nginx starts on boot"
systemctl enable nginx
echo "Starting nginx"
systemctl start nginx
echo "Nginx is now running"
echo "Installing certbot"

echo "Installing Dependencies"
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
echo "Installing Certbot"
sudo apt-get install certbot python3-certbot-nginx
echo "Certbot is now installed"
echo "You can run the cerbot script with this command"
echo "sudo certbot --nginx"