
#!/bin/bash
checkf="$(command -v figlet)"
checkl="$(command -v lolcat)"
if [ $checkf!="/usr/bin/figlet" ]
then
 echo "Figlet is absent!!! should i install"
 read -p "karu install??[y/n] : " yesno
 if [ $yesno == "y" ]
 then 
	{
	#sudo apt-get update -y
	#sudo apt-get install -y figlet
	echo "installing figlet"
	}	
 else 
	{
		echo "I think you have to make your mind first"
#		exit 0;
	}
	fi
elif [ $checkl!="/usr/local/bin/lolcat" ]
 then
 echo "lolcat is absent!!! should i install"
 read -p "karu install??[y/n] : " yesno
 if [ $yesno == "y" ]
 then 
	#sudo gem install lolcat
	echo "installing lolcat"
 else 
	{
	echo "I think you have to make your mind first"
	exit 1;
	}
 fi		
else 
 figlet -t "!!! Today we gonna print some cool name !!!"
 read -p 'Enter your Cool Name:' name
 figlet -tc -f doh $name | lolcat
fi
