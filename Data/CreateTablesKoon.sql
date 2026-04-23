
--Create a database for NFL app

--use master;

--Create database MIST353_NFL_RDB_Koon;

--drop database NFL_RDB_Koon;

--use MIST353_NFL_RDB_Koon;*/
use[mist353-nfl-koon];

if(OBJECT_ID('AdminChangesTracker') is not null)
    drop table AdminChangesTracker;
if(OBJECT_ID('TeamStadium') is not null)
    drop table TeamStadium;
if(OBJECT_ID('Game') is not null)
    drop table Game;
if(OBJECT_ID('Stadium') is not null)
    drop table Stadium;
if(OBJECT_ID('FanTeam') is not null)
    drop table FanTeam;
if(OBJECT_ID('Team') is not null)
    drop table Team;
if(OBJECT_ID('ConferenceDivision') is not null)
    drop table ConferenceDivision;
if(OBJECT_ID('NFLAdmin') is not null)
    drop table NFLAdmin;
if(OBJECT_ID('NFLFan') is not null)
    drop table NFLFan;
if(OBJECT_ID('AppUser') is not null)
    drop table AppUser;

go
CREATE TABLE ConferenceDivision(
ConferenceDivisionID INT identity(1,1)
constraint PK_ConferenceDivision primary key,
Conference NVARCHAR(50) NOT NULL
constraint CK_ConferenceNames CHECK (Conference in ('AFC', 'NFC')),
Division NVARCHAR(50) NOT NULL
constraint CK_DivisionNames CHECK (Division IN ('East','North','South','West')),
CONSTRAINT UQ_ConferenceDivision UNIQUE (Conference,Division)
);

--alter table ConferenceDivison
    --ADD CONSTRAINT UQ_ConferenceDivision UNIQUE (Conference,Division);

--alter table ConferenceDivision
    --NOCHECK CONSTRAINT CK_ConferenceNames;

----alter table ConferenceDivision
    --CHECK CONSTRAINT CK_ConferenceNames;

Create table Team (
    --starts at 1 and increments by 1
TeamID int identity(1,1) not null 
constraint PK_Team primary key,
TeamName Nvarchar (50) not null,
TeamCityState Nvarchar(50) not null,
TeamColors NVARCHAR(100) NOT NULL,
ConferenceDivisionID INT NOT NULL
    constraint FK_Team_ConferenceDivison foreign key references ConferenceDivision (ConferenceDivisionID),
TeamLogo NVARCHAR(100)

);
GO
-- create tables for second iteration

create table AppUser(
    AppUserID int identity(1,1) not null
        constraint PK_AppUser primary key,
    Firstname NVARCHAR(50) NOT NULL,
    Lastname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
        constraint UK_AppUserEmail UNIQUE (Email),
    PasswordHash VARBINARY(200 ) NOT NULL,
    Phone NVARCHAR(20) NULL,
    UserRole NVARCHAR(50) NOT NULL
        constraint CK_AppUserRole CHECK (UserRole IN (N'NFLAdmin', N'NFLFan'))
);
GO

create table NFLFan(
    NFLFanID int 
        constraint PK_NFLFan primary key
        constraint FK_NFLFan_AppUser foreign key references AppUser(AppUserID)
);
GO
create table NFLAdmin(
    NFLAdminID int 
        constraint PK_NFLAdmin primary key
        constraint FK_NFLAdmin_AppUser foreign key references AppUser(AppUserID)
);

GO

create table FanTeam(
    FanTeamID int identity(1,1) not null
        constraint PK_FanTeam primary key,
    NFLFanID int not null
        constraint FK_FanTeam_NFLFan foreign key references NFLFan(NFLFanID),
    TeamID int not null
        constraint FK_FanTeam_Team foreign key references Team(TeamID),
        constraint UQ_FanTeam UNIQUE (NFLFanID, TeamID),
    PrimaryTeam BIT NOT NULL
);


GO

create table Stadium(
    StadiumID int identity(1,1)
        constraint PK_Stadium primary key,
    StadiumName NVARCHAR(100) NOT NULL,
    StadiumCityState NVARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);

GO

create table TeamStadium(
    TeamStadiumID int identity(1,1)
        constraint PK_TeamStadium primary key,
    TeamID int not null
        constraint FK_TeamStadium_Team foreign key references Team(TeamID),
    StadiumID int not null
        constraint FK_TeamStadium_Stadium foreign key references Stadium(StadiumID),
    StartYear INT NOT NULL,
    EndYear INT NULL,
    constraint UK_TeamStadium UNIQUE (TeamID, StadiumID, StartYear)
);

GO

create table Game(
    GameID INT identity(1,1)
        constraint PK_Game primary key,
    GameRound NVARCHAR(50) NOT NULL,
       constraint CK_GameRound CHECK (GameRound IN ('Wild Card', 'Divisional', 'Conference', 'Super Bowl')),
    GameDate DATE NOT NULL,
    GameStartTime TIME NOT NULL,
    HomeTeamID INT NOT NULL
        constraint FK_Game_HomeTeam foreign key references Team(TeamID),
    AwayTeamID INT NOT NULL
        constraint FK_Game_AwayTeam foreign key references Team(TeamID),
    StadiumID INT NOT NULL
        constraint FK_Game_Stadium foreign key references Stadium(StadiumID),
    HomeTeamScore INT NULL,
    AwayTeamScore INT NULL,
    WinningTeamID INT NULL
        constraint FK_Game_WinningTeam foreign key references Team(TeamID),
    constraint CK_Game_Teams CHECK (HomeTeamID != AwayTeamID),
    constraint UK_Game UNIQUE (HomeTeamID, AwayTeamID, GameDate)
);

GO

create table AdminChangesTracker (
    AdminChangesTrackerID INT identity(1,1)
        constraint PK_AdminChangesTracker primary key,
    NFLAdminID INT NOT NULL
        constraint FK_AdminChangesTracker_NFLAdmin foreign key references NFLAdmin(NFLAdminID),
    GameID INT NOT NULL
        constraint FK_AdminChangesTracker_Game foreign key references Game(GameID),
    ChangeDateTime DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeType NVARCHAR(50) NOT NULL
        constraint CK_AdminChangesTracker_ChangeType CHECK (ChangeType IN (N'Insert', N'Update', N'Delete')),
    ChangeDescription NVARCHAR(500) NOT NULL
);
