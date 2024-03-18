#!/bin/bash

# LOG_FILE="install.log"

# if [ -f $LOG_FILE ]; then
#     rm "$LOG_FILE"
# fi

WORKING_DIR=$(pwd)


echo -e "\n"
echo -e "************************************************************"
echo -e "*          Welcome to the BPBX  installation           *"
echo -e "*   For this process it is necessary that you have an      *"
echo -e "*      internet connection, since the latest version of    *"
echo -e "*                BPBX  will be installed              *"
echo -e "************************************************************"


echo -e "************************************************************"
echo -e "*                   Update & Upgrade System                *"
echo -e "************************************************************"
apt -y update
DEBIAN_FRONTEND=noninteractive apt -y upgrade
apt -y clean


echo -e "************************************************************"
echo -e "*            Install Dependencies & SUDO                   *"
echo -e "************************************************************"
DEBIAN_FRONTEND=noninteractive apt -y install curl gpg sudo cmake net-tools systemd-timesyncd 

echo -e "************************************************************"
echo -e "*                        Disable UFW                       *"
echo -e "************************************************************"
#Disable UFW
if [ -x "$(command -v ufw)" ]; then
	echo -e "${green}Disabling UFW...${txtrst}"
	sudo ufw disable
fi

echo -e "************************************************************"
echo -e "*              Installing dependencies...                  *"
echo -e "************************************************************"
PACKAGES="apt -y install install redis git-core subversion wget libjansson-dev sngrep sqlite autoconf automake libxml2-dev libncurses5-dev libtool acl cron lame sox ffmpeg aptitude postfix nmap nginx fail2ban"


echo -e "************************************************************"
echo -e "*           Installing MariaDB, JDK17       *"
echo -e "************************************************************"
PACKAGES="$PACKAGES openjdk-17-jdk openjdk-17-jre"
PACKAGES="$PACKAGES mariadb-server unixodbc odbcinst unixodbc-dev"
DEBIAN_FRONTEND=noninteractive apt install -y $PACKAGES

echo -e "************************************************************"
echo -e "*             Install Mariadb Driver....                   *"
echo -e "************************************************************"

git clone https://github.com/MariaDB/mariadb-connector-odbc.git
mkdir build && cd build
cmake ../mariadb-connector-odbc/ -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONC_WITH_UNIT_TESTS=Off -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_SSL=OPENSSL
cmake --build . --config RelWithDebInfo
make install

cd $WORKING_DIR

echo -e "************************************************************"
echo -e "*                 Installing Asterisk packages...                 *"
echo -e "************************************************************"

sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-16.30.1.tar.gz

sudo tar zxf asterisk-16.30.1.tar.gz

cd asterisk-*/

sudo contrib/scripts/get_mp3_source.sh

echo 'libvpb1 libvpb1/countrycode string 55' | sudo debconf-set-selections -v

sudo contrib/scripts/install_prereq install

sudo ./configure

sudo make -j2
sudo make install

# copy conf
cp -rf "$WORKING_DIR/config/asterisk/*" /etc/asterisk
cp -rf "$WORKING_DIR/config/odbc/*" /etc/
cp -rf "$WORKING_DIR/config/nginx/bpbx.conf" /etc/nginx/conf.d/
cp -rf "$WORKING_DIR/config/fail2ban/jail.d/asterisk.conf" /etc/fail2ban/jain.d/

# # get ip
# read -p "Set Default UDP port (default:5060) > " udp_input

# if [ -z "$udp_input" ]; then
#     udp_port=5060
# else
#     udp_port=$udp_input
# fi

# local_ip=$(ip -o -f inet addr show | awk '/scope global/ {print $4}')
# public_ip=$(curl -s ifconfig.me)

# if [ -n "$public_ip" ]; then
#     echo "externaddr=${public_ip}:${udp_port}" >> /etc/asterisk/sip.conf
# fi

# # update port

# echo "udpbindaddr=0.0.0.0:${udp_port}" >> /etc/asterisk/sip.conf
# echo "localnet=${local_ip}" >> /etc/asterisk/sip.conf

groupadd asterisk
useradd -r -g asterisk -s /bin/false asterisk

echo -e "************************************************************"
echo -e "*                    Set Permissions                       *"
echo -e "************************************************************"
sudo chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
sudo chmod -R 750 /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk


echo -e "************************************************************"
echo -e "*                    Install BPBX Service                  *"
echo -e "************************************************************"
sudo cp start_bpbx.sh /usr/local/bin/
sudo cp stop_bpbx.sh /usr/local/bin/

sudo chmod +x /usr/local/bin/start_bpbx.sh
sudo chmod +x /usr/local/bin/stop_bpbx.sh

sudo cp bpbx.service /etc/systemd/system/

sudo systemctl daemon-reload

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

cp -rf "$WORKDIR/bpbx.jar"  /opt/bpbx/

cp -rf "$WORKDIR/web" /opt/bpbx/web


systemctl enable mariadb.service
systemctl restart mariadb.service

systemctl enable fail2ban
systemctl start fail2ban

sudo systemctl start asterisk 
sudo systemctl enable asterisk

sudo systemctl enable nginx
sudo systemctl start nginx

sudo systemctl enable bpbx.service
sudo systemctl start bpbx.service

sudo systemctl enable fail2ban.service
sudo systemctl start fail2ban.service