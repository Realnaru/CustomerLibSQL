CREATE PROCEDURE [dbo].[customer_address_select]

@address_id int

AS

BEGIN

SELECT * FROM [dbo].customer_address
WHERE address_id = @address_id

END

GO