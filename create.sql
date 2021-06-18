CREATE DATABASE CustomerDB_Mansurov;

GO

USE CustomerDB_Mansurov;

CREATE TABLE Customers
(
	CustomerId INT Primary Key IDENTITY NOT Null,
	FirstName NVARCHAR(50) Null CHECK (LEN(FirstName) <= 50),
	LastName NVARCHAR(50) NOT Null CHECK (LEN(LastName) <= 50 AND LastName != ''),
	CustomerPhoneNumber NVARCHAR(15) Null CHECK(LEN(CustomerPhoneNumber) <= 15 AND CustomerPhoneNumber NOT LIKE '%[^0-9]%'),
	CustomerEmail NVARCHAR(50) Null CHECK(CustomerEmail LIKE '%_@__%.__%'),
	TotalPurchaseAmount MONEY Null
);

GO

CREATE TABLE Addresses (
AddressId INT IDENTITY NOT Null Primary Key,
CustomerId INT NOT Null Foreign Key 
	REFERENCES Customers (CustomerId) ON DELETE CASCADE ON UPDATE CASCADE,
AddressLine NVARCHAR(100) NOT Null CHECK(LEN(AddressLine) <= 100 AND AddressLine != ''),
AddressLine2 NVARCHAR(100) Null CHECK(LEN(AddressLine2) <= 100),
AddressType NVARCHAR(8) NOT Null CHECK(AddressType IN ('Shipping', 'Billing')),
City NVARCHAR(50) NOT Null CHECK(LEN(city) <= 50 AND City != ''),
PostalCode NVARCHAR(6) NOT Null CHECK(LEN(PostalCode) <= 6 AND PostalCode != ''),
[state] NVARCHAR(20) NOT Null CHECK(LEN([state]) < 20 AND [state] != ''),
Country NVARCHAR(30) NOT Null CHECK(Country IN ('USA', 'Canada'))
);

GO

CREATE TABLE Notes (
NoteId INT IDENTITY NOT Null Primary Key,
CustomerId INT NOT Null Foreign Key REFERENCES Customers (CustomerId) ON DELETE CASCADE ON UPDATE CASCADE,
Note NVARCHAR(255) NOT Null CHECK (LEN(note) <= 255 AND Note != '')
);