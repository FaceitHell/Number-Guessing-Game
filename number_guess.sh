#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --tuples-only -c"

echo "Enter your username:"

read USERNAME


USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  USER_INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome $USERNAME! It looks like this is your first time here."
else
  IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< "$($PSQL "SELECT * FROM users WHERE user_id=$USER_ID")"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
RANDOM_NUMBER=$((RANDOM % 1001))
echo $RANDOM_NUMBER
GUESSES=0
while true
do
read GUESS
GUESSES=$((GUESSES+1))
echo $GUESSES

if ! [[ $GUESS =~ ^-?[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"

elif [[ $GUESS > $RANDOM_NUMBER ]]
then
  echo "It's lower than that, guess again:"

elif [[ $GUESS < $RANDOM_NUMBER ]]
then
  echo "It's higher than that, guess again:"

else
  if [[ $BEST_GAME=0 ]]
  then
    BEST_GAME=$GUESSES
  else
    if [[ $BEST_GAME > $GUESSES ]]
    then
      BEST_GAME=$GUESSES
    fi
  fi
  echo $BEST_GAME
  GAMES_PLAYED=$((GAMES_PLAYED+1))
  UPDATE_USER_INFO=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID")
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  break
fi
done