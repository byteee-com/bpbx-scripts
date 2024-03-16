#!/bin/bash

# LOG_FILE="install.log"

# if [ -f $LOG_FILE ]; then
#     rm "$LOG_FILE"
# fi

echo -e "\n"
echo -e "************************************************************"
echo -e "*          Welcome to the BPBX  installation           *"
echo -e "*   For this process it is necessary that you have an      *"
echo -e "*      internet connection, since the latest version of    *"
echo -e "*                BPBX  will be installed              *"
echo -e "************************************************************"

echo -e "************************************************************"
echo -e "*            Install Dependencies & SUDO                   *"
echo -e "************************************************************"
DEBIAN_FRONTEND=noninteractive apt install curl gpg sudo  cmake net-tools systemd-timesyncd -y

echo -e "************************************************************"
echo -e "*                        Disable UFW                       *"
echo -e "************************************************************"
#Disable UFW
if [ -x "$(command -v ufw)" ]; then
	echo -e "${green}Disabling UFW...${txtrst}"
	sudo ufw disable
fi

echo -e "************************************************************"
echo -e "*                   Update & Upgrade System                *"
echo -e "************************************************************"
apt -y update
DEBIAN_FRONTEND=noninteractive apt -y upgrade
apt -y clean

echo -e "************************************************************"
echo -e "*           Update after setup BPBX Repo...                *"
echo -e "************************************************************"
apt -y update
DEBIAN_FRONTEND=noninteractive apt -y upgrade
apt -y clean

echo -e "************************************************************"
echo -e "*              Installing dependencies...                  *"
echo -e "************************************************************"
PACKAGES="ebconf-utils install redis git-core subversion wget libjansson-dev sqlite autoconf automake libxml2-dev libncurses5-dev libtool acl cron lame sox ffmpeg aptitude postfix nmap nginx fail2ban"



echo -e "************************************************************"
echo -e "*              Web Pabackages & MariaDB...                 *"
echo -e "************************************************************"
PACKAGES="$PACKAGES openjdk-17-jdk openjdk-17-jre"
PACKAGES="$PACKAGES mariadb-server unixodbc odbcinst unixodbc-dev"

echo -e "************************************************************"
echo -e "*           Installing MariaDB, JDK17       *"
echo -e "************************************************************"
DEBIAN_FRONTEND=noninteractive apt install -y $PACKAGES

echo -e "************************************************************"
echo -e "*             Starting & Enabling Services...              *"
echo -e "************************************************************"
systemctl enable mariadb.service
systemctl restart mariadb.service

systemctl enable fail2ban
systemctl start fail2ban

echo -e "************************************************************"
echo -e "*             Install Mariadb Driver....                   *"
echo -e "************************************************************"

git clone https://github.com/MariaDB/mariadb-connector-odbc.git
mkdir build && cd build
cmake ../mariadb-connector-odbc/ -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONC_WITH_UNIT_TESTS=Off -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_SSL=OPENSSL
cmake --build . --config RelWithDebInfo
make install

systemctl enable nginx
systemctl restart nginx

echo -e "************************************************************"
echo -e "*      Installing BPBX packages and Firewall...        *"
echo -e "************************************************************"
PACKAGES="sngrep"
PACKAGES="$PACKAGES firewalld fail2ban iptables iptables-persistent"
DEBIAN_FRONTEND=noninteractive apt install -y $PACKAGES



# echo -e "************************************************************"
# echo -e "*                  Configuring Firewall...                 *"
# echo -e "************************************************************"

# sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-16.30.1.tar.gz

# sudo tar zxf asterisk-16.30.1.tar.gz

# cd asterisk-*/

# -- mp3 module

# sudo contrib/scripts/get_mp3_source.sh

# echo 'libvpb1 libvpb1/countrycode string 55' | sudo debconf-set-selections -v

# sudo contrib/scripts/install_prereq install

# sudo ./configure

# sudo make -j2
# sudo make install




# echo -e "************************************************************"
# echo -e "*                  Configuring Firewall...                 *"
# echo -e "************************************************************"
# sed -i 's/^FirewallBackend=.*/FirewallBackend=iptables/g' /etc/firewalld/firewalld.conf
# update-alternatives --set iptables /usr/sbin/iptables-legacy
# update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

# systemctl enable firewalld.service
# systemctl enable fail2ban.service


# copy conf
cp -rf ./config/asterisk/* /etc/asterisk
cp -rf ./config/odbc/* /etc/
cp -rf ./config/nginx/bpbx.conf /etc/nginx/conf.d/
cp -rf ./config/fail2ban/jail.d/asterisk.conf /etc/fail2ban/jain.d/
# get ip

nginx -s reload

read -p "Set Default UDP port (default:5060) > " udp_input

if [ -z "$udp_input" ]; then
    udp_port=5060
else
    udp_port=$udp_input
fi

local_ip=$(ip -o -f inet addr show | awk '/scope global/ {print $4}')
public_ip=$(curl -s ifconfig.me)

if [ -n "$public_ip" ]; then
    echo "externaddr=${public_ip}:${udp_port}" >> /etc/asterisk/sip.conf
fi

# update port

echo "udpbindaddr=0.0.0.0:${udp_port}" >> /etc/asterisk/sip.conf
echo "localnet=${local_ip}" >> /etc/asterisk/sip.conf


groupadd asterisk
useradd -r -g asterisk -s /bin/false asterisk

echo -e "************************************************************"
echo -e "*                    Set Permissions                       *"
echo -e "************************************************************"
sudo chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
sudo chmod -R 750 /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk


sudo systemctl start asterisk 

sudo systemctl enable asterisk


echo -e "************************************************************"
echo -e "*                    Install BPBX Service                  *"
echo -e "************************************************************"
sudo cp start_bpbx.sh /usr/local/bin/
sudo cp stop_bpbx.sh /usr/local/bin/

sudo chmod +x /usr/local/bin/start_bpbx.sh
sudo chmod +x /usr/local/bin/stop_bpbx.sh

sudo cp bpbx.service /etc/systemd/system/

sudo systemctl daemon-reload


echo -e "************************************************************"
echo -e "*             Running the initial setup...                 *"
echo -e "************************************************************"
systemctl enable bpbx.service

#Configure Packages
dpkg --configure -a


echo -e "************************************************************"
echo -e "*             Import sql                 *"
echo -e "************************************************************"

DB_USER="root"
DB_PASS=""

mysql -u "$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE IF NOT EXISTS bpbx;"

if [ -f "db.sql" ]; then
    mysql -u "$DB_USER"  bpbx < db.sql
fi


echo -e "************************************************************"
echo -e "*             copy jar and www                 *"
echo -e "************************************************************"


jar_dir=/opt/bpbx

if [ ! -d "$jar_dir" ]; then
    mkdir -p "$jar_dir"
fi

cp -rf bpbx-api.jar  /opt/bpbx/

cp -rf web /opt/bpbx/web

systemctl start bpbx.service