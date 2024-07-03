#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_TO_GUESS=$((1 + $RANDOM % 1000 ))
NUMBER_OF_GUESSES=0

GAMES_PLAYED=0
BEST_SCORE=0

MAIN () {
  #prompt for username
  echo Enter your username:
  read USERNAME
  
  #get username from database
  USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")
  #if not found
  if [[ -z $USER_ID ]]
  then 
    INSERT_USERNAME=$($PSQL "INSERT INTO users (username, best_score) VALUES ('$USERNAME', 5000)")
      #if not inserted
      if [[ $INSERT_USERNAME == 'INSERT 0 1' ]]
      then
      #greet user
        USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")
        echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
      #else
      else
      #return to main
        MAIN
      fi
  #else
  else 
    #get user info
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users where user_id=$USER_ID")
    BEST_SCORE=$($PSQL "SELECT best_score FROM users where user_id=$USER_ID")
    #greet user
      echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
  fi

  #prompt for number input
  echo -e "\nGuess the secret number between 1 and 1000:"
  #echo -e "\nCheatcode activated, number is $NUMBER_TO_GUESS"
while true; do
  #force input from terminal
  read GUESS 

  #count number of guesses
  #if not a number
  if [[ $GUESS =~ ^[0-9]{1,4}$ ]]
  then
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    #if lower
    if [[ $GUESS -eq $NUMBER_TO_GUESS ]]
    then
      break
    #else if greater
    elif [[ $GUESS -lt $NUMBER_TO_GUESS ]]
    then
      #display message
      echo -e "\nIt's higher than that, guess again:"
    #else
    else 
      #display  message
      echo -e "\nIt's lower than that, guess again:"
    fi
  else
    #display message
    echo -e "\nThat is not an integer, guess again:"
  fi
done

#display victory message
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
#register user score
GAMES_PLAYED=$((GAMES_PLAYED+1))
BEST_SCORE=$($PSQL "SELECT best_score FROM users WHERE user_id=$USER_ID")

if [[ $BEST_SCORE -gt $NUMBER_OF_GUESSES ]]
then 
  BEST_SCORE=$NUMBER_OF_GUESSES
  INSERT_SCORE=$($PSQL "UPDATE users SET (games_played, best_score)=($GAMES_PLAYED, $BEST_SCORE) where user_id=$USER_ID")
else 
  INSERT_SCORE=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED where user_id=$USER_ID")
fi
}

MAIN
