#!/bin/bash

#
#
#
#
#
#
#
#

#Debugging options
#set +x
#set+e

#Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

#Tabs
tab='\t'

#Free line
free() {
  echo
}

welcome() {
  #Welcome screen
  clear
  free
  echo -e "$tab${NC}##################################"
  echo -e "$tab${NC}#                                #"
  echo -e "$tab# ${YELLOW}Welcome to Guess the Number!🎲 ${NC}#"
  echo -e "$tab${NC}#                                #"
  echo -e "$tab${NC}##################################\n"

  #Rules
  echo -e "$tab${NC} The rules are simple:"
  free #4 spaces
  echo -e "$tab${NC}   - The computer will randomly pick a secret number."
  echo -e "$tab${NC}   - Your job is to guess it as quickly as possible."
  echo -e "$tab${NC}   - After each guess, you’ll be told if the number is higher or lower than your choice."
  echo -e "$tab${NC}   - The fewer attempts you need, the better your score!"
  free
  echo -e "$tab${CYAN}     At the end of the game, your score will be recorded on the Scoreboard 🏆."
}

#Game function
my_game() {
  ##Attempts
  attempts=1
  #Random number
  num=$((RANDOM % 11))
  regex_pattern="^([0-9]|10)$"
  free
  echo -e "$tab$tab${NC}     Please enter your name to start"
  free
  read name
  clear
  free
  echo -e "$tab$tab${YELLOW}     🎯 Guess a number between 1 and 10:"
  read guess

  ##Loop for the right guess and attempts
  while [[ "$guess" -ne "$num" ]]; do
    attempts=$(($attempts + 1))
    if [[ $guess =~ $regex_pattern ]]; then
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
    else
      echo "Input is not a valid number"
      read guess
    fi
  done

  free
  echo -e "$tab${GREEN}✅Correct! You guessed it in $attempts attempts!"
  free

  #Update scoreboard

}

welcome

#Option-play
while true; do #ask Faysal
  free
  free
  echo -e "$tab${CYAN} Choose an option to begin:"
  free
  echo -e "$tab${YELLOW}     1. View Scoreboard 🏆"
  echo -e "$tab${CYAN}     2. Start Playing ▶️"
  echo -e "$tab${RED}     3. Exit ❌"
  read option
  case $option in
  1)
    clear
    free
    echo -e "$tab${YELLOW} 🏆 Scoreboard:${NC}"
    free
    free
    bat --style=numbers scoreboard.txt #Alternative to "cat"
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
  *)
    clear
    welcome
    free
    echo -e "${RED} Please choose one of the options above"
    ;;
  esac

done
