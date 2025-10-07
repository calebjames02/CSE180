CREATE TABLE Passenger(
	passengerID 	INT,
	passengerName 	VARCHAR(40),
	email 			VARCHAR(40),
	dateOfBirth 	DATE,
	frequentFlyer 	CHAR(1),
	PRIMARY KEY (passengerID)
);

CREATE TABLE Airport(
	airportCode CHAR(3),
	city VARCHAR(40),
	country VARCHAR(40),
	numRunways INT,
	avgDelayMinutes INT,
	PRIMARY KEY (airportCode)
);

CREATE TABLE Flight(
	flightID INT,
	departureAirport CHAR(3),
	arrivalAirport CHAR(3),
	scheduledDeparture TIMESTAMP,
	scheduledArrival TIMESTAMP,
	actualDeparture TIMESTAMP,
	actualArrival TIMESTAMP,
	aircraftType VARCHAR(40),
	PRIMARY KEY (flightID),
	FOREIGN KEY (departureAirport) REFERENCES Airport (airportCode),
	FOREIGN KEY (arrivalAirport) REFERENCES Airport (airportCode)
);

CREATE TABLE CrewMember(
	crewID INT,
	crewName VARCHAR(40),
	crewRole VARCHAR(40),
	yearsExperience INT,
	PRIMARY KEY (crewID)
);

CREATE TABLE Reservation(
	reservationID INT,
	passengerID INT,
	flightID INT,
	bookingDate DATE,
	seatClass CHAR(1),
	ticketPrice NUMERIC(9, 2), -- Check if this is correct
	paymentMethod VARCHAR (40),
	PRIMARY KEY (reservationID),
	FOREIGN KEY (passengerID) REFERENCES Passenger (passengerID),
	FOREIGN KEY (flightID) REFERENCES Flight (flightID)
);

CREATE TABLE CheckIn(
	reservationID INT,
	passengerID INT,
	checkInTime TIMESTAMP,
	bagCount INT,
	seatNumber VARCHAR(40),
	PRIMARY KEY (reservationID, passengerID),
	FOREIGN KEY (reservationID) REFERENCES Reservation (reservationID),
	FOREIGN KEY (PassengerID) REFERENCES Passenger (PassengerID)
);

CREATE TABLE FlightCrewAssignment(
	flightID INT,
	crewID INT,
	compensation NUMERIC(9, 2),
	PRIMARY KEY (flightID, crewID),
	FOREIGN KEY (flightID) REFERENCES Flight (flightID),
	FOREIGN KEY (crewID) REFERENCES CrewMember (crewID)
);
