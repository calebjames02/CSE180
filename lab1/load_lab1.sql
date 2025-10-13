-- Sample script file to populate the Airline Schema

-- Passenger(passengerID, passengerName, email, dateOfBirth, frequentFlyer)
COPY Passenger FROM stdin USING DELIMITERS '|';
1|John Doe|jdoe@gmail.com|1980-10-19|G
2|Jane Smith|jsmith@yahoo.com|2000-01-01|S
3|Michael Johnson|mjohnson@outlook.com|2005-01-15|N
4|Emily Davis|edavis@aol.com|1960-02-08|P
5|Robert Brown|rbrown@gmail.com|1994-02-08|S
6|Jessica Wilson|jwilson@hotmail.com|1994-06-23|G
7|William Martinez|wmartinez@yahoo.com|1993-03-09|P
8|Amanda Taylor|ataylor@gmail.com|1987-12-31|N
\.

-- Airport(airportCode, city, country, numRunways, avgDelayMinutes)
COPY Airport FROM stdin USING DELIMITERS '|';
JFK|New York|USA|4|25
LAX|Los Angeles|USA|4|30
ORD|Chicago|USA|6|20
IAH|Houston|USA|5|18
PHX|Phoenix|USA|3|22
SFO|San Francisco|USA|4|28
SEA|Seattle|USA|3|15
BOS|Boston|USA|2|35
\.

-- Flight(flightID, departureAirport, arrivalAirport, scheduledDeparture, scheduledArrival, actualDeparture, actualArrival, aircraftType)
COPY Flight FROM stdin USING DELIMITERS '|';
101|JFK|LAX|2024-10-01 08:00:00|2024-10-01 11:00:00|2024-10-01 08:05:00|2024-10-01 11:10:00|Boeing 737
102|LAX|ORD|2024-10-02 09:00:00|2024-10-02 13:30:00|2024-10-02 09:15:00|2024-10-02 13:40:00|Airbus A320
103|ORD|IAH|2024-10-03 07:30:00|2024-10-03 10:15:00|2024-10-03 07:30:00|2024-10-03 10:20:00|Boeing 777
104|IAH|PHX|2024-10-04 14:00:00|2024-10-04 15:30:00|2024-10-04 14:10:00|2024-10-04 15:45:00|Embraer 175
105|PHX|SFO|2024-10-05 12:00:00|2024-10-05 13:45:00|2024-10-05 12:05:00|2024-10-05 13:50:00|Boeing 737
106|SFO|SEA|2024-10-06 16:00:00|2024-10-06 17:30:00|2024-10-06 16:20:00|2024-10-06 17:40:00|Airbus A321
107|SEA|BOS|2024-10-07 10:00:00|2024-10-07 18:00:00|2024-10-07 10:05:00|2024-10-07 18:20:00|Boeing 787
108|BOS|JFK|2024-10-08 07:00:00|2024-10-08 08:00:00|2024-10-08 07:10:00|2024-10-08 08:15:00|Boeing 737
\.

-- CrewMember(crewID, crewName, crewRole, yearsExperience)
COPY CrewMember FROM stdin USING DELIMITERS '|';
1|Alice Green|Pilot|15
2|Brian Lee|Co-Pilot|10
3|Carla Gomez|Attendant|7
4|David White|Pilot|20
5|Sophia Kim|Attendant|5
6|James Patel|Co-Pilot|12
7|Laura Chen|Attendant|8
8|Tom Harris|Pilot|18
\.

-- Reservation(reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
COPY Reservation FROM stdin USING DELIMITERS '|';
201|1|101|2024-09-15|E|250.00|CreditCard
202|2|102|2024-09-18|B|750.00|PayPal
203|3|103|2024-09-20|E|180.00|CreditCard
204|4|104|2024-09-22|P|1200.00|DebitCard
205|5|105|2024-09-25|E|220.00|CreditCard
206|6|106|2024-09-26|B|680.00|CreditCard
207|7|107|2024-09-28|E|300.00|PayPal
208|8|108|2024-09-30|E|150.00|CreditCard
\.

-- CheckIn(reservationID, passengerID, checkInTime, bagCount, seatNumber)
COPY CheckIn FROM stdin USING DELIMITERS '|';
201|1|2024-10-01 06:30:00|2|12A
202|2|2024-10-02 07:45:00|1|3C
203|3|2024-10-03 05:50:00|0|18F
204|4|2024-10-04 12:30:00|3|1A
205|5|2024-10-05 10:20:00|2|14B
206|6|2024-10-06 14:50:00|1|6D
207|7|2024-10-07 08:15:00|2|20C
208|8|2024-10-08 05:30:00|1|7F
\.

-- FlightCrewAssignment(flightID, crewID, compensation)
COPY FlightCrewAssignment FROM stdin USING DELIMITERS '|';
101|1|1500.00
101|2|1000.00
101|3|500.00
102|4|1600.00
102|6|1100.00
102|5|550.00
103|1|1500.00
103|7|600.00
104|8|1550.00
104|2|1000.00
105|4|1600.00
105|5|550.00
106|1|1500.00
106|6|1100.00
107|8|1550.00
107|3|500.00
108|2|1000.00
108|7|600.00
\.
