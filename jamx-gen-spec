#!/bin/bash - 
#===============================================================================
#          FILE: jamx-gen-spec.sh
#         USAGE: ./jamx-gen-spec.sh 
#   DESCRIPTION: Will accept a source in the form of a URL or local FS path and generate spec files 
#       OPTIONS: source path
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jess Portnoy (), <jess@jam-x.io>
#  ORGANIZATION: JaM-X.
#       CREATED: 02/20/2016 10:48:56 PM GMT
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
- get source URL or local FS path
	- if URL:
		- fetch and extract
	- if local
		- if archive
			- extract
	
- analyze source for build and runtime dependencies
- generate spec 
      - description
      - source URL
      - license - try to auto detect looking for files named license/i or copyright/i
      - arch - try to auto detect whether noarch/indep according to source type. For example, if the source is PHP||Perl||Python||many others only, then it is indep.
      - changelog
	- for deb we have debchange and dh-make already takes care of the initial import
	- need a parallel for RPM
      - auto detect config files
      - dev package
      - maintainer 
	- check MAIL and DEBEMAIL ENV vars for email
	- check DEBFULLNAME and MAINTAINER_NAME for name

For deb packages dh_make makes a sound base for generating skeleton files, we then need to add the missing pieces.
For RPMs a new tool will need to be created

prepare_source()
{

}

is_arch_indep()
{

}

detect_deps()
{

}
