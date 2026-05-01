

--3 QUERIES
--1 EACH FOR CONFERENCEDIVISION AND TEAM TABLES, AND 1 JOIN QUERY
USE [mist353-nfl-koon];

-- Query 1: Select all data from ConferenceDivision table
/*SELECT * FROM ConferenceDivision
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
AND Division = 'North';*/

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

--SELECT * from Team;
--Select * from ConferenceDivision;
/*
--execute the stored procedure with parameters
EXEC procGetTeamsByConferenceDivision @Conference = 'AFC', @Division = 'North';
EXEC procGetTeamsByConferenceDivision @Conference = 'AFC', @Division = NULL;
EXEC procGetTeamsByConferenceDivision @Conference = NULL, @Division = 'North';
EXEC procGetTeamsByConferenceDivision @Conference = NULL, @Division = NULL;
*/


GO




create or alter procedure procGetOtherTeamsInSameConferenceDivisionAsSpecifiedTeam
(
    @TeamName NVARCHAR(50)
)
AS

BEGIN
SELECT OtherTeam.TeamName
FROM Team MyTeam INNER JOIN Team OtherTeam
ON MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID 
WHERE MyTeam.TeamName = @TeamName AND OtherTeam.TeamName != @TeamName;

SELECT OtherTeam.TeamName
FROM Team MyTeam INNER JOIN Team OtherTeam
ON MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID 
WHERE MyTeam.TeamName = @TeamName AND OtherTeam.TeamName != @TeamName;

END
/*
--execute the stored procedure with parameters
EXEC procGetOtherTeamsInSameConferenceDivisionAsSpecifiedTeam @TeamName = 'Pittsburgh Steelers';
*/
GO

create or alter procedure procValidateUser

(

  @Email NVARCHAR(100),

  @PasswordHash NVARCHAR(200)

)

AS

BEGIN

  select AppUserID, Firstname + ' ' + Lastname as Fullname, UserRole

  from AppUser

  where Email = @Email and 

  PasswordHash = Convert(VARBINARY(200), @PasswordHash, 1);

END

    -- EXECUTE THE STORED PROCEDURE WITH PARAMETERS
    -- EXEC procValidateUser;
    --select * from AppUser;

--Find fan teams for a specific user
/*GO
create or alter procedure procGetTeamsForSpecifiedFan
(
    @NFLFanID INT
)
AS
BEGIN
    SELECT FT.FanTeamID,FT.PrimaryTeam, CD.CONFERENCE, CD.DIVISION
    from NFLFan F
        inner join FanTeam FT
        on F.NFLFanID = FT.NFLFanID
        --on F.NFLFanID = T.TeamID
        INNER JOIN Team T
        on FT.TeamID = T.TeamID
        inner join ConferenceDivision CD
        on T.ConferenceDivisionID = CD.ConferenceDivisionID
    where F.NFLFanID = @NFLFanID
END;*/
--execute the stored procedure with parameters
--EXEC procGetTeamsForSpecifiedFan @NFLFanID = 1;
--EXEC procGetTeamsForSpecifiedFan @NFLFanID = 2;


GO
CREATE OR ALTER PROCEDURE procGetTeamsForSpecifiedFan
(
    @NFLFanID INT
)
AS
BEGIN
    SELECT FT.PrimaryTeam, T.TeamName
    FROM NFLFan F
        INNER JOIN FanTeam FT 
        ON F.NFLFanID = FT.NFLFanID
        INNER JOIN Team T 
        ON FT.TeamID = T.TeamID
    WHERE F.NFLFanID = @NFLFanID
END;

--execute the stored procedure with parameters
--EXEC procGetTeamsForSpecifiedFan @NFLFanID = 2;

--Create or alter procedure for finding teams by team color
/*GO
CREATE OR ALTER PROCEDURE procGetTeamsByTeamColor
(
    @TeamColor NVARCHAR(50)
)

AS
BEGIN
    SELECT TeamName, TeamColors
    FROM Team
    WHERE TeamColors LIKE '%' + @TeamColor + '%' 
END */
--execute the stored procedure with parameters
--EXEC procGetTeamsByTeamColor @TeamColor = 'Black';

