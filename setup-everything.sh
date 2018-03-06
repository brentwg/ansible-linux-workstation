#!/usr/bin/env bash
# ------------------------------------------------------------------------
# Wrapper script used to bootstrap, install, and configure everything 
# required to execute this playbook.
#
# Brent WG
# 2018-03-05
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

# --------------------
# Execute the playbook
# --------------------
