#!/bin/bash
asci_logo() {
echo $'\e[1;36m'
cat << EOF

   █████████  ███████████  ███████████
  ███░░░░░███░░███░░░░░███░█░░░███░░░█
 ███     ░░░  ░███    ░███░   ░███  ░ 
░███          ░██████████     ░███    
░███    █████ ░███░░░░░░      ░███    
░░███  ░░███  ░███            ░███    
 ░░█████████  █████           █████   
  ░░░░░░░░░  ░░░░░           ░░░░░    
EOF
echo $'\e[0m'
}
proxygpt() {
asci_logo
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
asci_logo
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
asci_logo
PS3=("#main:")
main=("proxy" "no proxy" "Exit")
echo $'\e[1;31m'
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
echo $'\e[0m'
}
mainmenu
