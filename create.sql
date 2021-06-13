CREATE DATABASE CustomerLib_Opishniak_R

GO

USE CustomerLib_Opishniak_R

GO

CREATE TABLE [dbo].Customers (
CustomerID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_CutomerID PRIMARY KEY,
FirstName nvarchar(50) NULL CHECK (LEN(FirstName) <= 50),
LastName nvarchar(50) NOT NULL CHECK (LEN(LastName) <= 50),
CustomerPhoneNumber varchar(15) NULL CONSTRAINT CK_CustomerPhoneNumber 
	CHECK(LEN(CustomerPhoneNumber) <= 15 AND CustomerPhoneNumber NOT LIKE '%[^0-9]%'),
CustomerEmail nvarchar(100) NULL CONSTRAINT CK_CustomerEmail CHECK(CustomerEmail LIKE '%_@__%.__%'),
totalPurchaseAmount money NULL
);

GO

CREATE TABLE [dbo].Addresses (
AddressID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_AddressID PRIMARY KEY,
CustomerID int NOT NULL CONSTRAINT FK_Addresses_CustomerID FOREIGN KEY 
	REFERENCES [dbo].Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
AddressLine nvarchar(100) NOT NULL CHECK(LEN(AddressLine) <= 100),
AddressLine2 nvarchar(100) NULL CHECK(LEN(AddressLine2) <= 100),
AddressType varchar(8) NOT NULL CHECK(AddressType IN ('Shipping', 'Billing')),
City nvarchar(50) NOT NULL CHECK(LEN(City) <= 50),
PostalCode varchar(6) NOT NULL CHECK(LEN(PostalCode) <= 6),
[State] nvarchar(20) NOT NULL CHECK(LEN([State]) < 20),
Country nvarchar(255) NOT NULL CHECK(Country IN ('USA', 'Canada'))
);

GO

CREATE TABLE [dbo].Notes (
NoteID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Notes PRIMARY KEY,
CustomerID int NOT NULL CONSTRAINT FK_Notes_CustomerID 
	FOREIGN KEY REFERENCES [dbo].Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
Note nvarchar(255) NOT NULL CHECK (LEN(Note) <= 255)
);

GO