GO
create or alter procedure procScheduleGame
(
    @HomeTeamID INT,
    @AwayTeamID INT,
    @GameRound NVARCHAR(50),
    @GameDate DATE,
    @GameStartTime TIME,
    @StadiumID INT,
    @NFLAdminID INT -- admin who logged in and is scheduling game
)
AS
BEGIN   
    --Store the NFLAdminID in contect for trigger
    declare @context varbinary(128) = cast(@NFLAdminID as varbinary(128));
    SET context_info @context;

    INSERT INTO Game (HomeTeamID, AwayTeamID, GameRound, GameDate, GameStartTime, StadiumID)
    VALUES (@HomeTeamID, @AwayTeamID, @GameRound, @GameDate, @GameStartTime, @StadiumID);
END

-- procEnterScores parameters:
--@GameID INT,
--@HomeTeamScore INT,
--@AwayTeamScore INT,
--@NFLAdminID INT
GO
create or alter procedure procEnterScores
(
    @GameID INT,
    @HomeTeamScore INT,
    @AwayTeamScore INT,
    @NFLAdminID INT,
    @WinningTeamID INT
)
AS
BEGIN
    --Store the NFLAdminID in context for trigger
    declare @context varbinary(128) = cast(@NFLAdminID as varbinary(128));
    SET context_info @context;

    UPDATE Game
    SET HomeTeamScore = @HomeTeamScore, AwayTeamScore = @AwayTeamScore, WinningTeamID = @WinningTeamID
    WHERE GameID = @GameID;
END

/*GameRound: 'Wild Card', HomeTeamID: 22, AwayTeamID: 30, GameDate: '2026-01-10', GameStartTime: '16:30', StadiumID: 22, 
NFLAdminID for scheduling: 5 (Bill Belichick)

EXEC procScheduleGame 
@HomeTeamID = 22,
@AwayTeamID = 30, 
@GameRound = 'Wild Card', 
@GameDate = '2026-01-10',
@GameStartTime = '16:30',
@StadiumID = 22,
@NFLAdminID = 5;


GameRound: 'Wild Card', HomeTeamID: 17, AwayTeamID: 19, GameDate: '2026-01-10', GameStartTime: '20:00', StadiumID: 17,
NFLAdminID for scheduling: 6 (Sean McVay)
EXEC procScheduleGame 
@HomeTeamID = 17,
@AwayTeamID = 19,
@GameRound = 'Wild Card',
@GameDate = '2026-01-10',
@GameStartTime = '20:00',
@StadiumID = 17,
@NFLAdminID = 6;

select * from Game order by GameID desc;
select * from AdminChangesTracker order by AdminChangesTrackerID desc;

*/


GO

--trigger to track changes made by NFLAdmin to the Game table
--1. trigger events: after insert, after update, after delete
--2. Action: insert a record into AdminChangesTracker with NFLAdminID, ChangeType (insert, update, delete), ChangeDate, and GameID

