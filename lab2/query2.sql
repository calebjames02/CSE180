SELECT p.passengerID AS thePassengerID, p.dateOfBirth AS theDateOfBirth
FROM Passenger p
	JOIN Reservation r ON p.passengerID = r.passengerID
WHERE r.paymentMethod = 'V'
GROUP BY p.passengerID, p.dateOfBirth
HAVING MAX(r.ticketPrice) < 100
ORDER BY p.dateOfBirth DESC, p.passengerID
