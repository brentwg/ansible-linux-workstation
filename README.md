# Ansible Playbook: Linux DevOps Workstation
[![Build Status](https://travis-ci.org/brentwg/ansible-linux-workstation.svg?branch=master)](https://travis-ci.org/brentwg/ansible-linux-workstation)

This playbook installs and configures mostly everything I need to perform Cloud DevOps activities on my Linux workstation. I have automated as much as I can but I have not completely eliminated all manual operations. This is still very much a work in progress. It was inspired by [Jeff Geerling's](https://github.com/geerlingguy) project: [Mac Development Ansible Playbook](https://github.com/geerlingguy/mac-dev-playbook).  

## Installation

1. Ensure that [git](https://git-scm.com/) is installed
1. Clone this repo
1. Run the `./setup_everything.sh` command

> **NOTE**: Your Linux user account will require `sudo` privileges.  

## Intended Linux Distributions

This playbook has been tested to work with the following Linux distributions (and versions):

- [CentOS](https://www.centos.org/) 7
- [Fedora](https://getfedora.org/) 27
- [Ubuntu](https://www.ubuntu.com/) 16.04
- [Ubuntu](https://www.ubuntu.com/) 17.10  

## Included Ansible Roles
This playbook automatically downloads the following custom Ansible roles:

- [brentwg.linux-customization](https://github.com/brentwg/ansible-role-linux-customization)
- [brentwg.google-chrome](https://github.com/brentwg/ansible-role-google-chrome)
- [brentwg.multimedia](https://github.com/brentwg/ansible-role-multimedia)
- [brentwg.vagrant](https://github.com/brentwg/ansible-role-vagrant)
- [brentwg.packer](https://github.com/brentwg/ansible-role-packer)
- [brentwg.terraform](https://github.com/brentwg/ansible-role-terraform)
- [brentwg.visual-studio-code](https://github.com/brentwg/ansible-role-visual-studio-code)
- [brentwg.docker](https://github.com/brentwg/ansible-role-docker)
- [brentwg.pip](https://github.com/brentwg/ansible-role-pip)
- [brentwg.gcloud-sdk](https://github.com/brentwg/ansible-role-gcloud-sdk)

## Defaults
Each of the roles listed above have defaults that you can override. However, in order to minimize input, I tried to provide sane defaults that made the most sense to me. In any regard, this playbook has the following defaults specified:  

### For Vagrant
```
vagrant_version: "2.0.2"
vagrant_arch: "x86_64"
```

### For Packer
```
packer_version: "1.2.0"
packer_arch: "amd64"
```

### For Terraform
```
terraform_version: "0.11.3"
terraform_arch: "amd64"
```

### For Python Pip (Additional packages)
```
pip_install_packages:
  - name: awscli
    state: latest
```

## Included Applications (and Groups)
### RedHat
- vim-enhanced
- gnome-tweak-tool
- pass
- gnupg
- curl
- htop
- yum-utils
- gparted
- libselinux-python
- selinux-policy
- Development Tools (Group)
- Virtualization (Group)

### Ubuntu
- vim
- pass
- gnupg
- curl
- htop
- build-essential
- gparted
- bridge-utils
- qemu-kvm
- libvirt-bin
- virt-manager

### All Linux Families
- openssh-server
- [Chrome](https://www.google.com/chrome/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [FFmpeg](https://www.ffmpeg.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Packer](https://www.packer.io/)
- [Terraform](https://www.terraform.io/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker CE](https://www.docker.com/community-edition)
- [Python Pip](https://pypi.python.org/pypi/pip)
- [AWS CLI](https://aws.amazon.com/cli/)
- [GCP Cloud SDK](https://cloud.google.com/sdk/)

## Configuration Details 
- Enable SSH server
- Modify default sshd config
- Enable nopasswd `sudo`
- Disable SELinux

## Manual Operations
- Create gnupg keys
- Configure pass
- Configure pass USB remote repo

## Future Considerations
- more dot files
- vimrc
- VS Code extensions
- VS Code preferences
- Gnome dock favorites
- Python development environment
- Ruby development environment
- Golan development environment
