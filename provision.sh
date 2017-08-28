yum -y update
yum install -y deltarpm epel-release git wget net-tools

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

echo "Install PHP ================================================================================"
yum install -y php70w php70w-opcache php70w-mysql.x86_64 php70w-mbstring.x86_64 php70w-xml.x86_64 php70w-pdo.x86_64

echo "Install Composer And Create LARAVEL Project ================================================"
cd /tmp
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php
sudo php -r "unlink('composer-setup.php');"
sudo php composer.phar create-project laravel/laravel /vagrant/web/ 5.4.*
sudo mv /tmp/composer.phar /usr/local/bin/composer

echo "Install Docker-CE ========================================================================="
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
     --add-repo \
     https://download.docker.com/linux/centos/docker-ce.repo;
sudo yum-config-manager --enable docker-ce-edge
sudo yum makecache fast
sudo yum install -y docker-ce
sudo systemctl enable docker.service
sudo systemctl start docker.service

echo "Add User Vagrant Into Docker Group ========================================================"
sudo gpasswd -a vagrant docker
sudo systemctl restart docker.service

echo "Install Docker Composer ==================================================================="
sudo yum install curl
sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
