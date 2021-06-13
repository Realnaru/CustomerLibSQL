USE customer_lib_Opishniak_R

GO

CREATE PROCEDURE [dbo].[customer_update]

@customer_id int,
@first_name nvarchar(50),
@last_name nvarchar(50),
@customer_phone_number varchar(15),
@customer_email nvarchar(100),
@total_purchase_amount money

AS

BEGIN

Update [dbo].customer SET 

first_name = @first_name,
last_name = @last_name,
customer_phone_number = @customer_phone_number,
customer_email = @customer_email,
total_purchase_amount = @total_purchase_amount
WHERE
customer_id = @customer_id

END

GO