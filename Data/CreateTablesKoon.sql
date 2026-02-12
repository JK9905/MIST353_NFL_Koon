--Create a database for NFL app

--use master;

--Create database MIST353_NFL_RDB_Koon;

--drop database NFL_RDB_Koon;

use MIST353_NFL_RDB_Koon;

--drop database to change naming
--Create tables for the first iteration



CREATE TABLE ConferenceDivision(
ConferenceDivisionID INT identity(1,1)
constraint PK_ConferenceDivision primary key,
Conference NVARCHAR(50) NOT NULL
constraint CK_ConferenceNames CHECK (Conference in ("AFC", "NFC")),
Divison NVARCHAR(50) NOT NULL
constraint CK_DivisonNames CHECK (Division IN ('East','North','South','West')),
);

Create table Team (
    --starts at 1 and increments by 1
    constraint PK_Team primary key,
TeamID int identity(1,1) not null,
TeamName Nvarchar (50) not null,
TeamCityState Nvarchar(50) not null,
TeamColors NVARCHAR(50) NOT NULL,
ConferenceDivisionID INT NOT NULL
    constraint FK_Team_ConferenceDivison foreign key references ConferenceDivision 
);




