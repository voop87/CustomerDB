USE CustomerDB_Mansurov

GO

--Should create record in Customers


INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', '79086666666', 'exam@mail.ru', 1000);

GO

--Should create record in Customers without optional First Name

INSERT INTO Customers(LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Petrov', '79086666666', 'exam@mail.ru', 1000);

GO

--Should create record in Customers without optional phone number

INSERT INTO Customers(FirstName, LastName, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', 'exam@mail.ru', 1000);

GO

--Should create record in Customers without optional email 

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', '79086666666', 1000);

GO



--Should create record in Addresses

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 1', 'House 1', 'Billing', 'Los Angeles', '132123', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should create record in Addresses without optional address line 2

INSERT INTO Addresses(AddressLine, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 1', 'Billing', 'Los Angeles', '132131', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should create record in Notes

INSERT INTO Notes(Note, CustomerId)
VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO



--Should not create record when FirstName is too long

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vascafccafjekjwfekjwfhkjewhfjkewhfkjhwekjfhkejwhfkjewhfkjhwkjfhwkjfhkjwehfkjhkjhfewkjhwekjfhkjwehf', 
'Petrov', '79086666666', 'exam@mail.ru', 1000);

GO

--Should not create record without Last name

INSERT INTO Customers(FirstName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', '79086666666', 'exam@mail.ru', 1000);

GO

--Should not create record when LastName is too long

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'AFlkesjfelkfwjklfjwlekflkewjflekwjflkwejfklwejfljewlkfjlkwefnlkewnflkwnklfnlwkenflkbflwkebflkwebklfblwkebflkfb', 
'79086666666', 'exam@mail.ru', 1000);

GO

--Should not create record when wrong phone number format

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', '70-5--96961', 'exam@mail.ru', 1000);

GO

--Should not create record when wrong email format

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', '79086666666', 'e@xam@mawadwdad', 1000);

GO

--Should not create record when wrong money type

INSERT INTO Customers(FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
VALUES('Vasya', 'Petrov', '79086666666', 'exam@mail.ru', 'waddawd');

GO



--Should not create record when CustomerId is wrong

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House ', 'Billing', 'Los Angeles', '123132', 'LA', 'USA', 10);

GO

--Should not create record when Address line is empty

INSERT INTO Addresses(AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('House 3', 'Billing', 'Los Angeles', '123132', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when Address line is too long

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('StreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreet', 
'House 3', 'Billing', 'Los Angeles', '123132', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when Address line 2 is too long

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street', 'House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3', 
'Billing', 'Los Angeles', '123132', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when Address type with wrong option

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Selling', 'Los Angeles', '123132', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record without city 

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', '123132', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when city name is too long 

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'city3city3city3city3city3city3city3city3city3city3city3', '123438', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record without postal code

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'Los Angeles', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when Postal code is too long

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'Los Angeles', '1321584464646546', 'LA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

---Should not create record without state

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'Los Angeles', '123123', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record State name is too long

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House3 ', 'Billing', 'Los Angeles', '123123', 'LALALALALALALALALALALALALALALALALALALALA', 'USA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record without country

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'Los Angeles', '123438', 'LA',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record with wrong country

INSERT INTO Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
VALUES ('Street 3', 'House 3', 'Billing', 'Los Angeles', '123438', 'LA', 'Germany',
(SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO


--Should not create record when Note is empty


INSERT INTO Notes(CustomerId)
VALUES ((SELECT TOP 1 Customers.CustomerId FROM Customers WHERE Customers.LastName = 'Petrov'));

GO

--Should not create record when incorrect CustomerId

INSERT INTO Notes(Note, CustomerId)
VALUES ('SAWDkwjdhdkjwhakdjhkjjashcndkjdw', 10);

GO