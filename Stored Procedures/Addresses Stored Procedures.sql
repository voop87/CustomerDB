USE CustomerDB_Mansurov
GO

CREATE PROCEDURE [dbo].[Addresses_Insert]
	@AddressLine NVARCHAR(100),
	@AddressLine2 NVARCHAR(100),
	@AddressType NVARCHAR(8),
	@City NVARCHAR(50),
	@PostalCode NVARCHAR(6),
	@state NVARCHAR(20),
	@Country NVARCHAR(30)
AS
BEGIN
	INSERT INTO [Addresses] (AddressLine, AddressLine2, AddressType, City, PostalCode, [state], Country, CustomerId)
	VALUES (@AddressLine, @AddressLine2, @AddressType, @City, @PostalCode, @state, @Country,
	(SELECT TOP 1 Customers.CustomerId FROM Customers))
END
GO


CREATE PROCEDURE [dbo].[Addresses_Select]
	@City NVARCHAR(50)
AS
BEGIN
	SELECT * FROM [Addresses]
	WHERE City = @City
END
GO


CREATE PROCEDURE [dbo].[Addresses_Update]
	@Country NVARCHAR(30),
	@state NVARCHAR(20)
AS
BEGIN
	UPDATE [Addresses] SET Country = @Country
	WHERE [state] = @state
END
GO


CREATE PROCEDURE [dbo].[Adresses_Delete]
	@AddressId int
AS
BEGIN
	DELETE FROM [Addresses]
	WHERE AddressId = @AddressId
END
GO


EXECUTE [dbo].Addresses_Insert 
	@AddressLine='Street 1',
	@AddressLine2='House 1',
	@AddressType='Billing',
	@City='Los Angeles',
	@PostalCode='132123',
	@state='LA',
	@Country='Canada'
GO

EXECUTE [dbo].Addresses_Select @City='Los Angeles'
GO

EXECUTE [dbo].Adresses_Delete @AddressId=4
GO

EXECUTE [dbo].Addresses_Update @Country='USA', @state='LA'
GO