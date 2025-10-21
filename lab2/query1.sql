SELECT p.passengerName as thePassengerName, f.departureAirport as theAirportCode, r.ticketPrice as theTicketPrice
FROM Passenger p
	JOIN Reservation r ON p.passengerID = r.passengerID
	JOIN Flight f on r.flightID = f.flightID
	JOIN Airport a ON f.departureAirport = a.airportCode
WHERE p.passengerName LIKE 'R%' AND a.numRunways = 12 AND r.ticketPrice > 40;
