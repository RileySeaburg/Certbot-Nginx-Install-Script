# Certbot NGINX Quick Install Script

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

I got really tired of google "certbot niginx install".
So I decided to write a simple install script.
It's made for ubuntu 18.04 but will probably work for the latest versions as well.

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

NGINX

```
apt-get nginx
```

### Installing

Copy the code below and paste it in your terminal

```
bash -c "$(wget -O - https://raw.githubusercontent.com/RileySeaburg/Certbot-Nginx-Install-Script/master/certbot.sh)"

```

## Usage <a name = "usage"></a>

Use certbot with this command

```
sudo certbot --nginx
```
