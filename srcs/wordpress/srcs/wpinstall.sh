#!/bin/bash

cd /www/
pwd

wp core download
wp core install --url=wordpress/ --path=/www --title="MY OWN SITE" --admin_user="admin" --admin_password="admin" --admin_email="mysql@mysql.com"
# create a few users
wp user create a a@example.com --role=editor --user_pass=editor
wp user create b b@example.com --role=author --user_pass=author
wp user create c c@example.com --role=contributor --user_pass=contributor
wp user create d d@example.com --role=subscriber --user_pass=subscriber

wp theme install vilva
wp theme activate vilva