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

DIRNAME=`dirname $0`
NEEDED_FILES="$DIRNAME/jamx.rc $DIRNAME/jamx-functions.rc $DIRNAME/colors.rc"
for NEEDED_FILE in $NEEDED_FILES;do
	if [ ! -r $NEEDED_FILE ];then
		echo "Missing $NEEDED_FILE. Something is wrong with your ENV. Exiting."
		exit 1
	fi
	. $NEEDED_FILE
done

echo -en "${CYAN}Welcome to $PRODUCT_NAME new package generator!

This wizard will guide you through creating a new package.

${YELLOW}STEP: Select a package name 

${CYAN}If your project has more than one word in its name, separate them with a '-'.

Package Name:${NORMAL}
"
read PACKAGE_NAME

PACKAGE_RC_DIR="$DIRNAME/jamx-packages-meta/${PACKAGE_NAME}"
PACKAGE_RC_FILE="$PACKAGE_RC_DIR/${PACKAGE_NAME}.rc"
PACKAGE_DESC_FILE="$PACKAGE_RC_DIR/DESCRIPTION"

if [ -s "$PACKAGE_RC_FILE" ];then
	echo -en "${BRIGHT_RED}$PACKAGE_RC_FILE already exists.
If you wish to regerate it, first remove this copy.
${NORMAL}"
	exit 2
fi

mkdir -p $DIRNAME/jamx-packages-meta/${PACKAGE_NAME}
cp $DIRNAME/jamx-packages-meta/skel.template $PACKAGE_RC_FILE
sed -i "s^@@PACKAGE_NAME@@^$PACKAGE_NAME^g" $PACKAGE_RC_FILE


echo -en "
${YELLOW}STEP: Package source URL

${CYAN}URL to download $PACKAGE_NAME source from:${NORMAL}
"
read SOURCE_URL
sed -i "s^@@SOURCE_URL@@^$SOURCE_URL^g" $PACKAGE_RC_FILE

while ! validate_url $SOURCE_URL;do
	echo -en "${BRIGHT_RED}Could not access $SOURCE_URL. 

${CYAN}URL to download $PACKAGE_NAME source from:${NORMAL}"
	read -e SOURCE_URL
done

echo -en "
${YELLOW}STEP: Package version

${CYAN}$PACKAGE_NAME version:${NORMAL}
"
read -e PACKAGE_VERSION
sed -i "s^@@PACKAGE_VERSION@@^$PACKAGE_VERSION^g" $PACKAGE_RC_FILE

echo -en "
${YELLOW}STEP: ENVs to build $PACKAGE_NAME for${NORMAL}

${CYAN}Supported ENVs are: ${GREEN}$AVAILABLE_ENVS${CYAN}

Provide a comma separated list of the ENVs you want to package $PACKAGE_NAME for:
${NORMAL}
" 

read -e SUPPORTED_ENVS
while ! validate_target_envs $SUPPORTED_ENVS;do
	echo -en "${BRIGHT_RED}The following ENVs are not supported: $UNSUPPORTED_ENVS
${CYAN}Supported ENVs are: ${GREEN}$AVAILABLE_ENVS${CYAN}

Provide a comma separated list of the ENVs you want to package $PACKAGE_NAME for:
${NORMAL}
" 
	unset UNSUPPORTED_ENVS
	read -e SUPPORTED_ENVS
done
sed -i "s^@@SUPPORTED_ENVS@@^$SUPPORTED_ENVS^g" $PACKAGE_RC_FILE

echo -en "
${YELLOW}STEP: Describe your package.

${CYAN}This will be part of your package metadata and will appear when users search for it.
The first line should consist of a short summary, after that, you may provide a longer description. 

${CYAN}$PACKAGE_NAME description:${NORMAL}
" 
if [ -z "$EDITOR" ];then
	EDITOR=nano
fi
$EDITOR $PACKAGE_DESC_FILE


# optional for deb. If not supplied, use container's dist name
# DIST_NAME


