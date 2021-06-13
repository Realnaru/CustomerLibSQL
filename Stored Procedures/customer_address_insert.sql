CREATE PROCEDURE [dbo].[customer_address_insert]

@customer_id int,
@address_line nvarchar(100),
@address_line2 nvarchar(100),
@address_type varchar(8),
@city nvarchar(50) ,
@postal_code varchar(6),
@state nvarchar(20),
@country nvarchar(255)

AS

BEGIN

INSERT INTO [dbo].customer_address
(address_line,
 address_line2,
 address_type,
 city,
 postal_code,
 [state],
 country,
 customer_id
 )

 VALUES 
(@address_line,
 @address_line2,
 @address_type,
 @city,
 @postal_code,
 @state,
 @country,
 @customer_id)

 END

 GO