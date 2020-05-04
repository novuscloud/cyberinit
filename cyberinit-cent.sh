#!/bin/bash
yum install screen -y
wget https://raw.githubusercontent.com/novuscloud/cyberpanel/stable/cyberpanel.sh
# sudo nohup sh <(curl cyberpanel.sh) -v ols -p deathgod305
#sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh) <<< $'1\n1\ny\n\ns\ndeathgod305\ndeathgod305\nn\nn\nn\nn\n'
chmod +x cyberpanel.sh
./cyberpanel.sh <<< $'1\n1\ny\n\ns\ndeathgod305\ndeathgod305\nn\nn\nn\nn\n'
yum install git -y
git clone https://github.com/novuscloud/cybercp
mv /cybercp/index.html /usr/local/CyberCP/index.html
mv /cybercp/login.html /usr/local/CyberCP/loginSystem/templates/loginSystem/login.html
mv /cybercp/fileManager.css /usr/local/CyberCP/public/static/filemanager/css/fileManager.css
mv /cybercp/default.css /usr/local/CyberCP/public/static/baseTemplate/assets/themes/admin/color-schemes/default.css
rm -rf cybercp
rm -f /cyberpanel.sh 
rm -f /etc/profile.d/cyberpanel.sh
rm -rf cyberpanel
rm -f cyberinit.sh
wget https://raw.githubusercontent.com/novuscloud/cybercp-mycnf/master/my.cnf
mv my.cnf /etc/my.cnf
cyberpanel createPackage --owner admin --packageName standard --diskSpace 10000 --bandwidth 0 --emailAccounts 1 --dataBases 1 --ftpAccounts 1 --allowedDomains 1
cyberpanel createPackage --owner admin --packageName professional --diskSpace 15000 --bandwidth 0 --emailAccounts 10 --dataBases 10 --ftpAccounts 10 --allowedDomains 5
cyberpanel createPackage --owner admin --packageName premium --diskSpace 25000 --bandwidth 0 --emailAccounts 0 --dataBases 0 --ftpAccounts 0 --allowedDomains 0
yum install rpl -y
#php7.4
rpl -w "upload_max_filesize = 2M" "upload_max_filesize = 50M" /usr/local/lsws/lsphp74/etc/php/7.4/litespeed/php.ini
rpl -w "; max_input_vars = 1000" "max_input_vars = 12000" /usr/local/lsws/lsphp74/etc/php/7.4/litespeed/php.ini
rpl -w "memory_limit = 128M" "memory_limit = 700M" /usr/local/lsws/lsphp74/etc/php/7.4/litespeed/php.ini
#php7.3
rpl -w "upload_max_filesize = 2M" "upload_max_filesize = 50M" /usr/local/lsws/lsphp73/etc/php/7.3/litespeed/php.ini
rpl -w "; max_input_vars = 1000" "max_input_vars = 12000" /usr/local/lsws/lsphp73/etc/php/7.3/litespeed/php.ini
rpl -w "memory_limit = 128M" "memory_limit = 700M" /usr/local/lsws/lsphp73/etc/php/7.3/litespeed/php.ini
#php7.2
rpl -w "upload_max_filesize = 2M" "upload_max_filesize = 50M" /usr/local/lsws/lsphp72/etc/php/7.2/litespeed/php.ini
rpl -w "; max_input_vars = 1000" "max_input_vars = 12000" /usr/local/lsws/lsphp72/etc/php/7.2/litespeed/php.ini
rpl -w "memory_limit = 128M" "memory_limit = 700M" /usr/local/lsws/lsphp72/etc/php/7.2/litespeed/php.ini
#php7.1
rpl -w "upload_max_filesize = 2M" "upload_max_filesize = 50M" /usr/local/lsws/lsphp71/etc/php/7.1/litespeed/php.ini
rpl -w "; max_input_vars = 1000" "max_input_vars = 12000" /usr/local/lsws/lsphp71/etc/php/7.1/litespeed/php.ini
rpl -w "memory_limit = 128M" "memory_limit = 700M" /usr/local/lsws/lsphp71/etc/php/7.1/litespeed/php.ini
#php7.0
rpl -w "upload_max_filesize = 2M" "upload_max_filesize = 50M" /usr/local/lsws/lsphp70/etc/php/7.0/litespeed/php.ini
rpl -w "; max_input_vars = 1000" "max_input_vars = 12000" /usr/local/lsws/lsphp70/etc/php/7.0/litespeed/php.ini
rpl -w "memory_limit = 128M" "memory_limit = 700M" /usr/local/lsws/lsphp70/etc/php/7.0/litespeed/php.ini
reboot