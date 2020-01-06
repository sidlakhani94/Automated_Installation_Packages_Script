#/bin/bash
#Installation of all apps.
#Author: Siddharth Lakhani
#Description: It will first check weather packages are installed or not then it will install all packages automatically through the script.

#Here functions created to check if packages are installed or not.


generaltools() {
    declare -a filea
    readarray -t filea < generaltools.txt

    for a in "${filea[@]}"
        do 
            if [ "$(dpkg -s $a | grep -c "ok installed")" != "1" ]
                then
                eval $a
                else
                echo "$a is installed"
            fi
        done
}

developertools() {
    declare -a fileb
    readarray -t fileb < developertools.txt

    for b in "${fileb[@]}"
        do 
            if [ "$(dpkg -s $b | grep -c "ok installed")" != "1" ]
                then
                eval $b
                else
                echo "$b is installed"
            fi
        done
}

#Here functions created to install required packages.

putty() {
    sudo apt-get install -y putty
}

skypeforlinux() {
    sudo wget https://go.skype.com/skypeforlinux-64.deb
    sudo apt install ./skypeforlinux-64.deb
}

google-chrome-stable() {
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

notepadqq() {
    sudo add-apt-repository ppa:notepadqq-team/notepadqq
    sudo apt-get update
    sudo apt-get install notepadqq -y
}

riot-web() {
    sudo apt install -y lsb-release wget apt-transport-https
    sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/riot-im.list
    sudo apt update
    sudo apt install riot-web -y
}

anydesk() {
    sudo wget https://download.anydesk.com/linux/anydesk_5.5.1-1_amd64.deb
    sudo apt install -y ./anydesk_5.5.1-1_amd64.deb
}

teamviewer() {
    sudo wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    sudo apt install ./teamviewer_amd64.deb -y
}

remmina() {
    sudo apt update
    sudo apt-get install remmina -y
}

thunderbird() {
    sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
    sudo apt-get update -y
    sudo apt-get install thunderbird -y
}

filezilla() {
    sudo add-apt-repository ppa:n-muench/programs-ppa
    sudo apt-get update
    sudo apt-get install filezilla -y
}

tortoisehg() {
    sudo apt-get update
    sudo apt-get install tortoisehg -y
}

python3.8() {
    sudo apt update
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.8 -y
}

sublime-text() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text-stable.list
    sudo apt-get update
    sudo apt install sublime-text -y
}

postgresql() {
    sudo apt install postgresql postgresql-contrib -y
}

nodejs() {
    sudo apt install curl -y
    curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
    sudo apt install nodejs -y
}

mongodb-org() {
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    sudo apt-get install gnupg -y
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
}

sqlite3() {
    sudo apt-get install sqlite3 sqlitebrowser -y
}

postman() {
    sudo snap install postman 
}

r-base() {
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> /etc/apt/sources.list.d/r-base.list
    sudo apt-get update 
    sudo apt-get install r-base -y
    sudo apt-get install gdebi-core -y
    wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5033-amd64.deb
    sudo gdebi rstudio-server-1.2.5033-amd64.deb -y
}

mongodb-compass() {
    sudo apt-get update
    sudo wget https://downloads.mongodb.com/compass/mongodb-compass_1.20.3_amd64.deb
    sudo dpkg -i mongodb-compass_1.20.3_amd64.deb
}

rabbitvcs-nautilus() {
    sudo add-apt-repository ppa:rabbitvcs/ppa
    sudo apt-get update
    sudo apt-get install rabbitvcs-nautilus -y
}

invalid() {
    echo "Enter Valid Option"
    exit
}


#Here displaying available options to choose and call function accordingly.

echo
echo -e "Available Options \n1)General Tools \n2)Developer Tools"
echo "Choose any option to install related app."
echo

read option

case $option in 

1) generaltools;;
2) developertools;;
*) invalid;;

esac