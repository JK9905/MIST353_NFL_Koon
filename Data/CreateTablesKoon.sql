-- Step 1: Create a login at the server level

use master;

CREATE LOGIN NandaSurendra

WITH PASSWORD = 'MI$T353Instructor';



-- Step 2: Switch to your target database

USE MIST353_NFL_RDB_Koon;



-- Step 3: Create a database user mapped to the login

CREATE USER NandaSurendra

FOR LOGIN NandaSurendra;



-- Step 4: Grant EXECUTE permission on all stored procedures and UDFs

GRANT EXECUTE TO NandaSurendra;



-- Read access to all tables

GRANT SELECT TO NandaSurendra;


--Create a database for NFL app

--use master;

--Create database MIST353_NFL_RDB_Koon;

--drop database NFL_RDB_Koon;

--use MIST353_NFL_RDB_Koon;
use[mist353-nfl-koon];


--drop database to change naming
--Create tables for the first iteration
if (OBJECT_ID('Team') IS NOT NULL)
    DROP TABLE Team;
if (OBJECT_ID('ConferenceDivision') IS NOT NULL)
    DROP TABLE ConferenceDivision;
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




