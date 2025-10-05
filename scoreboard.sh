#!/bin/bash

#script for adding users and their best to the scoreboard
#(might be deleted soon and moved to spiel.sh)
free() {
	echo
}

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
		attempts=$(($attempts + 1))

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
my_game

if grep -q "^$name:" scoreboard.txt; then
	sed -i "s/^$name:.*/$player:$attempts/" scoreboard.txt
else
	echo "$name:$attempts" >>scoreboard.txt
fi
