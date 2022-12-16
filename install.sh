#!/bin/bash

########################################################
#
# Environment checks
#
########################################################
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
  if ! [ $DISTRIB_ID == 'Ubuntu' ]; then
    echo "The On-premise code scanner requires an Ubuntu host."
    echo "This is a fatal error."
    exit 1
  elif ! [ $DISTRIB_CODENAME == 'jammy' ]; then
    echo "Warning: This script and playbook have only been tested on Ubuntu 22.04 (Jammy Jellyfish)"
  fi
else
 echo "The On-premise code scanner requires an Ubuntu host."
 echo "This is a fatal error."
 exit 1
fi

if ! [ -f tenable-code-scanner-docker.zip ]; then
  echo "The file 'tenable-code-scanner-docker.zip' is not present in the current directory."
  echo "It can be downloaded from the On-premise code scanner of the Integrations page of Tenable Cloud Security."
  echo "This is a fatal error."
  exit 1
fi

########################################################
#
# Install Ansible so we can run the playbook
#
########################################################
if ! apt-add-repository -L | fgrep 'ppa.launchpadcontent.net/ansible/ansible/ubuntu/' > /dev/null ; then
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt update
fi
if ! command -v ansible-playbook > /dev/null ; then
  sudo apt install ansible
fi

########################################################
#
# Playbook takes it from here...
#
########################################################
ansible-playbook tenable-code-scanner-docker.yml
