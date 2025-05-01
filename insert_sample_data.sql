Insert into Employees(EmployeeID, Username, PasswordHash, Role, Email, Name)
Values(
101, 'Staff1', 'hashedpass101', 'Ticketing Staff', 'staff1@gmail.com', 'Isreal Hope'),
(102, 'Supervisor1', 'hashedpass102', 'Ticketing Supervisor', 'super1@gmail.com', 'John White'),
(103, 'Staff2', 'hashedpass103', 'Ticketing Staff', 'staff2@gmail.com', 'Dan Tom'),
(104, 'Staff3', 'hashedpass104', 'Ticketing Staff', 'staff3@gmail.com', 'Sarah Joy'),
(105, 'Supervisor2', 'hashedpass105', 'Ticketing Supervisor', 'super2@gmail.com', 'Mark Jay'),
(106, 'Staff4', 'hashedpass106', 'Ticketing Staff', 'staff4@gmail.com', 'Mary Bruce'),
(107, 'Staff5', 'hashedpass107', 'Ticketing Staff', 'staff5@gmail.com', 'Jude King');



Insert into Passengers ( passengerID, Email, MealPreference, DOB, FirstName, LastName, EmergencyContact)
Values (
111, 'ade@yahoo.com', 'Vegetarian', '1980-05-12', 'Ade', 'Ojo', '08012345678'),
(112, 'ken@yahoo.com', 'Non-Vegetarian', '1975-08-20', 'Ken', 'Bright', '08023456789'),
(113, 'lola@yahoo.com', 'Vegetarian', '1990-01-15', 'Lola', 'Akins', NULL),
(114, 'tola@yahoo.com', 'Non-Vegetarian', '2000-09-05', 'Tola', 'James', '08034567890'),
(115, 'mary@yahoo.com', 'Vegetarian', '1982-04-25', 'Mary', 'Joe', '08045678901'),
(116, 'tim@yahoo.com', 'Non-Vegetarian', '1999-11-12', 'Tim', 'Paul', NULL),
(117, 'jane@yahoo.com', 'Vegetarian', '1985-07-07', 'Jane', 'Benson', '08056789012');


Insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Origin, Destination)
Values (
201, 'FL100', '2025-05-01 08:00', '2025-05-01 10:30', 'Lagos', 'Abuja'),
(202, 'FL101', '2025-05-01 12:00', '2025-05-01 14:30', 'Abuja', 'Kano'),
(203, 'FL102', '2025-05-02 06:00', '2025-05-02 08:00', 'Lagos', 'Port Harcourt'),
(204, 'FL103', '2025-05-02 10:00', '2025-05-02 12:30', 'Kano', 'Lagos'),
(205, 'FL104', '2025-05-03 07:00', '2025-05-03 09:00', 'Lagos', 'Abuja'),
(206, 'FL105', '2025-05-04 09:00', '2025-05-04 11:30', 'Abuja', 'Jos'),
(207, 'FL106', '2025-05-05 13:00', '2025-05-05 15:00', 'Lagos', 'Enugu');



Insert into Reservations (ReservationID, PassengerID, FlightID, ReservationDate,Status)
values(
1001, 111, 201, '2025-04-25', 'Confirmed'),
(1002, 112, 202, '2025-04-25', 'Pending'),
(1003, 113, 203, '2025-04-26', 'Cancelled'),
(1004, 114, 204, '2025-04-26', 'Confirmed'),
(1005, 115, 205, '2025-04-27', 'Pending'),
(1006, 116, 206, '2025-04-27', 'Confirmed'),
(1007, 117, 207, '2025-04-28', 'Confirmed');


Insert into Tickets (TicketID, ReservationID, IssueDate, IssueTime, Fare, SeatNumber, 
Class, EBoardingNumber, EmployeeID, PreferredSeat, UpgradedMeal)
Values(
301, 1001, '2025-04-18', '09:00', 200, 'A1', 'Economy', 'EB001', 101, 1, 0),
(302, 1002, '2025-04-18', '09:10', 250, NULL, 'Business', 'EB002',103, 0, 1),
(303, 1003, '2025-04-18', '09:20', 180, 'B2', 'Economy', 'EB003', 104, 1, 1),
(304, 1004, '2025-04-18', '09:30', 300, 'C3', 'FirstClass', 'EB004', 101, 1, 0),
(305, 1005, '2025-04-18', '09:40', 270, NULL, 'Business', 'EB005', 103, 0, 1),
(306, 1006, '2025-04-18', '09:50', 220, 'D1', 'Economy', 'EB006', 104, 1, 1),
(307, 1007, '2025-04-18', '10:00', 230, 'E4', 'Economy', 'EB007', 101, 1, 0);

Insert into Baggage (BaggageID, TicketID, Weight, Status)
Values(
01, 301, 5, 'CheckedIn'),
(02, 302, 10, 'CheckedIn'),
(03, 303, 0, 'Loaded'),
(04, 304, 7, 'CheckedIn'),
(05, 305, 3, 'Loaded'),
(06, 306, 5, 'CheckedIn'),
(07, 307, 2, 'CheckedIn');

Insert into AdditionalServices(ServiceID, TicketID, ExtraBaggageKg, PreferredSeat, UpgradedMeal) 
Values(
001, 301, 2, 1, 0),
(002, 302, 5, 0, 1),
(003, 303, 0, 1, 1),
(004, 304, 3, 1, 0),
(005, 305, 1, 0, 1),
(006, 306, 4, 1, 1),
(007, 307, 2, 1, 0);
