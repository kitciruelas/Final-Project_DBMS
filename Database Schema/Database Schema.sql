CREATE TABLE Guests_table (
 GuestID INT PRIMARY KEY,
 name VARCHAR(50),
 email VARCHAR(50),
 phone VARCHAR(20),
 address VARCHAR(50)
);

INSERT INTO Guests_table (GuestID, name, email, phone, address)
VALUES
 (1, 'Keith', 'keith@gmail.com', '1234567890', 'San juan'),
 (2, 'Laurence', 'laurence@gmail.com', '9876543210', 'Lipa City');
 (3, 'Mark', 'Mark@g.com', '1231231234', 'Quezon Province'),
 (4, 'Cedrick', 'cedrick@yahoo.com', '9879879876', 'Muzon'),
 (5, 'Von', 'Von@gmail.com', '5555555555', 'Mataas na kahoy'),
 (6, 'Kian', 'kian@gmail.com', '6666666666', 'San jose'),
 (7, 'Denver', 'denver@gmail.com', '7777777777', 'Rosario'),
 (8, 'Lourenz', 'lourenz@gmail.com', '8888888888', 'Rosario'),
 (9, 'Alleon', 'alleon@gmail.com', '9999999999', 'Riverside'),
 (10, 'Jerome', 'oliver@gmail.com', '1010101010', 'Padre garcia');

CREATE TABLE Reservation_table (
 ReservationID INT PRIMARY KEY,
 GuestID INT,
 Checkindate DATE,
 Checkoutdate DATE,
 Reservationdate DATE,
 FOREIGN KEY (GuestID) REFERENCES Guests_table(GuestID)
);

INSERT INTO Reservation_table (ReservationID, GuestID, Checkindate, Checkoutdate, Reservationdate)
VALUES
 (1, 1, '2023-01-01', '2023-01-05', '2022-12-15'),
 (2, 2, '2023-02-10', '2023-02-15', '2023-01-20');
 (3, 3, '2023-03-15', '2023-03-20', '2023-02-28'),
 (4, 4, '2023-04-01', '2023-04-05', '2023-03-15'),
 (5, 5, '2023-05-10', '2023-05-15', '2023-04-25'),
 (6, 6, '2023-06-20', '2023-06-25', '2023-06-01'),
 (7, 7, '2023-07-05', '2023-07-10', '2023-06-15'),
 (8, 8, '2023-08-15', '2023-08-20', '2023-07-30'),
 (9, 9, '2023-09-01', '2023-09-05', '2023-08-20'),
 (10, 10, '2023-10-10', '2023-10-15', '2023-09-25');

CREATE TABLE Room_table (
 RoomID INT PRIMARY KEY,
 ReservationID INT,
 RoomType VARCHAR(50),
 RoomRate DECIMAL(10, 2),
 Availability VARCHAR(50),
 FOREIGN KEY (ReservationID) REFERENCES Reservation_table(ReservationID)
);

INSERT INTO Room_table (RoomID, ReservationID, RoomType, RoomRate,Availability)
VALUES
 (101, 1, 'Standard', 100.00,Not Available),
 (102, 2, 'Deluxe', 150.00,Occupied);
 (103, 3, 'Suite', 200.00, 'Available'),
 (104, 4, 'Standard', 100.00, 'Available'),
 (105, 5, 'Deluxe', 150.00, 'Available'),
 (106, 6, 'Standard', 100.00, 'Not Available'),
 (107, 7, 'Suite', 200.00, 'Available'),
 (108, 8, 'Deluxe', 150.00, 'Not Available'),
 (109, 9, 'Standard', 100.00, 'Available'),
 (110, 10, 'Deluxe', 150.00, 'Not Available');

CREATE TABLE Booking_table (
 BookingID INT PRIMARY KEY,
 BookingSubmit DATE,
 ReservationID INT,
 RoomID INT,
 FOREIGN KEY (ReservationID) REFERENCES Reservation_table(ReservationID),
 FOREIGN KEY (RoomID) REFERENCES Room_table(RoomID)
);

INSERT INTO Booking_table (BookingID, BookingSubmit, ReservationID, RoomID)
VALUES
 (1, '2022-12-20', 1, 101),
 (2, '2023-01-25', 2, 102);
 (3, '2023-02-25', 3, 103),
 (4, '2023-03-05', 4, 104),
 (5, '2023-04-20', 5, 105),
 (6, '2023-05-25', 6, 106),
 (7, '2023-06-10', 7, 107),
 (8, '2023-07-15', 8, 108),
 (9, '2023-08-30', 9, 109),
 (10, '2023-09-10', 10, 110);

CREATE TABLE Staff_Booking_table (
 Staff_BookingID INT PRIMARY KEY,
 StartTime TIME,
 EndTime TIME,
 Status VARCHAR(50),
 BookingID INT,
 FOREIGN KEY (BookingID) REFERENCES Booking_table(BookingID)
);

