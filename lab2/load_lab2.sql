-- Sample script file to populate the Airline (Lab2) Schema
-- Assumes tables exist in Lab2 with the exact Lab1 attribute order:
-- Passenger(passengerID, passengerName, email, dateOfBirth, frequentFlyer)
-- Airport(airportCode, city, country, numRunways, avgDelayMinutes)
-- Flight(flightID, departureAirport, arrivalAirport, scheduledDeparture, scheduledArrival, actualDeparture, actualArrival, aircraftType)
-- CrewMember(crewID, crewName, role, yearsExperience)
-- Reservation(reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
-- CheckIn(reservationID, passengerID, checkInTime, bagCount, seatNumber)
-- FlightCrewAssignment(flightID, crewID, compensation)

-- Passenger(passengerID, passengerName, email, dateOfBirth, frequentFlyer)
COPY Passenger FROM stdin USING DELIMITERS '|';
1|Robert Reed|robert.reed@example.com|1985-04-12|Y
2|Jane Smith|jane.smith@example.com|1999-01-01|N
3|Michael Johnson|michael.j@example.com|2003-03-15|Y
4|Emily Davis|emily.davis@example.com|1990-07-22|N
5|Ryan Chen|ryan.chen@example.com|1985-04-12|Y
6|Amanda Taylor|amanda.t@example.com|1987-12-31|N
7|William Martinez|will.m@example.com|1993-03-09|Y
8|Zoe McKay|zoe.mckay@example.com|2001-06-23|N
\.

-- Airport(airportCode, city, country, numRunways, avgDelayMinutes)
COPY Airport FROM stdin USING DELIMITERS '|';
DEN|Denver|USA|12|15
SFO|San Francisco|USA|4|12
JFK|New York|USA|4|20
RNO|Reno|USA|3|10
CDG|Paris|France|4|18
\.

-- Flight(flightID, departureAirport, arrivalAirport, scheduledDeparture, scheduledArrival, actualDeparture, actualArrival, aircraftType)
COPY Flight FROM stdin USING DELIMITERS '|';
101|DEN|SFO|2024-02-01 09:00:00|2024-02-01 11:00:00|2024-02-01 09:10:00|2024-02-01 11:20:00|A320
102|DEN|JFK|2024-02-02 08:00:00|2024-02-02 14:00:00|2024-02-02 07:55:00|2024-02-02 13:45:00|A320
103|SFO|JFK|2024-03-01 10:00:00|2024-03-01 18:20:00|2024-03-01 10:05:00|2024-03-01 18:15:00|B737
104|RNO|DEN|2024-01-05 06:30:00|2024-01-05 08:00:00|2024-01-05 06:00:00|2024-01-05 07:45:00|E175
105|DEN|CDG|2024-04-10 16:20:00|2024-04-11 10:10:00|2024-04-10 16:40:00|2024-04-11 10:35:00|A350
\.

-- CrewMember(crewID, crewName, role, yearsExperience)
COPY CrewMember FROM stdin USING DELIMITERS '|';
201|Alice Morgan|Pilot|12
202|Bob Nguyen|Attendant|5
203|Charlie Ortiz|Pilot|20
204|Sophia Kim|Attendant|7
\.

-- Reservation(reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
-- paymentMethod is CHAR(1); use 'V' (Visa), 'M', 'A', 'D', or \N for NULL
COPY Reservation FROM stdin USING DELIMITERS '|';
301|1|101|2024-01-20|E|55.00|V
302|2|103|2024-02-20|E|25.75|M
303|3|101|2024-02-01|B|110.99|A
304|4|104|2024-01-12|F|60.00|\N
305|5|102|2024-02-02|E|90.00|V
306|5|103|2024-02-25|E|80.00|M
307|6|105|2024-03-15|E|180.00|V
308|1|104|2024-01-13|F|45.00|\N
309|1|104|2024-01-13|F|45.00|\N
\.

-- CheckIn(reservationID, passengerID, checkInTime, bagCount, seatNumber)
COPY CheckIn FROM stdin USING DELIMITERS '|';
304|4|2024-01-15 07:20:00|2|12A
308|1|2024-01-14 05:50:00|3|14C
301|1|2024-02-01 07:40:00|1|22D
305|5|2024-02-02 06:30:00|1|18B
309|5|2024-01-14 05:50:00|5|18B
\.

-- FlightCrewAssignment(flightID, crewID, compensation)
COPY FlightCrewAssignment FROM stdin USING DELIMITERS '|';
101|201|1200.00
102|201|1150.00
103|202|900.00
105|202|950.00
104|203|1100.00
104|201|800.00
101|204|700.00
102|204|700.00
\.
