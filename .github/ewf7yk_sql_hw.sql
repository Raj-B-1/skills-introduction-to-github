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