-- 1. List All Countries In South America
SELECT Name FROM country WHERE Continent = 'South America';
-- 2. Find the population of Germany
SELECT SUM(Population) FROM country WHERE Name = 'Germany';
-- 3. Retrieve all cities in the country 'Japan'
SELECT Name FROM city WHERE CountryCode = 'JPN';
-- 4. Find the 3 most populated countries in the 'Africa' region
SELECT Name, Population FROM country WHERE Region = 'Central Africa'  ORDER BY Population DESC LIMIT 3;
-- 5. Retrieve the country and its life expectancy where the population is between 1 and 5 million.
SELECT Name, LifeExpectancy FROM country WHERE Population > 1000000 AND Population < 5000000;
-- 6. List countries with an official language of 'French'.
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';
-- 7. Retrieve all album titles by the artist 'AC/DC'.
SELECT Title FROM Album WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Name = 'AC/DC');
-- 8. Find the name and email of customers located in 'Brazil'.
SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil';
-- 9. List all playlist in the database
SELECT DISTINCT Name FROM Playlist;
-- 10. Find the total number of tracks in the 'Rock' genre.
SELECT Genre.Name, COUNT(PlaylistTrack.TrackId) AS RockTrackCount
FROM Genre
JOIN PlaylistTrack ON Genre.GenreId = PlaylistTrack.PlaylistId
WHERE Genre.Name = 'Rock'
GROUP BY Genre.Name;
-- 11. List all employees who report to 'Nancy Edwards'.
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');
-- 12. Calculate the total sales per customer by summing the total amount in invoices.
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName
ORDER BY TotalSales DESC;
--Part 2
--1. Design Your Database
--2. Create the Tables
CREATE TABLE Parks (
    ParkId INT PRIMARY KEY,
    ParkName TEXT,
    Location TEXT,
    OpeningDate DATE,
    SizeAcres INT
);
CREATE TABLE Tickets (
    VisitorId INT PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT,
    PhoneNumber BIGINT
);
CREATE TABLE Tickets (
    TicketId INT PRIMARY KEY,
    FOREIGN KEY (VisitorId) REFERENCES Visitors(VisitorId),
    FOREIGN KEY (ParkId) REFERENCES Parks(ParkId),
    Price INT
);
--3. Insert Data
INSERT INTO Parks (ParkId, ParkName, Location, OpeningDate, SizeAcres)
VALUES 
(1, 'Disneyland', 'Anaheim, CA', '1955-07-17', 500),
(2, 'Walt Disney World', 'Orlando, FL', '1971-10-01', 27520),
(3, 'Tokyo Disneyland', 'Urayasu, Chiba, Japan', '1983-04-15', 115),
(4, 'Disneyland Paris', 'Marne-la-Vallée, France', '1992-04-12', 5200),
(5, 'Hong Kong Disneyland', 'Lantau Island, Hong Kong', '2005-09-12', 310);

INSERT INTO Visitors (VisitorId, FirstName, LastName, Email, PhoneNumber)
VALUES 
(1, 'Thomas', 'Smith', 'thomassmith@gmail.com', 9087981928),
(2, 'Mickey', 'Jones', 'mickeyjones@gmail.com', 7898901928),
(3, 'Minnie', 'Jones', 'minniejones@gmail.com', 4567891933),
(4, 'George', 'Jones', 'georgejackson@gmail.com', 6789081932),
(5, 'Ronald', 'Joe', 'ronaldjoe@gmail.com', 7893451934);

INSERT INTO Tickets (TicketId, VisitorId, ParkId, Price)
VALUES 
(1, 1, 1, 160),
(2, 2, 3, 55),
(3, 3, 5, 13),
(4, 4, 2, 154),
(5, 5, 4, 98);

--4. Write Queries
SELECT ParkName, Location FROM Parks
SELECT FirstName, LastName FROM Visitors
JOIN Tickets ON Visitors.VisitorId = Tickets.VisitorId;
SELECT Tickets.TicketId, Visitors.FirstName, Visitors.LastName, Tickets.Price
FROM Tickets
JOIN Visitors ON Tickets.VisitorId = Visitors.VisitorId;