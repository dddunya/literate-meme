#!/bin/bash

# ============================================================
#   				🤖 JENKINS AUTOMATION JOB
#   					Author: dddunya
#   										Date: 12.10.2025
# ============================================================
#		This is a script automatically copies
#		installed pdf's from bs to my ~/Conspects directory.
#		The script also logs its progress
#		and sends a Telegram notification on success/failure.
# ============================================================
#          .--.
#         |o_o |
#         |:_/ |
#        //   \ \
#       (|     | )
#      /'\_   _/`\
#      \___)=(___/
# ============================================================

#Debugging options
#set -x
#set+e

#Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Important vars
CONSPECTS_DIR=/Users/daniaoparko/Conspects

DOWNLOADS_DIR=/Users/daniaoparko/Downloads

URL="https://3251.drive.bycs.de/"

free() {
	echo
}

TAB='\t'
# Make a window to choose in which directory will my pdf conspect go
clear
free
free
echo -e "$tab${YELLOW}		📁 Enter target directory for your PDF: ${NC}"
free
echo -e "${GREEN}🗂️  Directory listing${NC}"
echo "──────────────────────────────"
ls $CONSPECTS_DIR | nl | column -t
echo "──────────────────────────────"
read choice

case $choice in
1)
	dir="$CONSPECTS_DIR/AP/"
	;;
2)
	dir="$CONSPECTS_DIR/Deustch/"
	;;
3)
	dir="$CONSPECTS_DIR/Englisch/"
	;;
4)
	dir="$CONSPECTS_DIR/ITS/"
	;;
5)
	dir="$CONSPECTS_DIR/ITT-1/"
	;;
6)
	dir="$CONSPECTS_DIR/ITT-2/"
	;;
7)
	dir="$CONSPECTS_DIR/PuG/"
	;;
*)
	echo "❌ Invalid choice"
	exit 1
	;;
esac

mv $DOWNLOADS_DIR/my_file.pdf "$dir"
