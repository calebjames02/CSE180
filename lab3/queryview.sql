SELECT f.passengerID, f.passengerName, f.totalReservations, f.totalSpent / f.totalReservations AS avgSpentPerReservation
FROM FrequentFlyerView f;

--  passengerid | passengername | totalreservations | avgspentperreservation
---------------+---------------+-------------------+------------------------
--           5 | Eve Adams     |                 2 |   160.0000000000000000
--           2 | Bob Johnson   |                 2 |   790.0000000000000000
--           1 | Alice Smith   |                 3 |   440.0000000000000000
--           3 | Charlie Brown |                 2 |  1390.0000000000000000

DELETE FROM Reservation
WHERE reservationID = 5;

SELECT f.passengerID, f.passengerName, f.totalReservations, f.totalSpent / f.totalReservations AS avgSpentPerReservation
FROM FrequentFlyerView f;

-- passengerid | passengername | totalreservations | avgspentperreservation
---------------+---------------+-------------------+------------------------
--           5 | Eve Adams     |                 2 |   160.0000000000000000
--           2 | Bob Johnson   |                 2 |   790.0000000000000000
--           1 | Alice Smith   |                 3 |   440.0000000000000000
