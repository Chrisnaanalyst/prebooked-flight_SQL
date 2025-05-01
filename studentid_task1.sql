use [Prebooked Flights];
go

create table Employees (
	EmployeeID INT PRIMARY KEY,
	Username VARCHAR(50) UNIQUE NOT
NULL,
	PasswordHash VARCHAR(255) NOT
NULL,
	Role VARCHAR(20) CHECK (Role IN
('Ticketing Staff', 'Ticketing 
Supervisor')),
	Email VARCHAR(100),
	Name VARCHAR(100)
);

ALTER TABLE Employees
DROP CONSTRAINT CK__Employees__Role__38996AB5;

ALTER TABLE Employees
ALTER COLUMN Role VARCHAR(20);

ALTER TABLE Employees
ADD CONSTRAINT CK_Employees_Role
CHECK (Role IN ('Ticketing Staff', 'Ticketing Supervisor'));


create TABLE Passengers (
	passengerID INT PRIMARY KEY,
	Email VARCHAR(100),
	MealPreference VARCHAR(20) CHECK
(MealPreference IN ( 'Vegetarian', 
'Non-Vegetarian')),
	DOB DATE,
	FirstName VARCHAR(50),
	LastName  VARCHAR(50),
	EmergencyContact VARCHAR(20) NULL
);

 create Table Flights (
	FlightID INT PRIMARY KEY,
	FlightNumber VARCHAR(20) UNIQUE,
	DepartureTime DATETIME,
	ArrivalTime DATETIME,
	Origin VARCHAR(50),
	Destination VARCHAR(50)
	);

Create Table Reservations (
	ReservationID INT PRIMARY KEY,
	PassengerID INT,
	FlightID INT,
	ReservationDate DATE NOT NULL,
	Status VARCHAR(20) CHECK (Status 
IN ('Confirmed', 
	'Pending', 'Cancelled')),
		FOREIGN KEY (passengerID)
REFERENCES Passengers(passengerID),
		FOREIGN KEY (FlightID) REFERENCES
Flights(FlightID)
);

CREATE TABLE Tickets (
	TicketID INT PRIMARY KEY,
	ReservationID INT,
	IssueDate DATE,
	IssueTime TIME,
	Fare DECIMAL (10,2),
	SeatNumber VARCHAR(10) NULL,
	Class VARCHAR(20) CHECK (Class IN
('Business', 'FirstClass', 
'Economy')),
	EBoardingNumber VARCHAR(50)
UNIQUE,
	EmployeeID INT,
	PreferredSeat BIT,
	UpgradedMeal BIT,
	FOREIGN KEY (ReservationID)
REFERENCES
Reservations(ReservationID),
	FOREIGN KEY (EmployeeID)
REFERENCES Employees(EmployeeID)
);


CREATE TABLE Baggage (
	BaggageID INT PRIMARY KEY,
	TicketID INT,
	Weight DECIMAL(5,2),
	Status VARCHAR(20) CHECK (Status 
IN ('CheckedIn', 'Loaded')),
		FOREIGN KEY (TicketID) REFERENCES
Tickets(TicketID)
);

CREATE TABLE AdditionalServices (
	ServiceID INT PRIMARY KEY, 
	TicketID INT,
	ExtraBaggageKg INT DEFAULT 0,
	PreferredSeat BIT DEFAULT 0,
	UpgradedMeal BIT DEFAULT 0,
	FOREIGN KEY (TicketID) REFERENCES
Tickets(TicketID)
);


Insert into Employees(EmployeeID, Username, PasswordHash, Role, Email, Name)
Values(
101, 'Staff1', 'hashedpass101', 'Ticketing Staff', 'staff1@gmail.com', 'Isreal Hope'),
(102, 'Supervisor1', 'hashedpass102', 'Ticketing Supervisor', 'super1@gmail.com', 'John White'),
(103, 'Staff2', 'hashedpass103', 'Ticketing Staff', 'staff2@gmail.com', 'Dan Tom'),
(104, 'Staff3', 'hashedpass104', 'Ticketing Staff', 'staff3@gmail.com', 'Sarah Joy'),
(105, 'Supervisor2', 'hashedpass105', 'Ticketing Supervisor', 'super2@gmail.com', 'Mark Jay'),
(106, 'Staff4', 'hashedpass106', 'Ticketing Staff', 'staff4@gmail.com', 'Mary Bruce'),
(107, 'Staff5', 'hashedpass107', 'Ticketing Staff', 'staff5@gmail.com', 'Jude King');

select *
from Employees;


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
201, 'FL100', '2025-05-01 08:00', '2025-05-01 10:30', 'Lagos', 'Aubja'),
(202, 'FL101', '2025-05-01 12:00', '2025-05-01 14:30', 'Abuja', 'Kano'),
(203, 'FL102', '2025-05-02 06:00', '2025-05-02 08:00', 'Lagos', 'Port Harcourt'),
(204, 'FL103', '2025-05-02 10:00', '2025-05-02 12:30', 'Kano', 'Lagos'),
(205, 'FL104', '2025-05-03 07:00', '2025-05-03 09:00', 'Lagos', 'Abuja'),
(206, 'FL105', '2025-05-04 09:00', '2025-05-04 11:30', 'Abuja', 'Jos'),
(207, 'FL106', '2025-05-05 13:00', '2025-05-05 15:00', 'Lagos', 'Enugu');

update Flights
set Destination = 'Abuja'
where FlightID = 201;

select * from Flights;

Insert into Reservations (ReservationID, PassengerID, FlightID, ReservationDate,Status)
values(
1001, 111, 201, '2025-04-25', 'Confirmed'),
(1002, 112, 202, '2025-04-25', 'Pending'),
(1003, 113, 203, '2025-04-26', 'Cancelled'),
(1004, 114, 204, '2025-04-26', 'Confirmed'),
(1005, 115, 205, '2025-04-27', 'Pending'),
(1006, 116, 206, '2025-04-27', 'Confirmed'),
(1007, 117, 207, '2025-04-28', 'Confirmed');

select * from Reservations;

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

--Add constraint Reservation Date cannot be in the past--

Alter Table Reservations
ADD CONSTRAINT CHK_Reservation_Date
CHECK (ReservationDate >= CAST(GETDATE() AS DATE));

--Identify Passengers with pending reservations --

select * from Reservations;



select 
	p.PassengerID,
	p.FirstName,
	p.LastName,
	r.ReservationID,
	r.Status
from
	Passengers p
Join
	Reservations r ON p.PassengerID =
r.PassengerID
where
	r.Status = 'Pending';


-- Identify Passengers over age 40

select * from Passengers;

select 
	passengerID,
	FirstName,
	LastName,
	DOB,
	DATEDIFF(YEAR, DOB, GETDATE()) AS
Age
from 
	Passengers
where 
	DATEDIFF(YEAR, DOB, GETDATE()) > 
40;

-- Optional Combined Query --
-- Passengers Over 40 with Pending Reservation --

select 
	p.passengerID,
	p.FirstName,
	p.LastName,
	p.DOB,
	DATEDIFF(YEAR, DOB, GETDATE()) 
AS Age,
	r.ReservationID,
	r.Status
FROM
	Passengers p
JOIN
	Reservations r ON p.passengerID =
r.PassengerID
WHERE 
	r.Status = 'Pending'
	AND DATEDIFF(YEAR, p.DOB, GETDATE()) > 40;


-- Stored Procedure Search Passengers by Last Name (Sorted by Most Recent Ticket)

CREATE PROCEDURE
SearchPassegerByLastName
	@LastName NVARCHAR(50)
AS
BEGIN
	SELECT
		p.PassengerID,
		p.FirstName,
		p.LastName,
		t.TicketID,
		t.EBoardingNumber,
		t.IssueDate,
		t.IssueTime
	FROM
		Passengers p
	JOIN
		Reservations r ON
p.passengerID = r.PassengerID
	JOIN
		Tickets t ON
r.ReservationID = t.ReservationID
	WHERE
		p.LastName LIKE '%' + 
@LastName + '%'
		ORDER BY
			t.IssueDate DESC, t.IssueTime
DESC;
END;

EXEC SearchPassegerByLastName
@LastName = 'Joe';

-- FUNCTION - Passengers in Business Class with Reservation Today & Meal Requirement --

CREATE FUNCTION 
GetBusinessClassPassengersToday()
RETURNS TABLE
AS
RETURN
(
	SELECT 
		p.PassengerID,
		p.FirstName,
		p.LastName,
		P.MealPreference,
		t.Class,
		r.ReservationDate
	FROM
		Passengers p
	JOIN
		Reservations r ON 
p.passengerID = r.PassengerID
	JOIN
		Tickets t ON r.ReservationID 
= t.ReservationID
	WHERE
		CAST(r.ReservationDate AS
DATE) = CAST(GETDATE() AS DATE)
		AND t.Class = 'Business'
);

select * from
GetBusinessClassPassengersToday();


-- @TargetDate allows users to retrieve passengers who booked Business class tickets for any specified date.--
CREATE FUNCTION 
GetBusinessClassPassengersByDate(@TargetDate Date)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		p.PassengerID,
		p.FirstName,
		p.LastName,
		P.MealPreference,
		t.Class,
		r.ReservationDate
	FROM
		Passengers p
	JOIN
		Reservations r ON 
p.passengerID = r.PassengerID
	JOIN
		Tickets t ON r.ReservationID 
= t.ReservationID
	WHERE
		CAST(r.ReservationDate AS
DATE) = @TargetDate
		AND t.Class = 'Business'
);

