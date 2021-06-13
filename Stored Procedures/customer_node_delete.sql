USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_note_delete]

  @note_id int

  AS

  BEGIN

  DELETE FROM [dbo].customer_note
  WHERE 
  note_id = @note_id
  
  END

  GO