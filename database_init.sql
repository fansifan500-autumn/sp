-- Database Initialization Script for Tourism Platform

-- Dropping existing tables if they exist
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Destinations;
DROP TABLE IF EXISTS Tours;
DROP TABLE IF EXISTS Bookings;

-- Creating Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creating Destinations table
CREATE TABLE Destinations (
    destination_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creating Tours table
CREATE TABLE Tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    destination_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id)
);

-- Creating Bookings table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tour_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id)
);

-- Inserting test data into Users table
INSERT INTO Users (username, password, email) VALUES  
('johndoe', 'password123', 'john.doe@example.com'),  
('janedoe', 'password456', 'jane.doe@example.com'),  
('alice', 'password789', 'alice@example.com');

-- Inserting test data into Destinations table
INSERT INTO Destinations (name, description) VALUES  
('Paris', 'The city of lights and romance.'),  
('New York', 'The big apple, known for its skyline and culture.'),  
('Tokyo', 'A blend of traditional and modern attractions.');

-- Inserting test data into Tours table
INSERT INTO Tours (name, price, destination_id) VALUES  
('Eiffel Tower Tour', 50.00, 1),  
('Statue of Liberty Tour', 75.00, 2),  
('Tokyo City Tour', 100.00, 3);

-- Inserting test data into Bookings table
INSERT INTO Bookings (user_id, tour_id) VALUES  
(1, 1),  
(2, 2),  
(3, 3);