Select * from
GetBusinessClassPassengersByDate('2025-04-25');

-- Stored Procedure - Insert a New Employee --

CREATE PROCEDURE InsertNewEmployee
	@EmployeeID INT,
	@Username NVARCHAR(50),
	@PasswordHash NVARCHAR(100),
	@Role NVARCHAR(30),
	@Email NVARCHAR(100),
	@Name NVARCHAR(100)
AS
BEGIN
	INSERT INTO Employees
(EmployeeID, Username, PasswordHash, Role, Email, Name)
	VALUES(@EmployeeID, @Username, @PasswordHash, @Role, @Email, @Name);
END;

EXEC InsertNewEmployee
	@EmployeeID = 108,
	@Username = 'Staff6',
	@PasswordHash = 'hashedpass108',
	@Role = 'Ticketing Staff',
	@Email = 'staff6@gmail.com',
	@Name = 'Victor Okoro';

select * from Passengers;

-- Stored Procedure - UpdatePassengerDetails --
CREATE PROCEDURE
UpdatePassengerDetails
	@PassengerID INT,
	@Email NVARCHAR(100),
	@MealPreference NVARCHAR(30),
	@EmergencyContact NVARCHAR(20)
AS
BEGIN
	UPDATE Passengers
	SET
		Email =@Email,
		MealPreference = @MealPreference,
		EmergencyContact =@EmergencyContact
	WHERE 
		passengerID = @PassengerID;
