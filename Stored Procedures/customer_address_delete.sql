USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_address_delete]

@address_id int

AS

BEGIN

DELETE FROM [dbo].customer_address

WHERE 

address_id = @address_id

END

GO