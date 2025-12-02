#! /usr/bin/env python

#  runAirlineApplication Solution
from datetime import datetime
import psycopg2, sys

# The three Python functions for Lab4 should appear below.
# Write those functions, as described in Lab4 Section 5 (and Section 6,
# which describes the Stored Function used by the third Python function).
#
# Write the tests of those function in main, as described in Section 7
# of Lab4.


 # countNumberOfDepartingPassengers (myConn, departureAirport):
 # The airline needs to know how many unique customers have departed from a given airport.
 # The Reservation table tells us about reservations made by a passenger(passengerID) for a given flight(flightID), while the Flight table tells us about the flights(flightID) that departed from a given airport(departureAirport).
 #
 # Besides the database connection, the countNumberOfDepartingPassengers function has one parameter, an integer, departureAirport.
 #
 # We want to count the number of different passengers that left a particular airport. The function countNumberOfDepartingPassengers() should count the number of different passengers who have departed an airport by the parameter departureAirport. The function should return the count.
 #
 # countNumberOfDepartingPassengers returns that value.
 #
 # For more details, including error handling and return codes, see the Lab4 pdf.

def countNumberOfDepartingPassengers (myConn, departureAirport):
	stmt = "SELECT COUNT (DISTINCT r.passengerID) FROM Reservation r JOIN Flight f ON r.flightID = f.flightID WHERE f.departureAirport LIKE %s;"

#	stmt = "SELECT 1 FROM Airport a WHERE a.city = %s"
#	myCursor = myConn.cursor()
#	myCursor.execute("SELECT 1 FROM Airport a WHERE a.city = %s", (departureAirport,))
#	print(result)
#	myCursor.close()

	try:
		myCursor = myConn.cursor()
		stmt2 = "SELECT a.airportCode FROM Airport a WHERE a.airportCode = %s"
		myCursor.execute(stmt2, (departureAirport,))
		result = myCursor.fetchone()
		if result is None:
			return -1
		myCursor.execute("SELECT COUNT (DISTINCT r.passengerID) FROM Reservation r JOIN Flight f ON r.flightID = f.flightID WHERE f.departureAirport = %s;", (departureAirport,))
	except:
		print(f"Statement {stmt} is bad", file=sys.stderr)
		myCursor.close()
		myConn.close()
		sys.exit(-1)

	result = myCursor.fetchone()
	myCursor.close()

	return result[0]
# end countNumberOfDepartingPassengers


# updateReservationPayment (myConn, departureDate):
# In the Reservation table, the value of paymentMethod corresponds to the method that a passenger used to pay for the reservation. These correspond to credit codes (V, M, A, D). These are the only values in the Lab4 load data.
# Besides the database connection, updateReservationPayment has another parameter, departureDate, which is a string formatted as YEAR-MONTH-DAY or YYYY-MM-DD.
# If departureDate matches the date of the scheduledDeparture timestamp field in the Flight table, then the paymentMethod field in the Reservation table should have ‘REIMBURSED <departureDate>’ appended at the end. 
#If the year in departureDate is less than(<) 2025 or greater than (>) 2025, then no changes should be made to any status values, and updateReservationPayment should return -1.
#
# updateReservationPayment should return the number of reservations whose payment method was updated.
#
# For more details, including error handling, see the Lab4 pdf.

def updateReservationPayment (myConn, departureDate):
#	stmt = "SELECT EXTRACT (YEAR FROM f.scheduledDeparture) AS extracted_year, EXTRACT(MONTH FROM f.scheduledDeparture) AS extracted_month, EXTRACT(DAY FROM f.scheduledDeparture) AS extracted_day FROM Reservation r JOIN Flight f ON r.flightID = f.flightID WHERE TRUE;"
	stmt = "UPDATE Reservation r SET paymentMethod = paymentMethod || %s FROM Flight f WHERE r.flightID = f.flightID AND DATE(f.scheduledDeparture) = %s;"

	if int(departureDate[0:4]) > 2025 or int(departureDate[0:4]) < 2025:
		return -1

	try:
		myCursor = myConn.cursor()
		myCursor.execute(stmt, (f' REIMBURSED {departureDate[0:10]}', departureDate))
		updatedRows = myCursor.rowcount
	except:
		print(f"Statement {stmt} is bad", file=sys.stderr)
		myCursor.close()
		myConn.close()
		sys.exit(-1)

#	print("here")
#	rows = myCursor.fetchall()
#	print(rows)
#	month = int(departureDate[5:7])
#	day = int(departureDate[8:10])
#	print(int(rows[0][0]))
#	for row in rows:
#		if int(row[1]) == month and int(row[2]) == day:
#			print("yes")
#			if int(row[0]) > 2025 or int(row[0]) < 2025:
#				return -1
#	print("here2")

#	stmt2 = "UPDATE Reservation r SET paymentMethod = paymentMethod || %s FROM Flight f WHERE r.flightID = f.flightID AND DATE(f.scheduledDeparture) = %s;"

