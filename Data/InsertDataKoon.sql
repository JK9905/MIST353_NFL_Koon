--insert data 
--insert all the ConferenceDivison data (8 rows)
--insert team data for AFC North (4 rows)
-- team IDs',conferences and divisions
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (1,"AFC","East");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (2,"AFC","North");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (3,"AFC","South");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (4,"AFC","West");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (5,"NFC","East");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (6,"NFC","North");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (7,"NFC","South");
INSERT INTO ConferenceDivision(ConferenceDivisionID,Conference,Division)
VALUES (8,"NFC","West");

-- Team information for AFC North
INSERT INTO Team(TeamID,TeamName,TeamCityState,TeamColors,ConferenceDivisionID,TeamLogo)
VALUES (1,"Baltimore Ravens","Baltimore, MD","Purple, Black, Metallic Gold",2,"C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Ravens.png");
INSERT INTO Team(TeamID,TeamName,TeamCityState,TeamColors,ConferenceDivisionID,TeamLogo)
VALUES (2,"Cincinnati Bengals","Cincinnati, OH","Black, Orange, White",2,"C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Bengals.png");
INSERT INTO Team(TeamID,TeamName,TeamCityState,TeamColors,ConferenceDivisionID,TeamLogo)
VALUES (3,"Cleveland Browns","Cleveland, OH","Brown, Orange, White",2,"C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Browns.png");
INSERT INTO Team(TeamID,TeamName,TeamCityState,TeamColors,ConferenceDivisionID,TeamLogo)
VALUES (4,"Pittsburgh Steelers","Pittsburgh, PA","Black, Gold, White",2,"C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Steelers.png");