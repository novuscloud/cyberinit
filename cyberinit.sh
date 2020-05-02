#!/bin/bash
yum install screen -y
yum install git -y
sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh) <<< $'1\n1\ny\n\ns\ndeathgod305\ndeathgod305\nn\nn\nn\nn\n'
git clone https://github.com/novuscloud/cybercp
mv /cybercp/index.html /usr/local/CyberCP/index.html
mv /cybercp/login.html /usr/local/CyberCP/loginSystem/templates/loginSystem/login.html
mv /cybercp/fileManager.css /usr/local/CyberCP/public/static/filemanager/css/fileManager.css
mv /cybercp/default.css /usr/local/CyberCP/public/static/baseTemplate/assets/themes/admin/color-schemes/default.css
rm -rf cybercp
rm -f /cyberpanel.sh 
rm -f /etc/profile.d/cyberpanel.sh
rm -rf cyberpanel
find / -type d -name "cyberpanel" -exec rm -rf {} +
wget https://raw.githubusercontent.com/novuscloud/centos-mycnf/master/my.cnf
mv my.cnf /etc/my.cnf
cyberpanel createPackage --owner admin --packageName standard --diskSpace 10000 --bandwidth 0 --emailAccounts 1 --dataBases 1 --ftpAccounts 1 --allowedDomains 1
cyberpanel createPackage --owner admin --packageName professional --diskSpace 15000 --bandwidth 0 --emailAccounts 10 --dataBases 10 --ftpAccounts 10 --allowedDomains 5
cyberpanel createPackage --owner admin --packageName premium --diskSpace 25000 --bandwidth 0 --emailAccounts 0 --dataBases 0 --ftpAccounts 0 --allowedDomains 0
reboot