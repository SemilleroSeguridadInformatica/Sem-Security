#title           :vpn.sh
#description     :This script will install and run openvpn.
#author          :Mateo Gutierrez Gomez
#date            :Abril 4 2016
#usage           :bash vpn.sh
#notes           :give root access to this script.
#==============================================================================

#!/usr/bin/env bash

#Variable intialization
wget=/usr/bin/wget
zip=/usr/bin/unzip
pwd=/bin/pwd

#If openvpn is installed then run it
if which openvpn > /dev/null 2>&1; then
    #Try to find the openvpn config files and then run openvpn
    if [[ -n $(find . -name "*.ovpn") ]]; then
	#Get VPN password from vpnbook
	pass="http://www.vpnbook.com/freevpn"
	wget_opts="-q"

	#Get the pass and clean it by using awk until user and pass are found
	$wget ${wget_opts} "${pass}"
	sed 's/<[^>]\+>//g' freevpn > preauth.txt
	cat preauth.txt | grep -e Username -e Password | awk '{print $2}' > preauth1.txt
	tail -n 2 preauth1.txt > auth.txt
	rm freevpn
	rm preauth*
	sudo openvpn ./files/vpntcp443.ovpn
    #If no config files found then download them from the web page
    else
	echo "This script downloads files from internet so it will take some time (depends on your Internet connection)"
	#Get VPN files from vpnbook
	files="https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro1.zip"
	wget_file_opts="-q"
	zip_opts="-q"
	file="./VPNBook.com-OpenVPN-Euro1.zip"

	#Get the downloaded config files and add them to the auth file
	$wget ${wget_file_opts} "${files}"
	$zip ${zip_opts} "${file}"
	mkdir files
	mv *.ovpn ./files
	sed -e "10s/auth-user-pass/auth-user-pass auth.txt/" ./files/vpnbook-euro1-tcp443.ovpn > ./files/vpntcp443.ovpn
	rm *.zip

	#Get VPN password from vpnbook
	pass="http://www.vpnbook.com/freevpn"
	wget_opts="-q"

	#Get the pass and clean it by using awk until user and pass are found
	$wget ${wget_opts} "${pass}"
	sed 's/<[^>]\+>//g' freevpn > preauth.txt
	cat preauth.txt | grep -e Username -e Password | awk '{print $2}' > preauth1.txt
	tail -n 2 preauth1.txt > auth.txt
	rm freevpn
	rm preauth*
	sudo openvpn ./files/vpntcp443.ovpn
    fi
else
    echo "This script will install openvpn and also download files from internet so it will take some time (depends on your Internet connection)"
    #If no openvpn is found it will install the program
    sudo apt-get -qqy install openvpn   #Quiet install

    #Get VPN files from vpnbook
    files="https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro1.zip"
    wget_file_opts="-q"
    zip_opts="-q"
    file="./VPNBook.com-OpenVPN-Euro1.zip"

    #Get the downloaded config files and add them to the auth file
    $wget ${wget_file_opts} "${files}"
    $zip ${zip_opts} "${file}"
    mkdir files
    mv *.ovpn ./files
    sed -e "10s/auth-user-pass/auth-user-pass auth.txt/" ./files/vpnbook-euro1-tcp443.ovpn > ./files/vpntcp443.ovpn
    rm *.zip

    #Get VPN password from vpnbook
    pass="http://www.vpnbook.com/freevpn"
    wget_opts="-q"

    #Get the pass and clean it by using awk until user and pass are found
    $wget ${wget_opts} "${pass}"
    sed 's/<[^>]\+>//g' freevpn > preauth.txt
    cat preauth.txt | grep -e Username -e Password | awk '{print $2}' > preauth1.txt
    tail -n 2 preauth1.txt > auth.txt
    rm freevpn
    rm preauth*
    if [[ -n $(find ~ -name ".bash_aliases" 2>&-) ]]; then
	echo "alias vpn='sudo $PWD/pass.sh'" >> ~/.bash_aliases
    else
	echo "alias vpn='sudo $PWD/pass.sh'" >> ~/.bashrc
    fi
    sudo openvpn ./files/vpntcp443.ovpn    
fi
