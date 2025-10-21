SELECT DISTINCT f1.crewID AS theCrewID
FROM FlightCrewAssignment f1
	JOIN FlightCrewAssignment f2 ON f1.crewID = f2.crewID AND f1.flightID <> f2.flightID
	JOIN Flight fl1 ON f1.flightID = fl1.flightID
	JOIN Flight fl2 ON f2.flightID = fl2.flightID
	JOIN CrewMember m1 ON m1.crewID = f1.crewID AND m1.crewName <> 'Sophia Kim'
	JOIN CrewMember m2 ON m2.crewID = f1.crewID
WHERE fl1.aircraftType = fl2.aircraftType
