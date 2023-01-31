#! /bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo service nginx start
sudo systemctl enable nginx

