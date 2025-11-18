ALTER TABLE Airport ADD CONSTRAINT airportRunwaysPositive
	CHECK (numRunways > 0);

ALTER TABLE Flight ADD CONSTRAINT validAircraftType
	CHECK (aircraftType IN ('Boeing 737', 'Airbus A320', 'Boeing 777', 'Airbus A380'));
--	Don't need to check aircraft type being null, since if it is null the statement evaluates to unknown which results in it still passing the test

ALTER TABLE Reservation ADD CONSTRAINT ifNullPriceThenNullMethod
	CHECK (ticketPrice IS NOT NULL OR (ticketPrice IS NULL and paymentMethod IS NULL));