create or alter trigger trgTrackChangesOnSchedulingGame
ON Game
AFTER INSERT
AS
BEGIN
    DECLARE @NFLAdminID INT;
    DECLARE @GameID INT;
    DECLARE @ChangeType NVARCHAR(50);
    DECLARE @ChangeDescription NVARCHAR(500);
    DECLARE @GameRound NVARCHAR(50);
    DECLARE @GameDate DATE;
    DECLARE @GameStartTime TIME;
    DECLARE @HomeTeamID INT;
    DECLARE @AwayTeamID INT;
    DECLARE @HomeTeamName NVARCHAR(50);
    DECLARE @AwayTeamName NVARCHAR(50);
    DECLARE @StadiumID INT;
    DECLARE @StadiumName NVARCHAR(100);
    DECLARE @AdminFullName NVARCHAR(100);
     --get team names for change description

    --get NFLAdminID from context
    SET @NFLAdminID = convert(int, convert(binary(4),context_info()));

    --get GameID from inserted record
    SELECT @GameID = GameID , @GameRound = GameRound, @GameDate = GameDate, @GameStartTime = GameStartTime, 
    @HomeTeamID = HomeTeamID, @AwayTeamID = AwayTeamID, @StadiumID = StadiumID
    FROM inserted;
    SELECT @HomeTeamName = TeamName from Team where TeamID = @HomeTeamID;
    SELECT @AwayTeamName = TeamName from Team where TeamID = @AwayTeamID;
    SELECT @StadiumName = StadiumName from Stadium where StadiumID = @StadiumID;
    SELECT @AdminFullName = Firstname + ' ' + Lastname from AppUser where AppUserID = @NFLAdminID;


    SET @ChangeType = 'Insert';
    SET @ChangeDescription = 'Scheduled a new GameID ' + cast(@GameID as nvarchar(50))
    + ' for ' + @GameRound + ' round between ' + @HomeTeamName + ' and ' + @AwayTeamName
    + ' on ' + cast(@GameDate as nvarchar(50)) + ' at ' + cast(@GameStartTime as nvarchar(50)) + 'in stadium with ID ' + cast(@StadiumID as nvarchar(50)) + '.';
    ;

    insert into AdminChangesTracker (NFLAdminID, GameID, ChangeType, ChangeDescription)
    values (@NFLAdminID, @GameID, @ChangeType, @ChangeDescription);
END





GO
create or alter trigger trgTrackChangesOnEnteringScores
ON Game
after update
as
BEGIN
    DECLARE @NFLAdminID INT;
    DECLARE @GameID INT;
    DECLARE @ChangeType NVARCHAR(50);
    DECLARE @ChangeDescription NVARCHAR(500);
    DECLARE @HomeTeamScore INT;
    DECLARE @AwayTeamScore INT;
    DECLARE @AdminFullName NVARCHAR(100);
    DECLARE @WinningTeamID INT;

    --get NFLAdminID from context
    SET @NFLAdminID = convert(int, convert(binary(4),context_info()));

    --get GameID and updated scores from inserted record
    SELECT @GameID = GameID, @HomeTeamScore = HomeTeamScore, @AwayTeamScore = AwayTeamScore, @WinningTeamID = WinningTeamID
    from inserted;
    --get admin full name
    SELECT @AdminFullName = Firstname + ' ' + Lastname from AppUser where AppUserID = @NFLAdminID;
    --SELECT @WinningTeamID = TeamID from Team where TeamID = @WinningTeamID;

    SET @ChangeType = 'Update';
    SET @ChangeDescription = 'Scores updated by ' + @AdminFullName + ' for GameID ' + 
    cast(@GameID as nvarchar(50)) + ': Home=' + cast(@HomeTeamScore as nvarchar(50)) + ', 
    Away=' + cast(@AwayTeamScore as nvarchar(50)) + ', WinningTeam=' + cast(@WinningTeamID as nvarchar(50)) + '.';

    insert into AdminChangesTracker (NFLAdminID, GameID, ChangeType, ChangeDescription)
    values (@NFLAdminID, @GameID, @ChangeType, @ChangeDescription);
END

GO
create or alter procedure procGetAllChangesMadeBySpecifiedAdmin

(

  @NFLAdminID INT

)

as

begin

  select ACT.ChangeDateTime, ACT.ChangeType, ACT.ChangeDescription,

  G.GameRound, G.GameDate, G.GameStartTime,

  HT.TeamName as HomeTeam, AT.TeamName as AwayTeam, S.StadiumName

  from AdminChangesTracker ACT inner join Game G

    on ACT.GameID = G.GameID

    inner join Team HT

    on G.HomeTeamID = HT.TeamID

    inner join Team AT

    on G.AwayTeamID = AT.TeamID

    inner join Stadium S

    on G.StadiumID = S.StadiumID

  where ACT.NFLAdminID = @NFLAdminID

  order by ACT.ChangeDateTime desc;

end

SELECT NFLAdminID FROM AdminChangesTracker;

-- execute procGetAllChangesMadeBySpecifiedAdmin @NFLAdminID = 5; -- Bill Belichick