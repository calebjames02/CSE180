UPDATE Reservation r
SET seatClass = u.seatClass,
	ticketPrice = u.ticketPrice,
	paymentMethod = 'Credit Card'
FROM UpdateReservation u
WHERE r.reservationID = u.reservationID;

INSERT INTO Reservation (reservationID, bookingDate, seatClass, ticketPrice, paymentMethod)
SELECT u.reservationID, CURRENT_DATE, u.seatClass, u.ticketPrice, 'Credit Card'
FROM UpdateReservation u
WHERE NOT EXISTS (SELECT 1
					FROM Reservation r
					WHERE r.reservationID = u.reservationID);
