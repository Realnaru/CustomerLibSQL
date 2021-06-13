USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_note_select]

@note_id int

AS

BEGIN

SELECT * FROM [dbo].[customer_note]
WHERE 
note_id = @note_id

END

GO