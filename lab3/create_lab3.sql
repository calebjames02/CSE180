DROP SCHEMA Lab3 CASCADE;
CREATE SCHEMA Lab3;

-- Create tables in  schema
CREATE TABLE Passenger(
  passengerID INTEGER PRIMARY KEY,
  passengerName VARCHAR(40) NOT NULL,
  email VARCHAR(40),
  dateOfBirth DATE,
  frequentFlyer CHAR(1)
);

CREATE TABLE Airport(
  airportCode CHAR(3) PRIMARY KEY,
  city VARCHAR(40) NOT NULL,
  country VARCHAR(40),
  numRunways INTEGER,
  avgDelayMinutes INTEGER
);

CREATE TABLE Flight(
  flightID INTEGER PRIMARY KEY,
  departureAirport CHAR(3) REFERENCES Airport(airportCode),
  arrivalAirport CHAR(3) REFERENCES Airport(airportCode),
  scheduledDeparture TIMESTAMP,
  scheduledArrival TIMESTAMP,
  actualDeparture TIMESTAMP NOT NULL,
  actualArrival TIMESTAMP NOT NULL,
  aircraftType VARCHAR(40)
);

CREATE TABLE CrewMember(
  crewID INTEGER PRIMARY KEY,
  crewName VARCHAR(40) NOT NULL,
  crewRole VARCHAR(40),
  yearsExperience INTEGER
);

-- Note: Foreign key constraints on Reservation are intentionally omitted
-- Students will add them in Section 2.3
CREATE TABLE Reservation(
  reservationID INTEGER PRIMARY KEY,
  passengerID INTEGER,
  flightID INTEGER,
  bookingDate DATE,
  seatClass CHAR(1),
  ticketPrice NUMERIC(9, 2),
  paymentMethod VARCHAR(40)
);

-- Note: Foreign key constraints on CheckIn are intentionally omitted
-- Students will add them in Section 2.3
CREATE TABLE CheckIn(
  reservationID INTEGER,
  passengerID INTEGER,
  checkInTime TIMESTAMP,
  bagCount INTEGER,
  seatNumber VARCHAR(40),
  PRIMARY KEY (reservationID, passengerID)
);

CREATE TABLE FlightCrewAssignment(
  flightID INTEGER REFERENCES Flight(flightID),
  crewID INTEGER REFERENCES CrewMember(crewID),
  compensation NUMERIC(9, 2),
  PRIMARY KEY (flightID, crewID)
);

-- New table for : UpdateReservation
-- This table contains updates to be merged into Reservation table
CREATE TABLE UpdateReservation(
  reservationID INTEGER PRIMARY KEY,
  seatClass CHAR(1),
  ticketPrice NUMERIC(9, 2)
);
