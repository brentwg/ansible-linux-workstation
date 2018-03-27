#!/usr/bin/env bash
# ------------------------------------------------------------------------
# Simple bash script used to bootstrap ansible
#
# The following distros are supported: 
#   - Fedora 20 and greater
#   - CentOS 7
#   - Ubuntu 16.04, 17.10, 18.04
#
# Brent WG
# 2018-02-27
# 2018-03-27
# ------------------------------------------------------------------------

# ----------------
# Script Functions
# ----------------
error_exit() {
  echo ""
  echo "$PRETTY_NAME is not supported by this script"
  echo
  exit 1
}

# --------------------------------------------
# Check to see if Ansible is already installed
# --------------------------------------------
echo ""
echo "Checking to see if Ansible is already installed"
if hash ansible 2>/dev/null ; then
  echo ""
  echo "Ansible is already installed"
  echo ""
  exit 2
fi

# ----------
# Get Distro
# ----------
echo ""
echo "Getting OS version..."
. /etc/os-release

# ---------------
# Install Ansible
# ---------------
echo ""
echo "Installing Ansible for: $PRETTY_NAME..."
## Deal with Fedora (version 20 and greater)
if [ "$ID" == "fedora" ]; then
  ## Use dnf > 21
  if [ $VERSION_ID -gt 21 ]; then
    echo "Using: sudo dnf install -y ansible"
    sudo dnf install -y ansible
  ## Use yum for 20 - 21
  elif [ $VERSION_ID -eq 20 ] || [ $VERSION_ID -eq 21 ]; then
    echo "Using: sudo yum -y install ansible"
    sudo yum -y install ansible
  else
    error_exit 
  fi
fi

## Deal with CentOS 7
if [ "$ID" == "centos" ]; then
  if [ $VERSION_ID -eq 7 ]; then
    echo "Installing EPEL and Ansible"
    sudo yum install -y epel-release
    sudo yum install -y ansible
  else
    error_exit
  fi
fi

## Deal with Ubuntu
if [ "$ID" == "ubuntu" ]; then
  case "$VERSION_ID" in
    16.04|17.10)
      echo "Adding PPA, then installing Ansible"
      sudo apt-add-repository ppa:ansible/ansible -y
      sudo apt-get update
      sudo apt-get install software-properties-common ansible python-apt -y
      ;;
    18.04)
      echo "Importing Ansible signing keys"
      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
      echo "Adding Ansible PPA, then installing Ansible"
      sudo apt-add-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu artful main"
      sudo apt-get update 
      sudo apt-get install ansible -y
      ;;
    *) 
      error_exit
      ;;
  esac
fi
