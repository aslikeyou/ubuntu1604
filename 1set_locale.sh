#!/bin/bash

# Set locales in /etc/default/locale file
echo "Setting locale..."
echo "# Locale settings
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8">>~/.bash_profile

locale-gen en_US.UTF-8

sudo dpkg-reconfigure locales

source ~/.bash_profile

# https://www.digitalocean.com/community/questions/warning-your-environment-specifies-an-invalid-locale-this-can-affect-your-user-experience-significantly-including-the-ability-to-manage-packages
# https://jee-appy.blogspot.mx/2016/02/set-locale-on-ubuntu-permanent-solution.html
