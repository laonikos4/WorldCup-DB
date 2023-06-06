#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
  #Check if the name of a winner does not exists, exclude the first line of the dataset, then insert Winner team name 
  TEAM_WINNER=$($PSQL "SELECT name FROM teams WHERE name='$WINNER' ")
  if [[ $WINNER != 'winner' && -z $TEAM_WINNER ]]
  then
    INSERT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')" )
  fi

  #Check if the name of a opponent does not exists, exclude the first line of the dataset, then insert Opponent team name
  TEAM_OPP=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT' ")
  if [[ $OPPONENT != 'opponent' && -z $TEAM_OPP ]]
  then
    INSERT2=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')" )
  fi

  #Reading the ids of the names of the winners and opponents repsectively, exclude the first line and then insert data
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")

  if [[ $YEAR != 'year' ]]
  then
    INSERT3=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS) ")
  fi
done
