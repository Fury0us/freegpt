#!/bin/bash
proxygpt() {
echo -en '\n'
echo $'\e[1;36m-------------------\e[0m'
echo $'\e[1;36m' && figlet GPT && echo $'\e[0m'
echo $'\e[1;36m-------------------\e[0m'
echo -en '\n'
read -p $'\e[36mStart Gpt Session?(yes/no): \e[0m' sgpts
echo -en '\n'
read -p $'\e[36mUsername?: \e[0m' user
if [ $sgpts = "yes" ] || [ $sgpts = "y" ] || [ $sgpts = "ye" ]
then
	sudo systemctl stop tor &&
	sudo service tor start
	echo -en '\n'
	sudo -u $user proxychains firefox https://talkai.info/chat
else
	exit
fi
}
noproxy() {
echo -en '\n'
echo $'\e[1;36m-------------------\e[0m'
echo $'\e[1;36m' && figlet GPT && echo $'\e[0m'
echo $'\e[1;36m-------------------\e[0m'
echo -en '\n'
read -p $'\e[1;36mStart Gpt Session?: \e[0m' npgt
echo -en '\n'
read -p $'\e[1;36mBrowser?: \e[0m' br
echo 0en '\n'
if [ $npgt == "yes" ] || [ $npgt == "y" ] || [ $npgt == "ye" ]
then
sudo $br https://talkai.info/chat
else
exit
fi
}
mainmenu() {
COLUMNS=12
echo -en '\n'
echo $'\e[1;36m-------------------\e[0m'
echo $'\e[1;36m' && figlet GPT && echo $'\e[0m'
echo $'\e[1;36m-------------------\e[0m'
echo -en '\n'
PS3=("#main:")
main=("proxy" "no proxy" "Exit")
select m in "${main[@]}"; do
case $m in
"proxy")
proxygpt
;;
"no proxy")
noproxy
;;
"Exit")
exit
;;
esac
done
}
mainmenu
