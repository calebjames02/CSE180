SELECT fl.flightID as theFlightID, f.crewID as theCrewID
FROM Flight fl
	JOIN FlightCrewAssignment f ON fl.flightID = f.flightID
WHERE DATE_TRUNC('day', fl.actualDeparture) = (
	SELECT MIN(DATE_TRUNC('day', t.actualDeparture))
	FROM Flight t
)
