

read -p "domain: " domain
sudo mkdir /var/www/$domain
this=`hostname`


yes | sudo apt-get update
if [ $(dpkg-query -W -f='${Status}' pwgen 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    yes | sudo apt install pwgen;
  fi
r=`pwgen -s 6 1`
echo "r">~/dbpass


                yes | sudo apt-get install lamp-server^ phpmyadmin
            sudo ufw app info "Apache Full"
                
                 yes | sudo apt install curl
                 sudo   mysql -e "UPDATE mysql.user SET Password = PASSWORD(r) WHERE User = 'root'"
                    sudo  mysql -e "DROP USER ''@'localhost'"
                        mysql -e "DROP USER ''@'$(hostname)'"
                     sudo  mysql -e "DROP DATABASE test"
                   sudo  mysql -e "FLUSH PRIVILEGES"
    
                echo "<IfModule mod_dir.c>" > ~/dir.conf
              sudo   echo  DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm >> ~/dir.conf
            sudo echo "</IfModule>" >> ~/dir.conf
            sudo mv ~/dir.conf /etc/apache2/mods-enabled/dir.conf
          sudo systemctl restart apache2
  sudo chgrp -R www-data /var/www/html
  sudo find /var/www/html -type d -exec chmod g+rx {} +
    sudo find /var/www/html -type f -exec chmod 755 {} +
      sudo a2enmod proxy_fcgi setenvif
    sudo a2enmod php



echo "<VirtualHost *:80>">~/$domain.conf
  echo "ServerAdmin webmaster@$domain">>~/$domain.conf
  echo "ServerName $domain" >>~/$domain.conf
  echo "ServerAlias www.$domain" >>~/$domain.conf
  echo "DocumentRoot /var/www/$domain/">>~/$domain.conf
  echo 'ErrorLog ${APACHE_LOG_DIR}/error.log'>>~/$domain.conf
  echo 'CustomLog ${APACHE_LOG_DIR}/access.log combined'>>~/$domain.conf
  echo "</VirtualHost>">>~/$domain.conf
  sudo cp ~/$domain.conf /etc/apache2/sites-available/$domain.conf
  rm ~/$domain.conf
  sudo a2ensite ${domain}.conf
  sudo cp /etc/hosts ~/hosts
  echo "127.0.0.1 localhost.localdomain localhost ${this}" >>~/hosts
  echo "127.0.0.1 ${this}" >>~/hosts
  sudo mv ~/hosts /etc/

  if [ $(dpkg-query -W -f='${Status}' sendmail-bin 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    yes | sudo apt install sendmail-bin;
    yes | sudo apt install sendmail;
  fi
  if [ $(dpkg-query -W -f='${Status}' mailutils 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    yes | sudo apt install mailutils;
  fi

sudo chgrp -R www-data /var/www/${domain}
  sudo chown -R www-data:www-data /var/www/${domain}
  sudo find /var/www/${domain} -type d -exec chmod g+rx {} +
  sudo a2dissite 000-default
 sudo systemctl reload apache2


  if [ $(dpkg-query -W -f='${Status}' certbot 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    yes | sudo apt install certbot;

  fi
  
  if [ $(dpkg-query -W -f='${Status}' python3-certbot-apache 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    yes | sudo apt install python3-certbot-apache;

  fi
sudo certbot --apache -d ${domain} -d www.${domain}  --non-interactive --agree-tos -m info@vsdg.net
sudo service apache2 restart
