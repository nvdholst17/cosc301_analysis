SELECT 
    c.circuitId,
    con.constructorId,
    con.name,
    AVG(lt.milliseconds) AS avg_lap
FROM lapTimes lt
JOIN races r          ON lt.raceId = r.raceId
JOIN circuits c       ON r.circuitId = c.circuitId
JOIN results res      ON res.raceId = r.raceId AND res.driverId = lt.driverId
JOIN constructors con ON con.constructorId = res.constructorId
GROUP BY c.circuitId, con.constructorId,con.name
ORDER BY con.constructorId;

SELECT 
    c.circuitId,
    AVG(lt.milliseconds) AS avg_lap
FROM lapTimes lt
JOIN races r          ON lt.raceId = r.raceId
JOIN circuits c       ON r.circuitId = c.circuitId
JOIN results res      ON res.raceId = r.raceId AND res.driverId = lt.driverId
JOIN constructors con ON con.constructorId = res.constructorId
GROUP BY c.circuitId
ORDER BY c.circuitId;

SELECT 
    con.constructorId,
    AVG(lt.milliseconds) AS avg_lap
FROM lapTimes lt
JOIN races r          ON lt.raceId = r.raceId
JOIN circuits c       ON r.circuitId = c.circuitId
JOIN results res      ON res.raceId = r.raceId AND res.driverId = lt.driverId
JOIN constructors con ON con.constructorId = res.constructorId
GROUP BY con.constructorId
ORDER BY con.constructorId;

SELECT 
	con.constructorId, 
    con.name, 
    c.circuitId, 
    c.name
FROM lapTimes lt
JOIN races r          ON lt.raceId = r.raceId
JOIN circuits c       ON r.circuitId = c.circuitId
JOIN results res      ON res.raceId = r.raceId AND res.driverId = lt.driverId
JOIN constructors con ON con.constructorId = res.constructorId;

SELECT COUNT(DISTINCT constructorId)
FROM constructors;





