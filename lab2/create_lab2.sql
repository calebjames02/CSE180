DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE Passenger(
	passengerID INT PRIMARY KEY,
	passengerName VARCHAR(40) NOT NULL,
	email VARCHAR(40),
	dateOfBirth DATE,
	frequentFlyer CHAR(1),
	UNIQUE(passengerName, email)
);

CREATE TABLE Airport(
	airportCode CHAR(3) PRIMARY KEY,
	city VARCHAR(40) NOT NULL,
	country VARCHAR(40),
	numRunways INT,
	avgDelayMinutes INT,
	UNIQUE(city, country)
);

CREATE TABLE Flight(
	flightID INT PRIMARY KEY,
	departureAirport CHAR(3) REFERENCES Airport (airportCode),
	arrivalAirport CHAR(3) REFERENCES Airport (airportCode),
	scheduledDeparture TIMESTAMP,
	scheduledArrival TIMESTAMP,
	actualDeparture TIMESTAMP NOT NULL,
	actualArrival TIMESTAMP NOT NULL,
	aircraftType VARCHAR(40)
);

CREATE TABLE CrewMember(
	crewID INT PRIMARY KEY,
	crewName VARCHAR(40) NOT NULL,
	crewRole VARCHAR(40),
	yearsExperience INT,
	UNIQUE(crewName)
);

CREATE TABLE Reservation(
	reservationID INT PRIMARY KEY,
	passengerID INT REFERENCES Passenger,
	flightID INT REFERENCES Flight,
	bookingDate DATE,
	seatClass CHAR(1),
	ticketPrice NUMERIC(9, 2),
	paymentMethod VARCHAR (40),
	UNIQUE(bookingDate, paymentMethod, passengerID)
);

CREATE TABLE CheckIn(
	reservationID INT REFERENCES Reservation,
	passengerID INT REFERENCES Passenger,
	checkInTime TIMESTAMP,
	bagCount INT,
	seatNumber VARCHAR(40),
	PRIMARY KEY (reservationID, passengerID)
);

CREATE TABLE FlightCrewAssignment(
	flightID INT REFERENCES Flight,
	crewID INT REFERENCES CrewMember,
	compensation NUMERIC(9, 2),
	PRIMARY KEY (flightID, crewID)
);