INSERT INTO Staff_Booking_table (Staff_BookingID, StartTime, EndTime, Status, BookingID)
VALUES
 (1, '08:00:00', '16:00:00', 'Confirmed', 1),
 (2, '09:00:00', '17:00:00', 'Confirmed', 2);
 (3, '10:00:00', '18:00:00', 'Confirmed', 3),
 (4, '11:30:00', '19:30:00', 'Confirmed', 4),
 (5, '08:00:00', '16:00:00', 'Confirmed', 5),
 (6, '09:30:00', '17:30:00', 'Confirmed', 6),
 (7, '12:00:00', '20:00:00', 'Confirmed', 7),
 (8, '14:00:00', '22:00:00', 'Confirmed', 8),
 (9, '09:00:00', '17:00:00', 'Confirmed', 9),
 (10, '10:30:00', '18:30:00', 'Confirmed', 10);

CREATE TABLE Staff_frontdesk_table (
 StaffID INT PRIMARY KEY,
 name VARCHAR(50),
 GuestID INT,
 Staff_BookingID INT,
 FOREIGN KEY (Staff_BookingID) REFERENCES Staff_Booking_table(Staff_BookingID),
 FOREIGN KEY (GuestID) REFERENCES Guests_table(GuestID)
);

INSERT INTO Staff_frontdesk_table (StaffID, name, GuestID, Staff_BookingID)
VALUES
 (101, 'Front Desk Staff 1', 1, 1),
 (102, 'Front Desk Staff 2', 2, 2);
 (103, 'Front Desk Staff 3', 3, 3),
 (104, 'Front Desk Staff 4', 4, 4),
 (105, 'Front Desk Staff 5', 5, 5),
 (106, 'Front Desk Staff 6', 6, 6),
 (107, 'Front Desk Staff 7', 7, 7),
 (108, 'Front Desk Staff 8', 8, 8),
 (109, 'Front Desk Staff 9', 9, 9),
 (110, 'Front Desk Staff 10', 10, 10);

CREATE TABLE Check_in_table (
 CheckinID INT PRIMARY KEY,
 CheckinDate DATE,
 CheckinTime TIME,
 StaffID INT,
 FOREIGN KEY (StaffID) REFERENCES Staff_frontdesk_table(StaffID)
);

INSERT INTO Check_in_table (CheckinID, CheckinDate, CheckinTime, StaffID)
VALUES
 (1, '2023-01-01', '14:00:00', 101),
 (2, '2023-02-10', '15:30:00', 102);
 (3, '2023-03-15', '14:30:00', 103),
 (4, '2023-04-01', '15:45:00', 104),
 (5, '2023-05-10', '14:00:00', 105),
 (6, '2023-06-20', '16:30:00', 106),
 (7, '2023-07-05', '13:15:00', 107),
 (8, '2023-08-15', '12:45:00', 108),
 (9, '2023-09-01', '14:15:00', 109),
 (10, '2023-10-10', '15:00:00', 110);

CREATE TABLE Check_out_table (
 CheckoutID INT PRIMARY KEY,
 StaffID INT,
 CheckoutDate DATE,
 CheckoutTime TIME,
 TotalAmount DECIMAL(10, 2),
 FOREIGN KEY (StaffID) REFERENCES Staff_frontdesk_table(StaffID)
);

INSERT INTO Check_out_table (CheckoutID, StaffID, CheckoutDate, CheckoutTime, TotalAmount)
VALUES
 (1, 101, '2023-01-05', '12:00:00', 450.00),
 (2, 102, '2023-02-15', '13:45:00', 6000.00);
 (3, 103, '2023-03-20', '12:00:00', 600.00),
 (4, 104, '2023-04-05', '11:30:00', 700.00),
 (5, 105, '2023-05-15', '13:45:00', 900.00),
 (6, 106, '2023-06-25', '14:30:00', 500.00),
 (7, 107, '2023-07-10', '12:15:00', 800.00),
 (8, 108, '2023-08-20', '11:45:00', 750.00),
 (9, 109, '2023-09-05', '13:15:00', 850.00),
 (10, 110, '2023-10-15', '14:00:00', 1000.00);

CREATE TABLE Feedback_table (
 FeedbackID INT PRIMARY KEY,
 CheckoutID INT,
 Rating INT,
 Comments TEXT,
 FOREIGN KEY (CheckoutID) REFERENCES Check_out_table(CheckoutID)
);

INSERT INTO Feedback_table (FeedbackID, CheckoutID, Rating, Comments)
VALUES
 (1, 1, 4, 'Great experience!'),
 (2, 2, 5, 'Excellent service!');
 (3, 3, 4, 'Enjoyed the stay!'),
 (4, 4, 5, 'Amazing service!'),
 (5, 5, 4, 'Good experience'),
 (6, 6, 3, 'Room could be cleaner'),
 (7, 7, 5, 'Outstanding staff!'),
 (8, 8, 4, 'Comfortable stay'),
 (9, 9, 5, 'Excellent facilities'),
 (10, 10, 4, 'Overall great experience');