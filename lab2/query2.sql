SELECT [DISTINCT] p.passengerID AS thePassengerID, p.dateOfBirth AS theDateOfBirth
FROM Passenger p
	JOIN Reservation r ON p.passengerID = r.passengerID
WHERE r.paymentMethod = 'V' AND 100 > (
	SELECT MAX(r2.ticketPrice)
	FROM Reservation r2
	WHERE r2.passengerID = p.passengerID
)

-- This current method isn't the most efficient
-- It checks the same passenger ID multiple times if they made multiple reservations with a VISA
-- Try to update this

--SELECT p.passengerID AS thePassengerID, p.dateOfBirth AS theDateOfBirth
--FROM Passenger p
--	JOIN Reservation r ON p.passengerID = r.passengerID
--WHERE r.paymentMethod = 'V'
--GROUP BY p.passengerID, p.dateOfBirth
--HAVING MAX(r.ticketPrice) < 100
--ORDER BY p.dateOfBirth DESC, p.passengerID
