DROP DATABASE IF EXISTS formula1;
CREATE DATABASE formula1;
USE formula1;

CREATE TABLE circuits (
	-- circuitId,circuitRef,name,location,country,lat,lng,alt,url
    circuitId INT,
    circuitRef VARCHAR(150), -- reference name, we don't really need to use this
    `name` VARCHAR(150), -- name of the track
    location VARCHAR(150), -- name of the city
    country VARCHAR(150), -- name of the country
    lat DECIMAL(10, 7),
    lng DECIMAL(10, 7),
    alt INT,
    PRIMARY KEY (circuitId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/circuits.csv'
INTO TABLE circuits
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(circuitId,circuitRef,name,location,country,lat,lng,alt,@url);

CREATE TABLE constructors (
	-- constructorId,constructorRef,name,nationality,url
    constructorId INT,
    constructorRef VARCHAR(150),
    `name` VARCHAR(150),
    nationality VARCHAR(150),
    PRIMARY KEY (constructorId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/constructors.csv'
INTO TABLE constructors
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(constructorId,constructorRef,name,nationality,@url);

CREATE TABLE races (
	-- raceId,year,round,circuitId,name,date,time,url,fp1_date,fp1_time,fp2_date,fp2_time,fp3_date,
    -- fp3_time,quali_date,quali_time,sprint_date,sprint_time
    raceId INT,
    `year` INT,
    round INT,
    circuitId INT,
    `name` VARCHAR(150),
    `date` DATE,
    PRIMARY KEY (raceId),
    FOREIGN KEY (circuitId) REFERENCES circuits(circuitId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/races.csv'
INTO TABLE races
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(raceId,`year`,round,circuitId,`name`,`date`,@`time`,@url,@fp1_date,@fp1_time,@fp2_date,@fp2_time,@fp3_date,@fp3_time,@quali_date,@quali_time,@sprint_date,@sprint_time);

CREATE TABLE constructorResults (
	-- constructorResultsId,raceId,constructorId,points
    constructorResultsId INT,
    raceId INT,
    constructorId INT,
    points INT,
    PRIMARY KEY (constructorResultsId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/constructor_results.csv'
INTO TABLE constructorResults
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(constructorResultsId,raceId,constructorId,points,@`status`);

CREATE TABLE drivers (
	-- driverId,driverRef,number,code,forename,surname,dob,nationality,url
    driverId INT,
    driverRef VARCHAR(150),
    `number` INT,
    `code` CHAR(3),
    forename VARCHAR(150),
    surname VARCHAR(150),
    dob DATE,
    nationality VARCHAR(150),
    url VARCHAR(150),
    PRIMARY KEY (driverId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/drivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE `status` (
	-- statusId,status
    statusId INT,
    `status` VARCHAR(150),
    PRIMARY KEY (statusId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/status.csv'
INTO TABLE `status`
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE qualifying (
	-- qualifyId,raceId,driverId,constructorId,number,position,q1,q2,q3
    qualifyId INT,
    raceId INT, 
    driverId INT, 
    constructorId INT, 
    `number` INT, 
    position INT, 
    q1 TIME, 
    q2 TIME, 
    q3 TIME,
    PRIMARY KEY (qualifyId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/qualifying.csv'
INTO TABLE qualifying
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE constructorStandings (
	-- constructorStandingsId,raceId,constructorId,points,position,positionText,wins
    constructorStandingsId INT, 
    raceId INT, 
    constructorId INT, 
    points INT, 
    position INT, 
    positionText VARCHAR(10), 
    wins INT,
    PRIMARY KEY (constructorStandingsId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/constructor_standings.csv'
INTO TABLE constructorStandings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE driverStandings (
	-- driverStandingsId,raceId,driverId,points,position,positionText,wins
    driverStandingsId INT, 
    raceId INT, 
    driverId INT, 
    points INT, 
    position INT, 
    positionText VARCHAR(10), 
    wins INT,
    PRIMARY KEY (driverStandingsId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/driver_standings.csv'
INTO TABLE driverStandings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE lapTimes (
	-- raceId,driverId,lap,position,time,milliseconds
    raceId INT, 
    driverId INT, 
    lap INT, 
    position INT, 
    `time` TIME, 
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, lap),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
	FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/lap_times.csv'
INTO TABLE lapTimes
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE pitStops (
	-- raceId,driverId,stop,lap,time,duration,milliseconds
    raceId INT, 
    driverId INT, 
    `stop` INT, 
    lap INT, 
    `time` TIME, 
    duration TIME, 
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, `stop`),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
	FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pit_stops.csv'
INTO TABLE pitStops
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE sprintResults (
	-- resultId,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,
    -- points,laps,time,milliseconds,fastestLap,fastestLapTime,statusId
    resultId INT, 
    raceId INT, 
    driverId INT, 
    constructorId INT, 
    `number` INT, 
    grid INT, 
    position INT, 
    positionText VARCHAR(10), 
    positionOrder INT, 
    points INT, 
    laps INT, 
    `time` VARCHAR(150), 
    milliseconds INT, 
    fastestLap INT, 
    fastestLapTime TIME, 
    statusId INT,
	PRIMARY KEY (resultId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (statusId) REFERENCES `status`(statusId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sprint_results.csv'
INTO TABLE sprintResults
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE results (
	-- resultId,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,
    -- laps,time,milliseconds,fastestLap,rank,fastestLapTime,fastestLapSpeed,statusId
    resultId INT, 
    raceId INT, 
    driverId INT, 
    constructorId INT, 
    `number` INT, 
    grid INT, 
    position INT, 
    positionText VARCHAR(10), 
    positionOrder INT, 
    points INT, 
    laps INT, 
    `time` VARCHAR(150), 
    milliseconds INT, 
    fastestLap INT,
    `rank` INT,
    fastestLapTime TIME,
    fastestLapSpeed VARCHAR(150),
    statusId INT,
	PRIMARY KEY (resultId),
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (statusId) REFERENCES `status`(statusId)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/results.csv'
INTO TABLE results
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;