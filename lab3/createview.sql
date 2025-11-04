CREATE VIEW FrequentFlyerView AS
	SELECT p.passengerID, p.passengerName, COUNT(*) AS totalReservations, SUM(r.ticketPrice) AS totalSpent
	FROM Passenger p
		JOIN Reservation r ON p.passengerID = r.passengerID
	GROUP BY p.passengerID, p.passengerName
	HAVING COUNT(*) >= 2
