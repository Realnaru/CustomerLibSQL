CREATE PROCEDURE [dbo].[customer_note_update]

  @note_id int,
  @note nvarchar(255)

  AS

  BEGIN 

  UPDATE [dbo].[customer_note] SET
  note = @note
  WHERE
  note_id = @note_id

  END

  GO