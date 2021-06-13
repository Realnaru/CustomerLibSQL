USE CustomerLib_Opishniak_R

GO

--Correct data

--Customer table

--With all fields


INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'Doe', '7054756961', 'jd@mail.hg', 1000);

GO

--Without optional First Name

INSERT INTO [dbo].Customers (LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('Snow', '7054756961', 'jd@mail.hg', 1000);

GO

--Without optional phone number

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'Stark', 'jd@mail.hg', 1000);

GO

--Without optional email 

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, totalPurchaseAmount)
VALUES('John', 'Flowers', '7054756961', 1000);

GO



--Correct data

--Adress table

--With all fields

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1[dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Without optional address line 2

INSERT INTO [dbo].Addresses(AddressLine, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'Billing', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Notes

INSERT INTO [dbo].Notes (Note, CustomerID)
VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO



--Incorrect data

--Customer table

--First name is too long

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn', 
'Doe', '7054756961', 'jd@mail.hg', 1000);

GO

--Without Last name

INSERT INTO [dbo].Customers (FirstName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', '7054756961', 'jd@mail.hg', 1000);

GO

--Last Name is too long 

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'DoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoe', 
'7054756961', 'jd@mail.hg', 1000);

GO

--Wrong phone number format

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'Doe', '70547-56961', 'jd@mail.hg', 1000);

GO

--Wrong email format

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'Doe', '7054756961', 'jdmail.hg', 1000);

GO

--Wrong money type

INSERT INTO [dbo].Customers (FirstName, LastName, CustomerPhoneNumber, CustomerEmail, totalPurchaseAmount)
VALUES('John', 'Doe', '7054756961', 'jd@mail.hg', 'money');

GO



--Incorrect data 

--Address table

--CustomerId is wrong

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'LA', 'USA', 10);

GO

--Address line is empty

INSERT INTO [dbo].Addresses (AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street', 'House3', 'Billing', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Address line is too long

INSERT INTO [dbo].Addresses (AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('StreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreet', 
'House3', 'Billing', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Address line 2 is too long

INSERT INTO [dbo].Addresses (AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street', 'House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3', 
'Billing', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Address type with wrong option

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Selling', 'City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Without city 

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--City name is too long 

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3City3City3City3City3City3City3City3City3City3City3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Without postal code

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Postal code is too long

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438111111', 'LA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

---Without state

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--State name is too long

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'LALALALALALALALALALALALALALALALALALALALA', 'USA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Without country

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'LA',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--With wrong country

INSERT INTO [dbo].Addresses(AddressLine, AddressLine2, AddressType, City, PostalCode, [State], Country, CustomerID)
VALUES ('Street3', 'House3', 'Billing', 'City3', '123438', 'LA', 'Japan',
(SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO


--Incorrect data 

--Notes table

--Note is empty


INSERT INTO [dbo].Notes (CustomerID)
VALUES ((SELECT TOP 1 [dbo].Customers.CustomerID FROM [dbo].Customers WHERE [dbo].Customers.LastName = 'Doe'));

GO

--Incorrect CustomerId

INSERT INTO [dbo].Notes (Note, CustomerID)
VALUES ('Lorem ipsum sit ameth', 10);

GO