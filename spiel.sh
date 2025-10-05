#!/bin/bash

#
#
#
#
#
#
#
#

#Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

#Game vars
# num=$((RANDOM % 11))

# tab='\t'

#Free line
free() {
	echo
}
#Game function
my_game() {
	##Attempts
	attempts=1
	#Random number
	num=$((RANDOM % 11))
	free
	echo -e "\t\t${NC}     Please enter your name to start"
	free
	read name
	clear
	free
	echo -e "\t\t${YELLOW}     🎯 Guess a number between 1 and 10:"
	read guess

	##Loop for the right guess and attempts
	while [[ "$guess" -ne "$num" ]]; do
		attempts_new=$(($attempts + 1))

		if [[ "$guess" -lt "$num" ]]; then
			echo -e "${RED}⬇ Too low! Try again."
			read guess
		elif [[ $guess -gt "10" ]]; then

			echo "Please enter a number between 1 and 10:"
			read guess

		elif [[ "$guess" -gt "$num" ]]; then

			echo -e "${RED}⬆ Too high! Try again."
			read guess

		fi

	done

	free
	echo -e "\t${GREEN}✅Correct! You guessed it in $attempts attempts!"
	free

}
clear
#Welcome screen
free
echo -e "\t${NC}##################################"
echo -e "\t${NC}#                                #"
echo -e "\t# ${YELLOW}Welcome to Guess the Number!🎲 ${NC}#"
echo -e "\t${NC}#                                #"
echo -e "\t${NC}##################################\n"

#Rules
echo -e "\t${NC} The rules are simple:"
free #4 spaces
echo -e "\t${NC}   - The computer will randomly pick a secret number."
echo -e "\t${NC}   - Your job is to guess it as quickly as possible."
echo -e "\t${NC}   - After each guess, you’ll be told if the number is higher or lower than your choice."
echo -e "\t${NC}   - The fewer attempts you need, the better your score!"
free
echo -e "\t${CYAN}     At the end of the game, your score will be recorded on the Scoreboard 🏆."

#Option-play
while true; do
	free
	free
	echo -e "\t${CYAN} Choose an option to begin:"
	free
	echo -e "\t${YELLOW}     1. View Scoreboard 🏆"
	echo -e "\t${CYAN}     2. Start Playing ▶️"
	echo -e "\t${RED}     3. Exit ❌"
	read option
	case $option in
	1)
		clear
		free
		echo -e "\t${YELLOW} 🏆 Scoreboard:${NC}"
		free
		free
		bat --style=numbers scoreboard.txt
		;;
	2)
		clear
		my_game
		free
		;;
	3)
		echo -e "${RED}Bye! 👋${NC}"
		exit 0
		;;
	esac

done
