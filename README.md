# WorldCup-DB


World Cup Database
Instructions

The games.csv file provided contains a comma-separated list of all games of the final three rounds of the World Cup tournament since 2014; the titles are at the top. It includes the year of each game, the round of the game, the winner, their opponent, and the number of goals each team scored.  Three things needed to do for this project:

Part 1: Create the database

Log into the psql interactive terminal and create the database structure according to the user stories below.

Part 2: Insert the data

Complete the insert_data.sh script to correctly insert all the data from games.csv into the database. The tests have a 20 second limit, so the script must be efficient. The less you have to query the database, the faster it will be. To empty the rows in the tables of the database, TRUNCATE TABLE games, teams is used;

Part 3: Query the database

Complete the empty echo commands in the queries.sh file to produce output that matches the expected_output.txt file (provided in the code editor). The file has some starter code, and the first query was completed. Used the PSQL variable defined to complete rest of the queries. Note that it is need to have the database filled with the correct data from the script to get the correct results from your queries. Hint: Test your queries in the psql prompt first and then add them to the script file.

##Notes:
To rebuild the database, enter psql -U postgres < worldcup.sql in a terminal where the .sql file is.

Completed the user stories-tasks below

You should create a database named worldcup

You should connect to your worldcup database and then create teams and games tables

Your teams table should have a team_id column that is a type of SERIAL and is the primary key, and a name column that has to be UNIQUE

Your games table should have a game_id column that is a type of SERIAL and is the primary key, a year column of type INT, and a round column of type VARCHAR

Your games table should have winner_id and opponent_id foreign key columns that each reference team_id from the teams table

Your games table should have winner_goals and opponent_goals columns that are type INT

All of your columns should have the NOT NULL constraint

Your two script (.sh) files should have executable permissions. Other tests involving these two files will fail until permissions are correct. When these permissions are enabled, the tests will take significantly longer to run

When you run your insert_data.sh script, it should add each unique team to the teams table. There should be 24 rows

When you run your insert_data.sh script, it should insert a row for each line in the games.csv file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the teams table (you cannot hard-code the values)

You should correctly complete the queries in the queries.sh file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the expected_output.txt file exactly, take note of the number of decimal places in some of the query results

