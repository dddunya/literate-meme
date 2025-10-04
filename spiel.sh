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

#Welcome menu
welcome_menu() {
	free
	echo -e "\t${NC}##################################"
	echo -e "\t${NC}#                                #"
	echo -e "\t# ${YELLOW}Welcome to Guess the Number!🎲 ${NC}#"
	echo -e "\t${NC}#                                #"
	echo -e "\t${NC}##################################\n"
}
welcome_menu

#Rules_menu
rules_menu() {
	echo -e "\t${NC} The rules are simple:"
	free #4 spaces
	echo -e "\t${NC}   - The computer will randomly pick a secret number."
	echo -e "\t${NC}   - Your job is to guess it as quickly as possible."
	echo -e "\t${NC}   - After each guess, you’ll be told if the number is higher or lower than your choice."
	echo -e "\t${NC}   - The fewer attempts you need, the better your score!"
	free
	echo -e "\t${CYAN}     At the end of the game, your score will be recorded on the Scoreboard 🏆."
}
rules_menu

#Option-menu
option_menu_home() {
	free
	free
	echo -e "\t${CYAN} Choose an option to begin:"
	free
	echo -e "\t${YELLOW}     1. View Scoreboard 🏆"
	echo -e "\t${CYAN}     2. Start Playing ▶️"
	echo -e "\t${RED}     3. Exit ❌"
	read option
}
option_menu_home

# Option_menu_ingame  Opens a menu IN THE GAME

option_menu_ingame() {
	echo -e "\t${YELLOW}     1. View Scoreboard 🏆"
	echo -e "\t${CYAN}     2. Play again ▶️"
	echo -e "\t${GREEN}     3. Menu 🚀"
	echo -e "\t${RED}     4. Exit ❌"
	read option_ingame
}
#Menu
menu() {
	welcome_menu
	rules_menu
	option_menu_home
	my_game
}

#Option-scoreboard

#Game-function
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
	option_menu_ingame
}

#Option-play
if [ "$option" = "2" ] || [ "$option" = "play" ] || [ "$option" = "Play" ]; then
	clear
	my_game
fi

#Option-exit

if [ "$option" = "3" ] || [ "$option" = "ex" ] || [ "$option" = "exit" ] || [ "$option" = "Exit" ]; then
	free
	echo "Bye"
fi

#Ingame-menu

#Option-scoreboard-ingame

#Option-play-again-ingame
if [ "$option_ingame" = "2" ] || [ "$option_ingame" = "play" ] || [ "$option_ingame" = "Play" ] || [ "$option_ingame" = "Play again" ]; then
	while [ "$option_ingame" = "2" ] || [ "$option_ingame" = "play" ] || [ "$option_ingame" = "Play" ] || [ "$option_ingame" = "Play again" ]; do
		free
		clear
		my_game
	done
fi
#Option-exit-to-menu-ingame

if [ "$option_ingame" = "3" ] || [ "$option_ingame" = "menu" ] || [ "$option_ingame" = "Menu" ] || [ "$option_ingame" = "m" ]; then
	while [ "$option_ingame" = "3" ] || [ "$option_ingame" = "menu" ] || [ "$option_ingame" = "Menu" ] || [ "$option_ingame" = "m" ]; do
		free
		menu
	done

fi

#Option-exit-ingame

if [ "$option_ingame" = "4" ] || [ "$option_ingame" = "ex" ] || [ "$option_ingame" = "exit" ] || [ "$option_ingame" = "Exit" ]; then
	free
	echo "Bye"
fi

#heeeey
