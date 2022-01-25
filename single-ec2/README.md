# EC2 + RDS

## 構築手順
1. terraform apply
2. EC2インスタンスにアクセスしてRDSのセットアップを行う
```
mysql -h xxxxx.ap-northeast-1.rds.amazonaws.com -u admin -p

create database wpdb;
create user wp_user identified by 'hoge1234';
grant all on wpdb.* to wp_user;
flush privileges;
````
3. EC2にhttpアクセスしてWordpressの初期セットアップ


