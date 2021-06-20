USE CustomerDB_Mansurov
GO

CREATE PROCEDURE [dbo].[Customers_Insert]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@CustomerPhoneNumber nvarchar(15),
	@CustomerEmail nvarchar(50),
	@TotalPurchaseAmount money
AS
BEGIN
	INSERT INTO [Customers] (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, TotalPurchaseAmount)
	VALUES (@FirstName, @LastName, @CustomerPhoneNumber, @CustomerEmail, @TotalPurchaseAmount)
END
GO


CREATE PROCEDURE [dbo].[Customers_Select]
	@LastName nvarchar(50)
AS
BEGIN
	SELECT * FROM [Customers]
	WHERE LastName = @LastName
END
GO


CREATE PROCEDURE [dbo].[Customers_Update]
	@LastName nvarchar(50),
	@CustomerEmail nvarchar(50)
AS
BEGIN
	UPDATE [Customers] SET CustomerEmail = @CustomerEmail
	WHERE LastName = @LastName
END
GO


CREATE PROCEDURE [dbo].[Customers_Delete]
	@CustomerId int
AS
BEGIN
	DELETE FROM [Customers]
	WHERE CustomerId = @CustomerId
END
GO


EXECUTE [dbo].Customers_Insert 
	@FirstName='Petya',
	@LastName='Rogov',
	@CustomerPhoneNumber='794400111',
	@CustomerEmail='exam@awdawdwad.ru',
	@TotalPurchaseAmount = 1000
GO

EXECUTE [dbo].Customers_Update @LastName='Rogov', @CustomerEmail='rogov@mail.ru'
GO

EXECUTE [dbo].Customers_Delete @CustomerId=2
GO

EXECUTE [dbo].Customers_Select @LastName='Rogov'
GO