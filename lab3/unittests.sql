-- For each of the 3 foreign key constraints specified in section 2.4, write one unit test:
-- An INSERT command that violates the foreign key constraint (and elicits an error). You must violate
--	that specific foreign key constraint, not any other constraint
INSERT INTO Reservation VALUES (11, 6, 1, '2025-11-14', 'E', 300.00, 'Credit');
INSERT INTO Reservation VALUES (12, 5, 6, '2025-11-14', 'E', 300.00, 'Credit');
INSERT INTO CheckIn VALUES (13, 1, '2025-11-14 12:00:00', 1, '12B');

-- Also, for each of the 3 general constraints, write 2 unit tests. This means that you will write 2 tests for the first
-- general constraint, followed by 2 tests for the second general constraint, followed by 2 tests for the third general
-- constraint.
--	 An UPDATE command that meets the constraint.
--	 An UPDATE command that violates the constraint (and elicits an error).
UPDATE Airport SET numRunways = 4 WHERE airportCode = 'LAX';
UPDATE Airport SET numRunways = 0 WHERE airportCode = 'LAX';

--INSERT INTO Airport VALUES ('FAT', 'Fresno', 'USA', 2, 10);
--INSERT INTO Airport VALUES ('YXE', 'Saskatoon', 'CAN', 0, 15);

UPDATE Flight SET aircraftType = 'Boeing 737' WHERE departureAirport = 'JFK';
UPDATE Flight SET aircraftType = 'Airbus A321' WHERE departureAirport = 'JFK';

--INSERT INTO Flight VALUES (6, 'LAX', 'SFO', '2025-12-15 08:00:00', '2025-12-15 16:30:00', '2025-12-15 08:15:00', '2025-12-15 16:45:00', 'Boeing 777');
--INSERT INTO Flight VALUES (7, 'SFO', 'LAX', '2025-12-15 08:00:00', '2025-12-15 16:30:00', '2025-12-15 08:15:00', '2025-12-15 16:45:00', 'Airbus A321');

UPDATE Reservation SET paymentMethod = 'Cash' WHERE reservationID = 5;
UPDATE Reservation SET paymentMethod = 'Cash' WHERE reservationID = 10;

--INSERT INTO Reservation VALUES (14, 1, 1, '2025-11-14', 'E', 200.00, 'Debit');
--INSERT INTO Reservation (reservationID, passengerID, flightID, bookingDate, seatClass, paymentMethod) VALUES (14, 1, 1, '2025-11-14', 'E', 'Debit');
