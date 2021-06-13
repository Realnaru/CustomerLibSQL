USE customer_lib_Opishniak_R

GO

USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_select]

@customer_id int

AS

BEGIN

SELECT * FROM [dbo].customer
WHERE customer_id = @customer_id

END

GO