END;

EXEC UpdatePassengerDetails
	@PassengerID = 111,
	@Email = 'ade_updated@yahoo.com',
	@MealPreference = 'Non-Vegetarian',
	@EmergencyContact = '08123456799';

-- Creating View E-Boarding Numbers by Employee and Revenue Per Flight
Create View 
view_EBoardingRevenuePerEmployee AS
Select
	e.EmployeeID,
	e.Name AS EmployeeName,
	f.FlightID,
	f.FlightNumber,
	t.TicketID,
	t.EBoardingNumber,
	t.Fare,

	-- Additional Services Revenue --
	ISNULL(t.PreferredSeat * 30, 0)
AS PreferredSeatfee,
	ISNULL(t.UpgradedMeal * 20, 0) 
AS UpgradedMealFee,
	ISNULL(b.Weight * 100, 0)
As BaggageFee,

	-- Total Revenue
	t.Fare +
	ISNULL(t.PreferredSeat * 30, 0) +
	ISNULL(t.UpgradedMeal * 20, 0) +
	ISNULL(b.Weight * 100, 0)
AS TotalRevenue
FROM
	Tickets t
JOIN
	Employees e ON t.EmployeeID =
e.EmployeeID
JOIN 
	Reservations r ON t.ReservationID =
r.ReservationID
JOIN
	Flights f ON r.FlightID =
