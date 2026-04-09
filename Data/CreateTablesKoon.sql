
--Create a database for NFL app

--use master;

--Create database MIST353_NFL_RDB_Koon;

--drop database NFL_RDB_Koon;

--use MIST353_NFL_RDB_Koon;*/
use[mist353-nfl-koon];


--drop database to change naming
--Create tables for the first iteration
if (OBJECT_ID ('FanTeam') IS NOT NULL)
    DROP TABLE FanTeam;
IF (OBJECT_ID ('NFLFan') IS NOT NULL)
    DROP TABLE NFLFan;
IF (OBJECT_ID ('NFLAdmin') IS NOT NULL)
    DROP TABLE NFLAdmin;
if (OBJECT_ID('Team') IS NOT NULL)
    DROP TABLE Team;
if (OBJECT_ID('ConferenceDivision') IS NOT NULL)
    DROP TABLE ConferenceDivision;
if (OBJECT_ID('AppUser') IS NOT NULL)
    DROP TABLE AppUser;

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

