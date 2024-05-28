<VirtualHost *:80>
    ServerAdmin webmaster@52.174.60.89
    DocumentRoot /var/www/html/SuiteCRM-7.14.3

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/html/SuiteCRM-7.14.3>
        Options FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
  # Include PHP-FPM configuration
   # to get php file go to  'cd Include /etc/apache2/conf-available/'
    
    Include /etc/apache2/conf-available/php7.4-fpm.conf
</VirtualHost>
