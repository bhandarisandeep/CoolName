#!/bin/sh

figlet -t "!!! Today we gonna print some cool name !!!"

read -p 'Enter your Cool Name:' name

figlet -tc -f doh $name | lolcat



