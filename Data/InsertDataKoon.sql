--insert data 
--insert all the ConferenceDivison data (8 rows)
--insert team data for AFC North (4 rows)
-- team IDs',conferences and divisions
USE [mist353-nfl-koon];

INSERT INTO ConferenceDivision(Conference,Division)
VALUES ('AFC','East'),
       ('AFC','North'),
       ('AFC','South'),
       ('AFC','West'),
       ('NFC','East'),
       ('NFC','North'),
       ('NFC','South'),
       ('NFC','West');
--SELECT * FROM ConferenceDivision
-- Team information for AFC North
INSERT INTO Team(TeamName,TeamCityState,TeamColors,ConferenceDivisionID,TeamLogo)
VALUES ('Baltimore Ravens','Baltimore, MD','Purple, Black, Metallic Gold',2,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Ravens.png'),
       ('Cincinnati Bengals','Cincinnati, OH','Black, Orange, White',2,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Bengals.png'),
       ('Cleveland Browns','Cleveland, OH','Brown, Orange, White',2,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Browns.png'),
       ('Pittsburgh Steelers','Pittsburgh, PA','Black, Gold, White',2,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Steelers.png'),
       
       ('Buffalo Bills','Buffalo, NY','Royal Blue, Red, White',1,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Bills.png'),
       ('New England Patriots','Foxborough, MA','Navy Blue, Red, Silver',1,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Patriots.png'),
       ('Miami Dolphins','Miami, FL','Aqua, Orange, White',1,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Dolphins.png'),
       ('New York Jets','East Rutherford, NJ','Green, White',1,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Jets.png'),
       
       ('Denver Broncos','Denver, CO','Orange, Navy Blue, White',4,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Broncos.png'),
       ('Kansas City Chiefs','Kansas City, MO','Red, Gold, White',4,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Chiefs.png'),
       ('Las Vegas Raiders','Las Vegas, NV','Silver, Black',4,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Raiders.png'),
       ('Los Angeles Chargers','Los Angeles, CA','Powder Blue, Gold, White',4,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Chargers.png'),
       
       ('Jacksonville Jaguars','Jacksonville, FL','Jaguar Blue, Black, White',3,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Jaguars.png'),
       ('Houston Texans','Houston, TX','Deep Steel Blue, Battle Red, Liberty White',3,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Texans.png'),
       ('Tennessee Titans','Nashville, TN','Titans Navy, Titans Blue, Titans Red',3,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Titans.png'),
       ('Indianapolis Colts','Indianapolis, IN','Colts Blue, White',3,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Colts.png'),
       
       ('Dallas Cowboys','Dallas, TX','Navy Blue, Metallic Silver, White',5,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Cowboys.png'),
       ('New York Giants','East Rutherford, NJ','Royal Blue, Red, White',5,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Giants.png'),
       ('Philadelphia Eagles','Philadelphia, PA','Midnight Green, Silver, Black',5,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Eagles.png'),
       ('Washington Commanders','Landover, MD','Burgundy, Gold',5,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Commanders.png'),
       
       ('Chicago Bears','Chicago, IL','Navy Blue, Orange, White',6,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Bears.png'),
       ('Detroit Lions','Detroit, MI','Honolulu Blue, Silver, White',6,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Lions.png'),
       ('Green Bay Packers','Green Bay, WI','Dark Green, Gold, White',6,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Packers.png'),
       ('Minnesota Vikings','Minneapolis, MN','Purple, Gold, White',6,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Vikings.png'),
       
       ('Atlanta Falcons','Atlanta, GA','Red, Black, White',7,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Falcons.png'),
       ('Carolina Panthers','Charlotte, NC','Panther Blue, Black, Silver',7,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Panthers.png'),
       ('New Orleans Saints','New Orleans, LA','Old Gold, Black, White',7,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Saints.png'),
       ('Tampa Bay Buccaneers','Tampa, FL','Red, Pewter, Black, White',7,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Buccaneers.png'),
       
       ('Arizona Cardinals','Glendale, AZ','Cardinal Red, White, Black',8,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Cardinals.png'),
       ('Los Angeles Rams','Los Angeles, CA','Rams Royal, Solor Gold, White',8,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Rams.png'),
       ('San Francisco 49ers','San Francisco, CA','Scarlet, Gold, White',8,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\49ers.png'),
       ('Seattle Seahawks','Seattle, WA','College Navy, Action Green, Wolf Grey',8,'C:\Users\koonj\MIST 353\MIST353_NFL_Koon\Team Logos\Seahawks.png');
GO
       --SELECT * FROM Team ORDER BY TeamID;

GO
       
insert into AppUser (Firstname, Lastname, Email, Phone, PasswordHash, UserRole)
VALUES
('Tom', 'Brady', 'tom.brady@example.com', '555-1234', 0x01, N'NFLFan'),
('Aaron', 'Rodgers', 'aaron.rodgers@example.com', '555-9012', 0x01, N'NFLFan'),
('Drew', 'Brees', 'drew.brees@example.com', '555-2222', 0x01, N'NFLFan'),
('Patrick', 'Mahomes', 'patrick.mahomes@example.com', '555-7890', 0x01, N'NFLFan'),

('Bill', 'Belichick', 'bill.belichick@example.com', '555-5678', 0x01, N'NFLAdmin'),
('Sean', 'McVay', 'sean.mcay@example.com', '555-3456', 0x01, N'NFLAdmin'),
('Mike', 'Tomlin', 'mike.tomlin@example.com', '555-1111', 0x01, N'NFLAdmin'),
('Andy', 'Reid', 'andy.reid@example.com', '555-3333', 0x01, N'NFLAdmin');

GO

insert into NFLFan (NFLFanID)
VALUES
(1),
(2),
(3),
(4);

GO

insert into NFLAdmin (NFLAdminID)
VALUES
(5),
(6),
(7),
(8);

GO

--select * from Team;

insert into FanTeam (NFLFanID, TeamID, PrimaryTeam)
VALUES
(1, 11, 1),
(1, 24, 0), -- Tom Brady is a fan of New England Patriots and Tampa Bay Buccaneers, but Patriots is his primary team
(2, 19, 1), 
(2, 12, 0),
(2, 4, 0),-- Aaron Rodgers is a fan of Green Bay Packers, New York Jets, and Pittsburgh Steelers, but Packers is his primary team
(3, 3, 1), -- Drew Brees is a fan New Orleans Saints (primary) and Los Angeles Chargers
(3, 16, 0),
(4, 14, 1); -- Patrick Mahomes is a fan of Kansas City Chiefs (primary)

go

INSERT INTO Stadium (StadiumName, StadiumCityState, Capacity) VALUES
('M&T Bank Stadium', 'Baltimore, MD', 71008),
('Paycor Stadium', 'Cincinnati, OH', 65515),
('Huntington Bank Field', 'Cleveland, OH', 67431),
('Acrisure Stadium', 'Pittsburgh, PA', 68400),
('NRG Stadium', 'Houston, TX', 72220),
('Lucas Oil Stadium', 'Indianapolis, IN', 67000),
('EverBank Stadium', 'Jacksonville, FL', 62000),
('Nissan Stadium', 'Nashville, TN', 69143),
('Geodis Park', 'Nashville, TN', 30000), -- Titans temporary while Nissan demolished/rebuilt
('Highmark Stadium', 'Orchard Park, NY', 71608),
('Gillette Stadium', 'Foxborough, MA', 65878),
('MetLife Stadium', 'East Rutherford, NJ', 82500), -- Giants share with Jets
('Empower Field at Mile High', 'Denver, CO', 76125),
('GEHA Field at Arrowhead Stadium', 'Kansas City, MO', 76416),
('Allegiant Stadium', 'Las Vegas, NV', 65000),
('SoFi Stadium', 'Inglewood, CA', 70240), --Rams share with Chargers
('Soldier Field', 'Chicago, IL', 61500),
('Ford Field', 'Detroit, MI', 65000),
('Lambeau Field', 'Green Bay, WI', 81441),
('U.S. Bank Stadium', 'Minneapolis, MN', 66860),
('Mercedes-Benz Stadium', 'Atlanta, GA', 71000),
('Bank of America Stadium', 'Charlotte, NC', 74867),
('Caesars Superdome', 'New Orleans, LA', 73208),
('Raymond James Stadium', 'Tampa, FL', 69218),
('AT&T Stadium', 'Arlington, TX', 80000),
('Lincoln Financial Field', 'Philadelphia, PA', 69796),
('Northwest Stadium', 'Landover, MD', 67617),
('State Farm Stadium', 'Glendale, AZ', 63400),
('Levi''s Stadium', 'Santa Clara, CA', 68500),
('Lumen Field', 'Seattle, WA', 69000),
('Oakland Coliseum', 'Oakland, CA', 56057), -- Raiders immediate past
('Jack Murphy/Qualcomm Stadium', 'San Diego, CA', 70561), -- Chargers immediate past
('Hard Rock Stadium', 'Miami Gardens, FL', 65300);

-- select * from Stadium order by StadiumID;

go

INSERT INTO TeamStadium 
(TeamID, StadiumID, StartYear, EndYear) 
VALUES 
-- Baltimore Ravens
(1, 1, 1998, NULL),
-- Cincinnati Bengals
(2, 2, 2000, NULL),
-- Cleveland Browns
(3, 3, 1999, NULL),
-- Pittsburgh Steelers
(4, 4, 2001, NULL),
-- Houston Texans
(5, 5, 2002, NULL),
-- Indianapolis Colts
(6, 6, 2008, NULL),
-- Jacksonville Jaguars
(7, 7, 1995, NULL),
-- Tennessee Titans (Nissan Stadium, now being replaced)
(8, 8, 1999, 2026),
-- Tennessee Titans (temporary home at Geodis Park while new stadium is built)
(8, 9, 2027, NULL),
-- Buffalo Bills
(9, 10, 2026, NULL),
-- New England Patriots
(11, 11, 2002, NULL),
-- New York Jets (MetLife)
(12, 12, 2010, NULL),
-- Denver Broncos
(13, 13, 2001, NULL),
-- Kansas City Chiefs
(14, 14, 1972, NULL),
-- Las Vegas Raiders (Allegiant)
(15, 15, 2020, NULL),
-- Las Vegas Raiders immediate past (Oakland Coliseum)
(15, 31, 1966, 2019),
-- Los Angeles Chargers (SoFi)
(16, 16, 2020, NULL),
-- Los Angeles Chargers immediate past (Qualcomm/StubHub)
(16, 32, 1967, 2016),
-- Chicago Bears
(17, 17, 1971, NULL),
-- Detroit Lions
(18, 18, 2002, NULL),
-- Green Bay Packers
(19, 19, 1957, NULL),
-- Minnesota Vikings
(20, 20, 2016, NULL),
-- Atlanta Falcons
(21, 21, 2017, NULL),
-- Carolina Panthers
(22, 22, 1996, NULL),
-- New Orleans Saints
(23, 23, 1975, NULL),
-- Tampa Bay Buccaneers
(24, 24, 1998, NULL),
-- Dallas Cowboys
(25, 25, 2009, NULL),
-- New York Giants (MetLife)
(26, 12, 2010, NULL),
-- Philadelphia Eagles
(27, 26, 2003, NULL),
-- Washington Commanders
(28, 27, 1997, NULL),
-- Arizona Cardinals
(29, 28, 2006, NULL),
-- Los Angeles Rams (SoFi)
(30, 16, 2020, NULL),
-- San Francisco 49ers
(31, 29, 2014, NULL),
-- Seattle Seahawks
(32, 30, 2002, NULL),
-- Miami Dolphins
(10, 33, 1987, NULL);

GO

-- select * from AdminChangesTracker
-- select * from Game
-- select N.NFLAdminID, U.Firstname, U.LastName from NFLAdmin N inner join APPUser U on N.NFLAdminID = U.AppUserID
-- select * from Stadium

/*
-- =============================================
-- WILD CARD ROUND  (January 10-12, 2026)
-- =============================================

-- Saturday Jan 10: (5) LA Rams at (4) Carolina Panthers
-- Rams win 34-31
GameRound: 'Wild Card', HomeTeamID: 22, AwayTeamID: 30, GameDate: '2026-01-10', GameStartTime: '16:30', StadiumID: 22, 
NFLAdminID for scheduling: 5 (Bill Belichick)

HomeTeamScore: 31, AwayTeamScore: 34, NFLAdminID for entering score: 6 (Sean McVay)

-- Saturday Jan 10: (7) Green Bay Packers at (2) Chicago Bears
-- Bears win 31-27
GameRound: 'Wild Card', HomeTeamID: 17, AwayTeamID: 19, GameDate: '2026-01-10', GameStartTime: '20:00', StadiumID: 17,
NFLAdminID for scheduling: 6 (Sean McVay)

HomeTeamScore: 31, AwayTeamScore: 27, NFLAdminID for entering score: 7 (Mike Tomlin)

*/