#!/bin/bash


echo "============================="
echo "welcome to installer kompresi"
echo "============================="
echo
echo
echo "============================="
echo "Update Package"
echo "============================="

sudo apt update && sudo apt -y upgrade

echo
echo
echo "============================="
echo "install unzip"
echo "============================="

sudo apt -y install unzip

echo
echo
echo "============================="
echo "Install Node JS"
echo "============================="

sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

sudo apt -y install nodejs

echo
echo
echo "============================="
echo "Install PM2"
echo "============================="

sudo npm -g install pm2

echo
echo
echo "============================="
echo "Download Installer File"
echo "============================="

wget http://172.20.4.135/index.php/s/LSnjEk45Pp1HUNh/download -O kompresi.zip

unzip kompresi.zip

echo
echo
echo "============================="
echo "Install Dependency"
echo "============================="

cd kompresi_installer/kompresi

sudo chmod +x dependency.sh

sudo ./dependency.sh


echo
echo
echo "============================="
echo "Install SoHo"
echo "============================="

cd SoHo

sudo chmod +x install.sh
sudo ./install.sh

echo
echo
echo "============================="
echo "Install Streaming Server"
echo "============================="

cd ../rtsp_server

sudo npm install

sudo pm2 start server.coffee

echo
echo
echo "============================="
echo "Trying to Start Kompresi"
echo "============================="

cd ../Intel

sudo chmod +x *

sudo pm2 start Streamer_Good_Intel_Single -- rtsp://10.20.30.4/live.sdp -- rtmp://localhost/live/test -- 512 -- 30

echo
echo
echo "============================="
echo "Check Kompresi Status"
echo "============================="

sudo pm2 list

echo
echo
echo "============================="
echo "Finish"
echo "============================="


