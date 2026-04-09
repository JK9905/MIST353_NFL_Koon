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