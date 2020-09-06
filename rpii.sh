#!/bin/bash
# export PATH=$PATH:/path/to/my/program
#Variables
error="Something went wrong"
divider="------------------------------------------------------"

#Fun for start, we will need it
echo "A lot of things will go on running this script so, wait for some time to drink a beer because hard stuff coming next........"
sleep 8
echo "Before all those take a look at the README file to see what will go on."
sleep 5
echo "Wait, let me show you"
sleep 3
cat README.md
sleep 7
echo "Now, its time for the beer i told you a while ago..."
sleep 2
curl http://artscene.textfiles.com/vt100/beer.vt

echo "Start updating system before anything else..."
echo "Running as root..."
sudo apt update -y
echo $divider
echo "Running sudo apt update --fix-missing..."
sudo apt update --fix-missing
echo $divider
echo "Running sudo apt --fix-broken install -y..."
sudo apt --fix-broken install -y
echo $divider
echo "Done updating... upgrade later"
echo $divider
echo "Running sudo apt update --fix-missing..."
sudo apt update && sudo apt update --fix-missing
echo $divider
echo "Running sudo apt --fix-broken install -y..."
sudo apt --fix-broken install -y
echo $divider
echo "Configure dpkg package to ensure that it will work later on..."
sudo dpkg --configure -a && echo "And...go..."
echo ""

echo "Apt Install Putty, Terminator, Filezilla, Timeshift..."
sleep 2
sudo apt install -y putty filezilla timeshift terminator && echo "Telegram, Putty, Filezilla, Timeshift, installed..."|| echo $error 2> errors.txt
echo ""

echo "Running sudo apt autoremove again..."
sudo apt autoremove

echo "Next install filelight"
echo "Filelight allows you to quickly understand exactly where your diskspace is being used by graphically representing your file system."
sleep 3
sudo apt install filelight -y || echo $error >> errors.txt
echo "Done installing filelight"


echo "Next download Malware Detection Software, fingers crossed"
sleep 2
wget http://www.rfxn.com/downloads/maldetect-current.tar.gz && echo "Downloaded" || echo $error 2> errors.txt
echo "Next unzip it with tar and install it after changing directory"
tar -xf maldetect-current.tar.gz && cd maldetect-1* || cd maldetect-2* || echo "Neither maldetect version 1 or 2" 2> errors.txt && echo "List maldetect folder and cd into it manually" && cd|grep -v maldetect-*.tar.gz && sudo chmod +x install.sh && ./install.sh || echo "It did not work as expected, install it fully manually"
echo "Finished installing Malware Detection Software... or not!"
sleep 3
echo "The main configuration of LMD is /usr/local/maldetect/conf.maldet and you can also check out /usr/local/src/maldetect-*/README for further instructions."
echo ""
sleep 5

echo "Now the fun part begins..."
echo "Install some tools... AKA wireshark, proxychains, tor, nmap, and macchanger"
sudo apt install wireshark proxychains macchanger tor nmap
echo "Now that we installed proxychains we can configure the traffic in /etc/proxychains.conf"
echo "Macchanger can be used like the help meu show below"
macchanger -h
echo "You can read it for 5 seconds or type macchanger -h when you want to"
sleep 5
echo "Create a backup for the tor config file just in case"
sudo cp /etc/tor/torrc /etc/tor/torrc.backup
echo "A very simple configuration will expose Tor Socks proxy service on tor default port (9050) and will accept connections only from local LAN (192.168.1.0/24). It will run as daemon, so that we’ll not need to call it each time we’ll use it. Finally, it will store data in default directory (/var/lib/tor/)."
sleep 10
echo "Now see if tor is running with 'sudo systemctl status tor@default.service' command"
sudo systemctl status tor@default.service
echo "Moving on..."
echo

echo "Now lets install ruby language and wpscan"
sudo apt install ruby ruby-dev bundler
sudo apt install rubygems
sudo gem install wpscan
echo "Wpscan end installing..."
echo

echo "Now time for the metasploit framework"
echo "Nightly installer from github actually used here"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
sudo chmod 755 msfinstall && \
./msfinstall
echo "Ok... Done!!!"
sleep 2
echo

echo "Now installed lets go for Shelock, user recon tool"
git clone https://github.com/sherlock-project/sherlock.git && cd sherlock
echo "We even got into the sherlock folder so lets start installing styff, requirements...."
python3 -m pip install -r requirements.txt
echo "Done!!!"

echo "Now let\'s download evillimiter from github!!!"
sleep 1
git clone https://github.com/bitbrute/evillimiter.git && cd evillimiter
echo "Continue with the installation of the tool"
sudo python3 setup.py install
echo "Now installed, see the help menu of the tool for a while, you must use sudo"
sudo evillimiter -h
sleep 5
echo "The show must go on... Let\'s do that"

echo "Now time for The Social-Engineer Toolkit (SET)"
git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/ && cd setoolkit
pip3 install -r requirements.txt python setup.py
sleep 2
echo "That done also"

echo "Now hydra"
echo "Hydra is a tool to guess/crack valid login/password pairs. Licensed under AGPL"
sleep 4
sudo apt install hydra
echo "The hydra help/options menu"
sleep 4

echo "Now let\'s install Empire framework for post-exploitation with pure-PowerShell2.0 Windows agent."
echo "Working on linux and unix systems"
git clone https://github.com/EmpireProject/Empire.git
echo "Now that Empire framework it\'s downloaded go to it\'s folder" && cd Empire
echo "The installation file is in the setup directory so let\'s install it without going to that folder"
echo "This script installs the few dependencies and run the ./setup/setup_database.py script."
sleep 1
echo "The setup_database.py file contains various setting that you can manually modify, and then initializes the ./data/empire.db backend database."
sleep 2
echo "No additional configuration should be needed- hopefully everything works out of the box."
sleep 2
echo -e '\e]8;;https://github.com/EmpireProject/Empire/wiki/Quickstart\e\\Control+click for Empire documentation\e]8;;\e\\\n'
sleep 2
echo "Running ./setup/install.sh"
./setup/install.sh
echo "Now it\'s time to go on"

echo "It is time to install Aircrack suite"
echo "But first, update the system, it\'s been a while"
sudo apt-get update && sudo apt-get install -y aircrack-ng
echo "Suite installed"

echo "---------------------------------------------------"
echo "Installation ends here... You may want to check errors.txt?"
