USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_delete]

@customer_id int

AS

BEGIN

DELETE FROM [dbo].customer 
WHERE customer_id = @customer_id

END

GO