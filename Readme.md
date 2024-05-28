# SuitCRM  Deployment on Azure 

Welcome to the ultimate guide for launching your CRM (Customer Relationship Management) Suite on an Azure Cloud Virtual Machine (VM)! 🎉 This journey promises excitement as we embark on setting up your CRM in the cloud. Get ready for some Linux magic, SQL sorcery, Apache awesomeness, and SSL sweetness! 🧙‍♂️✨"


## Step By Steps
**Azure VM Setup**: Provision and configure an Azure Virtual Machine running a Linux distribution

**SQL Database**: Install and configure an SQL database for CRM data storage.

**Apache Web Server**: Set up Apache as the web server to serve the CRM application.

**Free SSL**: Enable HTTPS for the CRM application using free SSL certificates.


## Prerequisites
Before you begin, ensure you have the following:

An Azure account with sufficient permissions to create resources.
Basic knowledge of Linux, SQL, Apache, and SSL.
A domain name (optional, for SSL configuration).

### Azure Cloud Configuration

1- Create Resource Group

``` 
az group create --name suitcrm-rg --location westeurope 
``` 


2- Create Virtual Network
```
az network vnet create \
    --resource-group suitcrm-rg \
    --name suitcrm-vnet \
    --location westeurope \
    --address-prefixes 10.0.0.0/16 \
    --subnet-name default \
    --subnet-prefix 10.0.0.0/24
```

3- Create Ubuntu Virtual Machine

check the main.tf file 

### Linux Server Configuration

1- Update Package Lists

```
sudo apt upgrade
```

2- Install Apache and MySQL Server

```
sudo apt install apache2 mysql-server

```
3- Install PHP
```
sudo apt install php7.1 php7.1-common php7.1-opcache php7.1-mcrypt php7.1-cli php7.1-gd php7.1-curl php7.1-mysql
```


## MySQL Server Configuration

1. Create `suitcrm` Database
```
CREATE DATABASE suitcrm;
```

2. Create `suitcrm` User and Password
```
CREATE USER 'suitcrm_user'@'localhost' IDENTIFIED BY 'your_password';
```


3. Secure Installation
```
mysql_secure_installation
```

4. Update Access and Privileges
```
GRANT ALL PRIVILEGES ON suitcrm.* TO 'suitcrm_user'@'localhost';
FLUSH PRIVILEGES;
```

## Apache Configuration

1. Download the SuiteCRM Package
```
wget https://suitecrm.com/download/141/suite714/563700/suitecrm-7-14-3.zip
```

2. Move the Folder to `html/www`
```
sudo unzip suitecrm-8-6-0.zip -d /var/www/html/
```

3. Change Access Files
```
sudo chown www-data:www-data -R SuiteCRM-7.14.3/

cd SuiteCRM-7.14.3/
sudo chmod -R 755 . 
```

4. copy Apache-config.sh config file to the  `/etc/apache2/sites-available/crm.conf` Configuration File


5. enables the Apache site configuration for SuiteCRM.
```
sudo a2ensite suitecrm.conf
sudo a2enconf php7.4-fpm
```

## Free SSL Configuration with Certbot

1. Install Certbot
```
https://certbot.eff.org/
```