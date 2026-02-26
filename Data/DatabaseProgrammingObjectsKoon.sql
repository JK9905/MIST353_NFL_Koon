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
    from team T
    inner join ConferenceDivision CD
        on CD.ConferenceDivisionID = T.ConferenceDivisionID
    where Conference = isnull(@Conference, Conference)
        and Division = isnull(@Division, Division)
END


GO




create or alter procedure findallteamsbymyteamname
(
    @TeamName NVARCHAR(50)
)
AS
BEGIN
declare @myteamname nvarchar(50) = 'Steelers';

    SELECT * FROM Team

SELECT OtherTeam.TeamName
FROM Team MyTeam INNER JOIN Team OtherTeam
ON MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID 
WHERE TeamName = @myteamname AND OtherTeam.TeamName != @TeamName;

END