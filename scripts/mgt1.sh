#!/usr/bin/env bash


sleep 5

#Check for ping connectivity to google before proceeding.

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

sudo su 

echo "Add dns names to etc hosts"

echo 10.0.0.99 leaf1a  >> /etc/hosts
echo 10.0.0.100 leaf1b  >> /etc/hosts
echo 10.0.0.101 spine1  >> /etc/hosts
echo 10.0.0.102 spine2  >> /etc/hosts
echo 10.0.0.103 leaf2a  >> /etc/hosts
echo 10.0.0.103 leaf2b  >> /etc/hosts

echo "adding respositories"
echo "ansible for apt-get"
apt-add-repository ppa:ansible/ansible -y

echo "updating apt-get"
apt-get update -y 
echo "installing everything necessary for DNS and Bind"
apt-get install -y git ansible python-pip python-dev default-jre salt-master salt-minion libffi-dev libssl-dev python-dev python-cffi libxslt1-dev python-pip -y 

echo "Get the necessary libraries"
pip install jsonrpclib

echo "Install napalm EOS libraries"
pip install napalm-eos 
