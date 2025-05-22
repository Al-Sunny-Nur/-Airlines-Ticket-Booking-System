---Source Code for Airlines Ticket Booking System

---Tables Creation

CREATE TABLE Login (
  login_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id));

CREATE TABLE Users (
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  user_email VARCHAR(255) NOT NULL,
  user_address VARCHAR(255) NOT NULL,
  user_mobile VARCHAR(255) NOT NULL
);

CREATE TABLE Roles (
  role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  role_name VARCHAR(255) NOT NULL,
  role_desc VARCHAR(255) NOT NULL
);

CREATE TABLE Permission (
  per_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  per_name VARCHAR(255) NOT NULL,
  per_module VARCHAR(255) NOT NULL,
  per_role_id INT NOT NULL,
  FOREIGN KEY (per_role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Passenger (
  p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pname VARCHAR(255) NOT NULL,
  paddress VARCHAR(255) NOT NULL,
  pmobile VARCHAR(255) NOT NULL,
  p_email VARCHAR(255) NOT NULL
);

CREATE TABLE Ticket (
  t_book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tbook_desc VARCHAR(255) NOT NULL,
  tbook_date DATE NOT NULL,
  passenger_id INT NOT NULL,
  FOREIGN KEY (passenger_id) REFERENCES Passenger(p_id));

CREATE TABLE Reservation (
  reservation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  a_id INT NOT NULL,
  passenger_id INT NOT NULL,
  t_book_id INT NOT NULL,
  a_sch_date DATE NOT NULL,
  a_re_date DATE NOT NULL,
  a_desc VARCHAR(255) NOT NULL,
  a_type VARCHAR(255) NOT NULL,
  re_type VARCHAR(255) NOT NULL
);

CREATE TABLE Has (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

---Tables Insertion

INSERT INTO Users (user_name, user_email, user_address, user_mobile) VALUES
('raysha', 'raysha@example.com', '123 Maple Street', '123-456-7890'),
('nur', 'nur@example.com', '456 Oak Avenue', '234-567-8901'),
('sunny', 'sunny@example.com', '789 Pine Road', '345-678-9012'),
('David Brown', 'david.brown@example.com', '321 Birch Lane', '456-789-0123'),
('Eve Black', 'eve.black@example.com', '654 Cedar Street', '567-890-1234'),
('Frank Green', 'frank.green@example.com', '987 Spruce Boulevard', '678-901-2345'),
('Grace Blue', 'grace.blue@example.com', '159 Elm Drive', '789-012-3456'),
('Hank Purple', 'hank.purple@example.com', '753 Willow Way', '890-123-4567'),
('Ivy Gold', 'ivy.gold@example.com', '951 Cypress Court', '901-234-5678'),
('Jack Silver', 'jack.silver@example.com', '357 Redwood Trail', '012-345-6789');

INSERT INTO Roles (role_name, role_desc) VALUES
('Admin', 'Administrator with full access'),
('User', 'Regular user with limited access'),
('Manager', 'Manager with supervisory privileges'),
('Support', 'Support staff with troubleshooting access'),
('Developer', 'Developer with code access'),
('Analyst', 'Analyst with data access'),
('Guest', 'Guest with view-only access'),
('Moderator', 'Moderator with content control'),
('Sales', 'Sales team member'),
('HR', 'Human resources personnel');


INSERT INTO Permission (per_name, per_module, per_role_id) VALUES
('View Dashboard', 'Dashboard', 1),
('Edit Users', 'User Management', 1),
('Delete Records', 'Data Management', 1),
('View Reports', 'Reports', 2),
('Create Tickets', 'Support', 2),
('Manage Roles', 'Role Management', 3),
('Access Logs', 'System Logs', 4),
('Modify Settings', 'Settings', 5),
('Analyze Data', 'Analytics', 6),
('View Profiles', 'Profile Management', 7);

INSERT INTO Passenger (pname, paddress, pmobile, p_email) VALUES
('John Doe', '123 Main St', '111-222-3333', 'john.doe@example.com'),
('Jane Smith', '456 Elm St', '222-333-4444', 'jane.smith@example.com'),
('Sam Brown', '789 Oak St', '333-444-5555', 'sam.brown@example.com'),
('Lisa Ray', '321 Pine St', '444-555-6666', 'lisa.ray@example.com'),
('Paul Green', '654 Cedar St', '555-666-7777', 'paul.green@example.com'),
('Kate Blue', '987 Maple St', '666-777-8888', 'kate.blue@example.com'),
('Tom White', '159 Birch St', '777-888-9999', 'tom.white@example.com'),
('Sara Black', '753 Spruce St', '888-999-0000', 'sara.black@example.com'),
('Gary Gold', '951 Elm St', '999-000-1111', 'gary.gold@example.com'),
('Nina Silver', '357 Willow St', '000-111-2222', 'nina.silver@example.com');

INSERT INTO Ticket (tbook_desc, tbook_date, passenger_id) VALUES
('Flight to NYC', '2024-05-01', 1),
('Flight to LA', '2024-06-01', 2),
('Flight to Chicago', '2024-07-01', 3),
('Flight to Houston', '2024-08-01', 4),
('Flight to Miami', '2024-09-01', 5),
('Flight to Seattle', '2024-10-01', 6),
('Flight to Denver', '2024-11-01', 7),
('Flight to Boston', '2024-12-01', 8),
('Flight to Atlanta', '2024-01-01', 9),
('Flight to Dallas', '2024-02-01', 10);

INSERT INTO Reservation (a_id, passenger_id, t_book_id, a_sch_date, a_re_date, a_desc, a_type, re_type) VALUES
(1, 1, 1, '2024-04-01', '2024-05-01', 'Business Trip', 'Flight', 'Round Trip'),
(2, 2, 2, '2024-05-01', '2024-06-01', 'Vacation', 'Flight', 'One Way'),
(3, 3, 3, '2024-06-01', '2024-07-01', 'Conference', 'Flight', 'Round Trip'),
(4, 4, 4, '2024-07-01', '2024-08-01', 'Family Visit', 'Flight', 'One Way'),
(5, 5, 5, '2024-08-01', '2024-09-01', 'Holiday', 'Flight', 'Round Trip'),
(6, 6, 6, '2024-09-01', '2024-10-01', 'Workshop', 'Flight', 'One Way'),
(7, 7, 7, '2024-10-01', '2024-11-01', 'Seminar', 'Flight', 'Round Trip'),
(8, 8, 8, '2024-11-01', '2024-12-01', 'Training', 'Flight', 'One Way'),
(9, 9, 9, '2024-12-01', '2025-01-01', 'Meetup', 'Flight', 'Round Trip'),
(10, 10, 10, '2024-01-01', '2024-02-01', 'Business Trip', 'Flight', 'One Way');
INSERT INTO Has (user_id, role_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Login (user_id, username, password) VALUES
(1, 'alice_j', 'password1'),
(2, 'bob_s', 'password2'),
(3, 'carol_w', 'password3'),
(4, 'david_b', 'password4'),
(5, 'eve_b', 'password5'),
(6, 'frank_g', 'password6'),
(7, 'grace_b', 'password7'),
(8, 'hank_p', 'password8'),
(9, 'ivy_g', 'password9'),
(10, 'jack_s', 'password10');


 ---Aggregate Functions

---Count the total number of users:

   SELECT COUNT(*) AS total_users FROM Users;

---Find the average length of user names:

   SELECT AVG(LENGTH(user_name)) AS    avg_name_length FROM Users;

--- Count the number of tickets booked per passenger:
   
   SELECT passenger_id, COUNT(*) AS tickets_booked
   FROM Ticket
   GROUP BY passenger_id;

---Find the maximum and minimum ticket booking dates:

   SELECT MAX(tbook_date) AS latest_booking, MIN(tbook_date) AS earliest_booking
   FROM Ticket;


---Sum of permissions assigned to each role:

   SELECT per_role_id, COUNT(*) AS total_permissions
   FROM Permission
   GROUP BY per_role_id;
 

---Join Queries

--- List all users with their corresponding roles:

   SELECT Users.user_name, Roles.role_name
   FROM Users
   JOIN Has ON Users.user_id = Has.user_id
   JOIN Roles ON Has.role_id = Roles.role_id;


--- List all passengers with their booked tickets:

   SELECT Passenger.pname, Ticket.tbook_desc, Ticket.tbook_date
   FROM Passenger
   JOIN Ticket ON Passenger.p_id = Ticket.passenger_id;

3. Find all reservations with passenger and ticket details:

   SELECT Reservation.a_id, Passenger.pname, Ticket.tbook_desc, Reservation.a_sch_date, Reservation.a_re_date
   FROM Reservation
   JOIN Passenger ON Reservation.passenger_id = Passenger.p_id
   JOIN Ticket ON Reservation.t_book_id = Ticket.t_book_id;


4. List all permissions along with their corresponding role names:
   
   SELECT Permission.per_name, Permission.per_module, Roles.role_name
   FROM Permission
   JOIN Roles ON Permission.per_role_id = Roles.role_id;




---BETWEEN Clause

--- Find tickets booked between two specific dates:
   
   SELECT * FROM Ticket
   WHERE tbook_date BETWEEN '2024-01-01' AND '2024-12-31';


--- List reservations scheduled between two dates:
   
   SELECT * FROM Reservation
   WHERE a_sch_date BETWEEN '2024-06-01' AND '2024-09-01';

---WHERE Clause

--- Find all users who live on 'Elm Street':
   
   SELECT * FROM Users
   WHERE user_address LIKE '%Elm Street%';


--- Find all roles with 'Manager' in their name:
   
   SELECT * FROM Roles
   WHERE role_name LIKE '%Manager%';


--- Find all passengers with mobile numbers starting with '555':
 
   SELECT * FROM Passenger
   WHERE pmobile LIKE '555%';


--- List tickets booked by a specific passenger (e.g., passenger_id = 1):

   SELECT * FROM Ticket
   WHERE passenger_id = 1;

---Group By and Having

--- Find the number of users grouped by their address:
 
   SELECT user_address, COUNT(*) AS num_users
   FROM Users
   GROUP BY user_address;


--- Find roles with more than one permission:

   SELECT per_role_id, COUNT(*) AS num_permissions
   FROM Permission
   GROUP BY per_role_id
   HAVING COUNT(*) > 1;
 

---Ordering Results

--- List all users ordered by their names:
 
   SELECT * FROM Users
   ORDER BY user_name;
   

--- List all roles ordered by role description:
  
 SELECT * FROM Roles
   ORDER BY role_desc;

--- List all tickets ordered by booking date in descending order: 

  SELECT * FROM Ticket
   ORDER BY tbook_date DESC;
   
---Trigger:

---Here are the two triggers and their corresponding codes for  Login and Has tables:

---Trigger 1: Automatically Assign Default Role to New Users:

CREATE TRIGGER after_insert_login
AFTER INSERT ON Login
FOR EACH ROW
BEGIN
  INSERT INTO Has (user_id, role_id) VALUES (NEW.user_id, 2);
END;


---Trigger 2: Prevent Deleting Users Assigned to Roles:

CREATE TRIGGER before_delete_login
BEFORE DELETE ON Login
FOR EACH ROW
BEGIN
  DECLARE has_roles INT;
  SELECT COUNT(*) INTO has_roles FROM Has WHERE user_id = OLD.user_id;
  IF has_roles > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete user assigned to roles.';
  END IF;
END;


---Trigger 03:

CREATE TRIGGER after_insert_login
AFTER INSERT ON Login
FOR EACH ROW
BEGIN
  INSERT INTO Has (user_id, role_id) VALUES (NEW.user_id, 2);
END;

CREATE TRIGGER before_delete_login
BEFORE DELETE ON Login
FOR EACH ROW
BEGIN
  DECLARE has_roles INT;
  SELECT COUNT(*) INTO has_roles FROM Has WHERE user_id = OLD.user_id;
  IF has_roles > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete user assigned to roles.';
  END IF;
END;



