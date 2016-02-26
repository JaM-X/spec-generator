#!/bin/bash - 
#===============================================================================
#          FILE: jamx-new-package.sh
#         USAGE: ./jamx-new-package.sh 
#   DESCRIPTION: 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jess Portnoy (), <jess@jam-x.io>
#  ORGANIZATION: JaM-X.
#       CREATED: 02/26/2016 03:27:57 PM GMT
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
DIRNAME=`dirname $0`
if [ ! -r $DIRNAME/jamx.rc ];then
	echo "Missing $DIRNAME/jamx.rc. Something is wrong with your ENV. Exiting."
	exit 1
fi
. $DIRNAME/jamx.rc

if [ -r $DIRNAME/colors.sh ];then
	. $DIRNAME/colors.sh
fi
echo -en "${CYAN}Welcome to $PRODUCT_NAME new package generator!

This wizard will guide you through creating a new package.

${YELLOW}STEP: Select a package name 

${CYAN}If your project has more than one word in its name, separate them with a '-'.

Package Name:${NORMAL}
"
read PACKAGE_NAME

echo -en "
${YELLOW}STEP: ENVs to build $PACKAGE_NAME for${NORMAL}

${CYAN}Supported ENVs are: ${GREEN}$AVAILABLE_ENVS${CYAN}

Provide a comma separated list of the ENVs you want to package $PACKAGE_NAME for:
${NORMAL}
" 

read SUPPORTED_ENVS
# URL to download the package source from
SOURCE_URL=""
PACKAGE_VERSION=""
# optional for deb. If not supplied, use container's dist name
# DIST_NAME


