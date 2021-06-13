USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_note_insert]

@customer_id int,
@note nvarchar(255)

AS

BEGIN 

INSERT INTO [dbo].customer_note

(customer_id,
 note)

 VALUES 

 (@customer_id,
  @note)

  END

  GO