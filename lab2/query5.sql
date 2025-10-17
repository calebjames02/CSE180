SELECT f1.flightID as theFlightID, f.crewID as theCrewID
FROM Flight fl
	JOIN FlightCrewAssignment f ON fl.crewID = f.crewID
WHERE DATE_TRUNC('day', f1.actualDeparture) = (
	SELECT MIN(DATE_TRUNC('day', t.actualDeparture))
	FROM Flight t
)
