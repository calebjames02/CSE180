SELECT
FROM FlightCrewAssignment f1
	JOIN FlightCrewAssignment f2 ON f1.crewID = f2.crewID AND f1.flightID <> f2.flightID
	JOIN Flight fl1 on f1.flightID = fl1.flightID
	JOIN Flight fl2 on f2.flightID = fl2.flightID
WHERE 