f.FlightID
LEFT JOIN
	Baggage  b ON t.TicketID =
b.TicketID ;

	select * from Tickets;
	select * from Baggage;
	select * from AdditionalServices;
	select * from Reservations;
	


select * from 
view_EBoardingRevenuePerEmployee;

-- Trigger to set seat allotment status to 'Reserved'--

ALTER TABLE Tickets
ADD SeatStatus VARCHAR(20);

DROP TRIGGER IF EXISTS trg_UpdateSeatStatusOnTicketIssue;
GO

CREATE TRIGGER trg_UpdateSeatStatusOnTicketIssue
ON Tickets
AFTER INSERT
AS
BEGIN
    -- Set SeatStatus to 'Reserved' if SeatNumber is NOT NULL
    UPDATE t
    SET SeatStatus = 'Reserved'
    FROM Tickets t
    INNER JOIN inserted i ON t.TicketID = i.TicketID
    WHERE i.SeatNumber IS NOT NULL;
END;


-- Insert another column to test the trigger--
INSERT INTO Tickets(TicketID, ReservationID, IssueDate, IssueTime, Fare, 
SeatNumber,Class, EBoardingNumber,EmployeeID,PreferredSeat, UpgradedMeal)
VALUES(308, 1007, GETDATE(), CONVERT(TIME, GETDATE()), 500, 'F6', 'FirstClass',
'EB008', 101, 1, 1);


select * from Tickets;

-- Create function to count checked-in baggage for a flight on a specific date --

CREATE FUNCTION getcheckedinbaggagecount
(
    @FlightID INT,
    @CheckedDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Baggage b
    JOIN Tickets t ON b.TicketID = t.TicketID
    JOIN Reservations r ON t.ReservationID = r.ReservationID
    WHERE r.FlightID = @FlightID
      AND b.Status = 'CheckedIn'
      AND t.IssueDate = @CheckedDate;

    RETURN @Count;
END;

select * from
Baggage;

-- call function --
select 
dbo.getcheckedinbaggagecount(201,
'2025-04-18') AS CheckedInBags;


-- Additional queries--
-- create a view for list of all Flights with Available vs  Reserved Seats --
CREATE VIEW View_FlightSeatStatus AS
SELECT
    f.FlightID,
    f.FlightNumber,
    COUNT(CASE WHEN t.SeatNumber IS NULL THEN 1 END) AS AvailableSeats,
    COUNT(CASE WHEN t.SeatNumber IS NOT NULL THEN 1 END) AS ReservedSeats
FROM Flights f
LEFT JOIN Reservations r ON f.FlightID = r.FlightID
LEFT JOIN Tickets t ON r.ReservationID = t.ReservationID
GROUP BY f.FlightID, f.FlightNumber;

select * from View_FlightSeatStatus;


CREATE PROCEDURE
GetTopEmployeesByRevenue
    @TargetDate DATE
AS
BEGIN
    SELECT TOP 3 
        e.EmployeeID,
        e.Name AS EmployeeName,
        SUM(t.Fare + 
            ISNULL(t.PreferredSeat * 30, 0) +
            ISNULL(t.UpgradedMeal * 20, 0) +
            ISNULL(b.Weight * 100, 0)) AS TotalRevenue
    FROM 
        Tickets t
    JOIN 
        Employees e ON t.EmployeeID = e.EmployeeID
    LEFT JOIN 
        Baggage b ON t.TicketID = b.TicketID
    WHERE 
        CAST(t.IssueDate AS DATE) = @TargetDate
    GROUP BY 
        e.EmployeeID, e.Name
    ORDER BY 
        TotalRevenue DESC;
END;

EXEC GetTopEmployeesByRevenue
@TargetDate = '2025-04-18';

