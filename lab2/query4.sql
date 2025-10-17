SELECT DISTINCT f.flightID AS theFlightID, c.checkInTime AS theCheckInTime
FROM CheckIn c
	JOIN Reservation r ON c.reservationID = r.reservationID
	JOIN Flight f ON r.flightID = f.flightID
	JOIN Airport a ON f.departureAirport = a.airportCode
WHERE r.seatClass = 'F' AND DATE_TRUNC('day', c.checkInTime) >= '2024-01-12' AND a.city LIKE '%en%' AND c.bagCount >= 2 AND r.paymentMethod IS NULL
