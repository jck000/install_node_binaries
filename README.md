# install_node_binaries

This is a simple shell script to download and install node/npm binaries for Linux.  I use this to instll binaries for my Ionic development and runtimes.

There are two environment variables you must edit:  VERSION and DISTRO.  Once you edit those, run the script as root.  It will create all necessary directories, add the location of these scripts to your path.  The path settings will be global.  They're set in /etc/profile.d/node.sh

The script utilizes wget and xz to download and uncompress the tar file from nodejs.org.  If you don't have those utilites available, it will install them for you.

Once downloaded, the files are extracted into /usr/local/lib/nodejs/version-distro.  You must logout and login again in order to get the proper environment settings.  The path variable will be set for all users when they login next.

If you rerun this script and a copy of nodejs it previously created exists, it will stop and tell you to remove it.  /etc/profile.d/node.sh will be edited if it already exists.  When edited, it will comment out all previous entries in the file with '#' and add the new entries at the bottom.  









