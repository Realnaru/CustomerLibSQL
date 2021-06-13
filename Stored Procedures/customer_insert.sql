CREATE PROCEDURE [dbo].[customer_insert] 

@first_name nvarchar(50),
@last_name nvarchar(50),
@customer_phone_number varchar(15),
@customer_email nvarchar(100),
@total_purchase_amount money

AS

BEGIN

INSERT INTO [dbo].customer 

(first_name, 
last_name, 
customer_phone_number, 
customer_email, 
total_purchase_amount)

VALUES

(@first_name, 
@last_name, 
@customer_phone_number,
@customer_email, 
@total_purchase_amount)

END

GO