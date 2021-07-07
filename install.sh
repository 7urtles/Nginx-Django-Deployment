#!/usr/bin/bash

echo "Enter project name (Folder name containing virtual environment)"
read project_name

echo "Enter website IP address, or Domain Name"
read website_name



user_name=$(whoami)
cd ..
project_folder="${PWD##*/}"
cd Nginx-Django-Deployment

# Configuring setup files
sed -i "s/user_name/$user_name/g" ./config/*
sed -i "s/project_name/$project_name/g" ./config/*
sed -i "s/website_name/$website_name/g" ./config/*
sed -i "s/project_folder/$project_folder/g" ./config/*

sudo apt install python3-pip python3-dev libpq-dev nginx curl python3-venv -y

cd ..
python3 -m venv ./venv
source ./venv/bin/activate
pip install django gunicorn psycopg2-binary
deactivate

sudo cp ./Install/config/sock_file /etc/systemd/system/gunicorn.socket
sudo cp ./Install/config/service_file /etc/systemd/system/gunicorn.service

sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

sudo cp ./Install/config/nginx_config /etc/nginx/sites-available/$project_name
sudo ln -s /etc/nginx/sites-available/$project_name /etc/nginx/sites-enabled

sudo systemctl restart gunicorn
sudo systemctl daemon-reload

sudo systemctl restart nginx

