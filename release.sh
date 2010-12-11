#!/bin/bash

# This is a small script to create release tarballs for pdfmerge4unix
# You may use it for creating own tarballs of your programs also.
#
# (C) Copyright 2010 by Dominic Hopf <dmaphy@googlemail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Any feedback or improvement is appreciated.
#
# To use it, place it one directory above your source root and type
# something like
#	./release.sh pdfmerge 1.0.3

usage()
{
	echo "Usage: `basename $0` <program> <version>"
	exit 1;
}

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtrst='\e[0m'    # Text Reset


if [ $# -ne 2 ]; then
	usage
fi


if [ -d $1 ]; then
	PROGRAM=$1
else
	echo "Directory $1 does not exist"
	exit 1
fi


mkdir -p "./releases/"


VERSION=$2
RELEASE="./releases/$PROGRAM-$VERSION"


if [ -d $RELEASE ]; then
	echo -n "Directory $RELEASE already existing. Deleting..."
	rm -r $RELEASE
	echo -e "\t $txtgrn done $txtrst"
fi

echo -n "Copying sourcecode to release directory..."
cp -rp $PROGRAM $RELEASE
echo -e "\t\t\t\t $txtgrn done $txtrst"

echo -n "Deleting unneccessary version control files..."
rm -rf $RELEASE/.git*
echo -e "\t\t\t\t $txtgrn done $txtrst"

echo -n "Creating release tarball $PROGRAM-$VERSION.tar.bz2..."
cd ./releases/
tar cjf "$PROGRAM-$VERSION.tar.bz2" "$PROGRAM-$VERSION"
echo -e "\t\t\t $txtgrn done $txtrst"

echo -e "\n$txtgrn Your release was successfully created $txtrst"
