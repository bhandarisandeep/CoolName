#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' figlet|grep "install ok installed")
echo Checking for Figlet: $PKG_OK
if [ "" == "$PKG_OK" ]; 
then
  echo "No cool figlet found I am installing for you!!!"
  sudo apt-get --force-yes --yes install the.package.name
  wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed/doh.flf /usr/share/figlet
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' lolcat|grep "install ok installed")
echo Checking for Lolcat: $PKG_OK
if [ "" == "$PKG_OK" ]; 
then
  echo "No cool figlet found I am installing for you!!!"
  sudo gem install lolcat
fi
figlet -t "!!! Today we gonna print some cool name !!!"

read -p 'Enter your Cool Name:' name

figlet -tc -f doh $name | lolcat
