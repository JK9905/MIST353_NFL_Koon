--3 QUERIES
--1 EACH FOR CONFERENCEDIVISION AND TEAM TABLES, AND 1 JOIN QUERY
USE [mist353-nfl-koon];

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

-- Stored Procedure
GO

create or alter procedure procGetTeamsByConferenceDivision
(
    @Conference NVARCHAR(50) = NULL,
    @Division NVARCHAR(50) = NULL
)
AS
BEGIN
    select TeamName, TeamColors, Conference, Division
    from Team T
    inner join ConferenceDivision CD
        on CD.ConferenceDivisionID = T.ConferenceDivisionID
    where Conference = isnull(@Conference, Conference)
        and Division = isnull(@Division, Division)
END

SELECT * from Team;
Select * from ConferenceDivision;
/*
--execute the stored procedure with parameters
EXEC procGetTeamsByConferenceDivision @Conference = 'AFC', @Division = 'North';
EXEC procGetTeamsByConferenceDivision @Conference = 'AFC', @Division = NULL;
EXEC procGetTeamsByConferenceDivision @Conference = NULL, @Division = 'North';
EXEC procGetTeamsByConferenceDivision @Conference = NULL, @Division = NULL;
*/


GO




create or alter procedure procfindallteamsbymyteamname
(
    @TeamName NVARCHAR(50)
)
AS

BEGIN


SELECT OtherTeam.TeamName
FROM Team MyTeam INNER JOIN Team OtherTeam
ON MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID 
WHERE MyTeam.TeamName = @TeamName AND OtherTeam.TeamName != @TeamName;

END
/*
--execute the stored procedure with parameters
EXEC procfindallteamsbymyteamname @TeamName = 'Pittsburgh Steelers';
*/