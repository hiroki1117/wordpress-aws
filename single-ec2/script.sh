#!/bin/sh
yum update -y
amazon-linux-extras install -y php7.2
yum install -y httpd
systemctl start httpd

# wordpressインストール
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress/* /var/www/html/

# 権限設定
chown apache /var/www
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
