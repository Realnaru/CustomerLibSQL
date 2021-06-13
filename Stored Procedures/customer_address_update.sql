CREATE PROCEDURE [dbo].[customer_address_update]

@address_id int,
@address_line nvarchar(100),
@address_line2 nvarchar(100),
@address_type varchar(8),
@city nvarchar(50) ,
@postal_code varchar(6),
@state nvarchar(20),
@country nvarchar(255)

AS

BEGIN

Update [dbo].customer_address SET 

address_line = @address_line,
address_line2 = @address_line2,
address_type = @address_type,
city = @city,
postal_code = @postal_code,
[state] = @state,
country = @country

WHERE
address_id = @address_id

END

GO