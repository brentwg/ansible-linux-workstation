#!/usr/bin/env bash
# ------------------------------------------------------------------------
# Wrapper script used to bootstrap, install, and configure everything 
# required to execute this playbook.
#
# Brent WG
# 2018-03-05
# 2018-03-06
# ------------------------------------------------------------------------

# ----------------
# Script Variables
# ----------------
INSTALL_ANSIBLE_URL="https://gist.githubusercontent.com/brentwg/adf4625a61c5ee6ce15749cb772df974/raw/"
INSTALL_ANSIBLE_SCRIPT="${PWD}/scripts/install-ansible.sh"

# ---------------
# Install Ansible
# ---------------
if [ ! -f ${INSTALL_ANSIBLE_SCRIPT} ]; then
  wget -O ${INSTALL_ANSIBLE_SCRIPT} ${INSTALL_ANSIBLE_URL}
fi

chmod +x ${INSTALL_ANSIBLE_SCRIPT}
sudo ${INSTALL_ANSIBLE_SCRIPT}

# --------------------
# Install Requirements
# --------------------
# Use -f to force overwriting of existing roles (for testing)
ansible-galaxy install -f -r ./requirements.yml

# --------------------
# Execute the playbook
# --------------------
# Check to see if sudo has nopasswd enabled
if (sudo -n true) ; then
  ansible-playbook ./main.yml
else
  # otherwise prompt for sudo password
  ansible-playbook ./main.yml --ask-become-pass
fi

# --------
# Clean up
# --------
rm -fv $INSTALL_ANSIBLE_SCRIPT
