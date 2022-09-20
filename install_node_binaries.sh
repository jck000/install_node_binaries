#!/bin/bash

#
# This is a shell script designed to download and install node binaries to Ubuntu.  It's been tested with Ubuntu 22.04.
#
#  You must run is as root.  
#  Edit the VERSION and DISTRO variables to download and instal install them.  
#


### vvv Edit these two lines vvv ###

VERSION=v16.17.0
DISTRO=linux-x64

### ^^^ Edit these two lines ^^^ ###

if [ $UID -ne 0 ] ; then
  echo "
	
	You MUST be root to run this script.

	"
  exit
fi

if [ -f "/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin/node" ] ; then
  echo "
 
   There is a directory designated for this version.  Please remove it and run this script again to install.
 
   "
   exit
fi

is_xz_installe=`which xz`
is_wget_installe=`which wget`

if [ -z '"$is_xz_installed" ] ; then
  echo "Installing xz-utils .... "
  apt-get -y install xz-utils
  echo "DONE 
  "
fi

if [ -z '"$is_wget_installed" ] ; then
  echo "Installing wget .... "
  apt-get -y install wget
  echo "DONE 
  "
fi

#
# Start here
#

cd /tmp
wget "https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz"

if [ ! -d /usr/local/lib/nodejs ] ; then
  echo "Making the directory /usr/local/lib/nodejs ... "
  mkdir -p /usr/local/lib/nodejs
  echo "DONE 
  "

fi

echo "Extracting the binaries to /usr/local/lib/nodejs ... "
tar -xJvf /tmp/node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
echo "DONE
"

if [ -f /etc/profile.d/node.sh ] ; then
  echo "Editing /etc/profile.d/node.sh ... "
  sed 's/^/### /g' < /etc/profile.d/node.sh > /tmo/node.sh
  echo "DONE
  "
  mv /tmp/node.sh /etc/profile.d/node.sh
fi

 echo "Adding node path to /etc/profile.d/node.sh ... "
echo "
#
# Added by install_node_binary.sh on `date`
#
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

 " >> /etc/profile.d/node.sh 


source /etc/profile.d/node.sh

echo "DONE "



node -v
npm version


