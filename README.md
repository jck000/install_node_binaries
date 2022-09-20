# install_node_binaries

This is a simple shell script to download and install node/npm binaries for Linux.  I use this to instll binaries for my Ionic development and runtimes.

There are two environment variables you must edit:  VERSION and DISTRO.  Once you edit those, run the script as root.  It will create all necessary directories, add the location of these scripts to your path.  The path settings will be global.  They're set in /etc/profile.d/node.sh