#	myCursor.execute(stmt2, (f' REIMBURSED {departureDate[0:10]}', departureDate))

#	updatedRows = myCursor.rowcount
#	print(updatedRows)
#	print("done")

#	stmt = "SELECT * FROM Reservation"
#	myCursor.execute(stmt)
#	rows = myCursor.fetchall()
#	for row in rows:
#		print(row)

	myCursor.close()

	return updatedRows

# end updateOrderStatus


# promoteCrewMembers(crewAssignments, minYearsExperience)

# The airlines want’s to promote crew members according to new seniority policy reliant on number of assignments and years of experience
#
# Besides the database connection, this Python function has two other parameters, crewAssignments and minYearsExperience which are both integers.
#
# promoteCrewMembers invokes a Stored Function, promoteCrewMembersFunction, that you will need to implement and store in the database according to the description in Section 6. The stored function promoteCrewMembersFunction has the same parameters assignments and years as the promoteCrewMembers (but the database connection is not a parameters for the stored function), and promoteCrewMembersFunction returns an integer.
#
# Section 6 tells you how to apply the promotions, and explains the integer value that promoteCrewMembersFunction returns. The promoteCrewMembers Python function returns the same integer value that the promoteCrewMembersFunction stored function returns.
#
# promoteCrewMembersFunction doesn’t print anything. The promoteCrewMembers function must only invoke the stored function promoteCrewMembersFunction, which does all of the work for this part of the assignment; promoteCrewMembers should not do any of the work itself.

#
# For more details, see the Lab4 pdf.

def promoteCrewMembers (myConn, crewAssignments, minYearsExperience):

	try:
		myCursor = myConn.cursor()
		sql = "SELECT promoteCrewMembersFunction(%s, %s)"
		myCursor.execute(sql, (crewAssignments, minYearsExperience))
	except:
		print("Call of promoteCrewMembers with arguments", crewAssignments, minYearsExperience, "had error", file=sys.stderr)
		myCursor.close()
		myConn.close()
		sys.exit(-1)

	row = myCursor.fetchone()
	myCursor.close()
	return(row[0])

#end promoteCrewMembers


def main():
	port = "5432"
	userID = "cse180"
	pwd = "database4me"

	# Try to make a connection to the database
	try:
		myConn = psycopg2.connect(port=port, user=userID, password=pwd)
#		for airport in ['LAX', 'JFK', 'SFO', 'ORD', 'SEA', 'SJC', 'ATL', 'DEN']:
#			result = countNumberOfDepartingPassengers(myConn, airport)
#			print(f"Airport: {airport} | Passengers: {result}")
#		updateReservationPayment(myConn, '2025-12-15 08:00:00')
#		print(promoteCrewMembers(myConn, 1, 1))
	except:
		print("Connection to database failed", file=sys.stderr)
		sys.exit(-1)

	# We're making every SQL statement a transaction that commits.
	# Don't need to explicitly begin a transaction.
	# Could have multiple statement in a transaction, using myConn.commit when we want to commit.

	myConn.autocommit = True
# Why does this cuase an error???

	# There are other correct ways of writing all of these calls correctly in Python.

	# Perform tests of countNumberOfDepartingPassengers, as described in Section 6 of Lab4.
	# Print their outputs (including error outputs) here, not in countNumberOfDepartingPassengers.
	# You may use a Python method to help you do the printing.
	for airport in ['LAX', 'ATL', 'EWR', 'SFO', 'SJC']:
		result = countNumberOfDepartingPassengers(myConn, airport)
		if result >= 0:
			print(f"Number of passengers for airport {airport} is {result}\n")
		elif result < 0:
			print(f"No airport exists with code {airport}\n")

	# Perform tests of updateReservationPayment, as described in Section 6 of Lab4.
	# Print their outputs (including error outputs) here, not in updateReservationPayment.
	# You may use a Python method to help you do the printing.
	for day in ['2025-10-8', '2025-10-9', '2026-10-10', '2025-10-10']:
		result = updateReservationPayment(myConn, day)
		if result >= 0:
			print(f"Number of Reservations whose paymentMethod values were updated by updateReservationPayment is {result}\n")
		if result < 0:
			print(f"Invalid date given\n")

	# Perform tests of promoteCrewMembers, as described in Section 6 of Lab4,
	# Print their outputs (including error outputs) here, not in promoteCrewMembers.
	# You may use a Python method to help you do the printing.
	for c, y in [(4, 10), (5, 0), (0, 0), (2, 5), (1, 2)]:
		result = promoteCrewMembers(myConn, c, y)
		if result >= 0:
			print(f"Number of promotions for crewAssignments {c} and minYearsExperience {y} is {result}\n")
		if result == -1:
			print(f"Invalid arguments given crewAssignments {c} and minYearsExperience {y}\n")

	myConn.close()
	sys.exit(0)
#end

#------------------------------------------------------------------------------
if __name__=='__main__':

	main()

# end
