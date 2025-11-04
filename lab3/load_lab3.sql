-- Sample data for Lab3 testing
-- Run this after create_lab3.sql

SET SEARCH_PATH TO Lab3;

-- Insert Passengers
INSERT INTO Passenger (passengerID, passengerName, email, dateOfBirth, frequentFlyer) VALUES
(1, 'Alice Smith', 'alice@email.com', '1990-05-15', 'Y'),
(2, 'Bob Johnson', 'bob@email.com', '1985-08-22', 'N'),
(3, 'Charlie Brown', 'charlie@email.com', '1992-11-30', 'Y'),
(4, 'Diana Prince', 'diana@email.com', '1988-03-10', 'N'),
(5, 'Eve Adams', 'eve@email.com', '1995-07-18', 'Y');

-- Insert Airports
INSERT INTO Airport (airportCode, city, country, numRunways, avgDelayMinutes) VALUES
('LAX', 'Los Angeles', 'USA', 4, 15),
('JFK', 'New York', 'USA', 4, 20),
('SFO', 'San Francisco', 'USA', 3, 12),
('ORD', 'Chicago', 'USA', 7, 18),
('SEA', 'Seattle', 'USA', 3, 10);

-- Insert Flights
INSERT INTO Flight (flightID, departureAirport, arrivalAirport, scheduledDeparture, scheduledArrival, actualDeparture, actualArrival, aircraftType) VALUES
(1, 'LAX', 'JFK', '2025-12-15 08:00:00', '2025-12-15 16:30:00', '2025-12-15 08:15:00', '2025-12-15 16:45:00', 'Boeing 777'),
(2, 'SFO', 'ORD', '2025-12-20 10:00:00', '2025-12-20 16:00:00', '2025-12-20 10:05:00', '2025-12-20 16:10:00', 'Airbus A320'),
(3, 'JFK', 'LAX', '2026-01-10 09:00:00', '2026-01-10 12:30:00', '2026-01-10 09:20:00', '2026-01-10 12:50:00', 'Boeing 737'),
(4, 'SEA', 'SFO', '2025-12-25 14:00:00', '2025-12-25 16:30:00', '2025-12-25 14:10:00', '2025-12-25 16:40:00', 'Airbus A380'),
(5, 'ORD', 'SEA', '2026-02-01 11:00:00', '2026-02-01 13:30:00', '2026-02-01 11:15:00', '2026-02-01 13:45:00', NULL);

-- Insert CrewMembers
INSERT INTO CrewMember (crewID, crewName, crewRole, yearsExperience) VALUES
(1, 'Captain Miller', 'Pilot', 15),
(2, 'First Officer Jones', 'Co-Pilot', 8),
(3, 'Sarah Wilson', 'Flight Attendant', 5),
(4, 'Mike Davis', 'Flight Attendant', 3),
(5, 'Captain Anderson', 'Pilot', 20);

-- Insert Reservations
-- Data designed so that:
-- - Alice (ID 1) has 3 reservations (frequent flyer, solidly in view)
-- - Bob (ID 2) has 2 reservations (barely qualifies for view)
-- - Charlie (ID 3) has 2 reservations (barely qualifies for view) - reservation 5 is his
-- - Diana (ID 4) has 1 reservation (not in view)
-- - Eve (ID 5) has 1 reservation (not in view)
INSERT INTO Reservation (reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod) VALUES
(1, 1, 1, '2025-10-15', 'E', 450.00, 'Credit'),
(2, 1, 2, '2025-11-10', 'E', 320.00, 'Credit'),
(3, 1, 4, '2025-11-30', 'B', 550.00, 'Credit'),
(4, 2, 1, '2025-10-01', 'B', 1200.00, 'Debit'),
(5, 3, 4, '2025-10-25', 'E', 280.00, 'Cash'),
(6, 3, 3, '2025-11-20', 'F', 2500.00, 'Credit'),
(7, 4, 5, '2025-12-01', 'B', 680.00, 'Credit'),
(8, 5, 2, '2025-11-25', 'E', 320.00, 'Debit'),
(9, 2, 3, '2025-12-15', 'E', 380.00, NULL),
-- Testing constraint: NULL ticketPrice with NULL paymentMethod (should be valid)
(10, 5, 5, '2025-12-20', 'E', NULL, NULL);

-- Insert CheckIns
INSERT INTO CheckIn (reservationID, passengerID, checkInTime, bagCount, seatNumber) VALUES
(1, 1, '2025-12-15 06:30:00', 2, '12A'),
(2, 1, '2025-12-20 08:30:00', 1, '24C'),
(3, 1, '2025-12-25 12:30:00', 1, '8B'),
(4, 2, '2025-12-15 06:45:00', 1, '2B');

-- Insert FlightCrewAssignments
INSERT INTO FlightCrewAssignment (flightID, crewID, compensation) VALUES
(1, 1, 500.00),
(1, 2, 350.00),
(1, 3, 200.00),
(2, 5, 450.00),
(2, 4, 180.00),
(3, 1, 500.00),
(3, 3, 200.00);

-- Insert UpdateReservation data for testing combine.sql
INSERT INTO UpdateReservation (reservationID, seatClass, ticketPrice) VALUES
(1, 'B', 750.00),  -- Existing reservation, will be updated
(2, 'F', 2000.00), -- Existing reservation, will be updated
(15, 'E', 350.00), -- New reservation, will be inserted
(16, 'B', 800.00); -- New reservation, will be inserted