#!/bin/bash
#This script will install everything needed to run the certbot script for nginx.
#This script is taken directly from https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx
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