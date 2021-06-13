USE customer_lib_Opishniak_R

GO

--Correct data

--Customer table

--With all fields


INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', 'Doe', '7054756961', 'jd@mail.hg', 1000);

GO

--Without optional First Name

INSERT INTO [dbo].customer (last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('Snow', '7054756961', 'jd@mail.hg', 1000);

GO

--Without optional phone number

INSERT INTO [dbo].customer (first_name, last_name, customer_email, total_purchase_amount)
VALUES('John', 'Stark', 'jd@mail.hg', 1000);

GO

--Without optional email 

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, total_purchase_amount)
VALUES('John', 'Flowers', '7054756961', 1000);

GO



--Correct data

--Adress table

--With all fields

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1[dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Without optional address line 2

INSERT INTO [dbo].customer_address(address_line, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'Billing', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--customer_note

INSERT INTO [dbo].customer_note (Note, customer_id)
VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO



--Incorrect data

--Customer table

--First name is too long

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn', 
'Doe', '7054756961', 'jd@mail.hg', 1000);

GO

--Without Last name

INSERT INTO [dbo].customer (first_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', '7054756961', 'jd@mail.hg', 1000);

GO

--Last Name is too long 

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', 'DoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoeDoe', 
'7054756961', 'jd@mail.hg', 1000);

GO

--Wrong phone number format

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', 'Doe', '70547-56961', 'jd@mail.hg', 1000);

GO

--Wrong email format

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', 'Doe', '7054756961', 'jdmail.hg', 1000);

GO

--Wrong money type

INSERT INTO [dbo].customer (first_name, last_name, customer_phone_number, customer_email, total_purchase_amount)
VALUES('John', 'Doe', '7054756961', 'jd@mail.hg', 'money');

GO



--Incorrect data 

--Address table

--CustomerId is wrong

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'LA', 'USA', 10);

GO

--Address line is empty

INSERT INTO [dbo].customer_address (address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('House3', 'Billing', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Address line is too long

INSERT INTO [dbo].customer_address (address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('StreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreetStreet', 
'House3', 'Billing', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Address line 2 is too long

INSERT INTO [dbo].customer_address (address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street', 'House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3House3', 
'Billing', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Address type with wrong option

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Selling', 'city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Without city 

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--city name is too long 

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3city3city3city3city3city3city3city3city3city3city3', '123438', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Without postal code

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Postal code is too long

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438111111', 'LA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

---Without state

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--State name is too long

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'LALALALALALALALALALALALALALALALALALALALA', 'USA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Without country

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'LA',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--With wrong country

INSERT INTO [dbo].customer_address(address_line, address_line2, address_type, city, postal_code, [state], country, customer_id)
VALUES ('Street3', 'House3', 'Billing', 'city3', '123438', 'LA', 'Japan',
(SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO


--Incorrect data 

--customer_note table

--Note is empty


INSERT INTO [dbo].customer_note (customer_id)
VALUES ((SELECT TOP 1 [dbo].customer.customer_id FROM [dbo].customer WHERE [dbo].customer.last_name = 'Doe'));

GO

--Incorrect CustomerId

INSERT INTO [dbo].customer_note (note, customer_id)
VALUES ('Lorem ipsum sit ameth', 10);

GO