#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' figlet|grep "install ok installed")
PKG1_OK=$(dpkg-query -W --showformat='${Status}\n' lolcat|grep "install ok installed")
PKG2_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "install ok installed")
checklol=$(command -v lolcat)
checkdoh=$(ls /usr/share/figlet/doh.flf)
echo Checking for Lolcat: $PKG1_OK
echo Checking for Ruby: $PKG2_OK
echo Checking for Figlet: $PKG_OK
if [ "" == "$PKG_OK" ]; 
then
  echo "No cool figlet found I am installing for you!!!"
  sudo apt-get --force-yes --yes install figlet
 if [ "" == "$checkdoh" ];
 then
  {
  echo "No dog font found I am adding for you!!!"
  wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed/doh.flf -P /usr/share/figlet/
  }
 fi
fi  
if [ "" == "$PKG2_OK" ]; 
then
  echo "No cool Ruby found I am installing for you!!!"
  sudo apt-get install ruby
fi
if [ "" == "$PKG1_OK" ]; 
then
 if [ "" == "$checklol" ];
 then
  {
  echo "No cool lolcat found I am installing for you!!!"
  sudo gem install lolcat
  }
 fi
fi
figlet -t "!!! Today we gonna print some cool name !!!"

read -p 'Enter your Cool Name:' name

figlet -tc -f doh $name | lolcat
