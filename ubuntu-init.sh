#export http_proxy=http://172.17.18.84:8080
#export https_proxy=http://172.17.18.84:8080

apt-get update -y
apt-get install -y wget curl xz-utils vim

echo "install python2.7..............................................................."
apt-get install python2.7 -y
mv /usr/bin/python2.7 /usr/bin/python
python --version
mkdir -p /opt/app

echo "install nodejs................................................................"
cd /opt/app
wget http://cdn.npm.taobao.org/dist/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz
xz -d node-v8.9.3-linux-x64.tar.xz 
tar -xvf node-v8.9.3-linux-x64.tar > /dev/null
ln -s node-v8.9.3-linux-x64 nodejs

echo "config nodejs env.................................................................."
export PATH=$PATH:/opt/app/nodejs/bin
node -v

echo "install firefox chrome............................................................."

wget https://dl-ssl.google.com/linux/linux_signing_key.pub
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update -y
apt-get install firefox=45.0.2+build1-0ubuntu1 google-chrome-stable default-jre -y
apt-mark hold firefox


echo "install protractor ................"
#npm config set proxy=http://172.17.18.84:8080 -g
#npm config set registry https://registry.npm.taobao.org
npm install -g protractor
#npm install -g cordova
#npm install -g ionic
npm install --unsafe-perm -g protractor-jasmine2-screenshot-reporter

echo "webdriver-manager update ..............................................................."
webdriver-manager update
echo "install xvfb ..............................................................."
apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic xvfb x11-apps

