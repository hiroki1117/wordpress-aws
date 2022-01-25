#cloud-config

timezone: Asia/Tokyo
locale: ja_JP.utf8
package_upgrade: true
packages:
    - httpd
    - mysql

runcmd:
    # Wordpressインストール
    - amazon-linux-extras install -y php7.2
    - wget http://wordpress.org/latest.tar.gz
    - tar -xzvf latest.tar.gz
    - mv wordpress/* /var/www/html/
    # 権限設定
    - chown apache /var/www
    - chown -R ec2-user:apache /var/www
    - chmod 2775 /var/www
    - find /var/www -type d -exec chmod 2775 {} \;
    - find /var/www -type f -exec chmod 0664 {} \;
    # httpdスタート
    - systemctl start httpd
    - systemctl enable httpd

power_state:
  delay: "+60"
  mode: reboot
  message: Bye Bye
  timeout: 30

