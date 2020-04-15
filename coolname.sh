#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' figlet|grep "install ok installed")
PKG1_OK=$(dpkg-query -W --showformat='${Status}\n' lolcat|grep "install ok installed")
PKG2_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "install ok installed")
echo Checking for Lolcat: $PKG1_OK
echo Checking for Figlet: $PKG_OK
if [ "" == "$PKG_OK" ]; 
then
  echo "No cool figlet found I am installing for you!!!"
  sudo apt-get --force-yes --yes install figlet
  wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed/doh.flf /usr/share/figlet
elif [ "" == "$PKG2_OK" ]; 
then
  echo "No cool Ruby found I am installing for you!!!"
  sudo apt-get install ruby
elif [ "" == "$PKG1_OK" ]; 
then
  echo "No cool lolcat found I am installing for you!!!"
  sudo gem install lolcat
else
figlet -t "!!! Today we gonna print some cool name !!!"

read -p 'Enter your Cool Name:' name

figlet -tc -f doh $name | lolcat
fi