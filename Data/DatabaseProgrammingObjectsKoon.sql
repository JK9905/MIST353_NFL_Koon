--3 QUERIES
--1 EACH FOR CONFERENCEDIVISION AND TEAM TABLES, AND 1 JOIN QUERY
USE MIST353_NFL_RDB_Koon;

-- Query 1: Select all data from ConferenceDivision table
SELECT * FROM ConferenceDivision
WHERE Conference = 'NFC'
AND Division = 'South';

-- Query 2: Select all data from Team table
SELECT * FROM Team 
WHERE TeamColors = 'Black, Orange, White'
AND TeamID = 2;

-- Query 3: Join ConferenceDivision and Team tables to show team information with conference and division details
SELECT TeamName, TeamCityState, TeamColors, Conference, Division
FROM Team t
JOIN ConferenceDivision cd ON t.ConferenceDivisionID = cd.ConferenceDivisionID
WHERE Conference = 'AFC'
AND Division = 'North';