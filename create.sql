CREATE DATABASE customer_lib_Opishniak_R

GO

USE customer_lib_Opishniak_R

GO

CREATE TABLE [dbo].customer (
customer_id int IDENTITY(1,1) NOT NULL CONSTRAINT pk_cutomer_id PRIMARY KEY,
first_name nvarchar(50) NULL CHECK (LEN(first_name) <= 50),
last_name nvarchar(50) NOT NULL CHECK (LEN(last_name) <= 50),
customer_phoneNumber varchar(15) NULL CONSTRAINT ck_customer_phoneNumber 
	CHECK(LEN(customer_phoneNumber) <= 15 AND customer_phoneNumber NOT LIKE '%[^0-9]%'),
customer_email nvarchar(100) NULL CONSTRAINT ck_customer_email CHECK(customer_email LIKE '%_@__%.__%'),
total_purchase_amount money NULL
);

GO

CREATE TABLE [dbo].customer_address (
address_id int IDENTITY(1,1) NOT NULL CONSTRAINT pk_address_id PRIMARY KEY,
customer_id int NOT NULL CONSTRAINT fk_customer_id FOREIGN KEY 
	REFERENCES [dbo].customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
address_line nvarchar(100) NOT NULL CHECK(LEN(address_line) <= 100),
address_line2 nvarchar(100) NULL CHECK(LEN(address_line2) <= 100),
address_type varchar(8) NOT NULL CHECK(address_type IN ('Shipping', 'Billing')),
city nvarchar(50) NOT NULL CHECK(LEN(city) <= 50),
postal_code varchar(6) NOT NULL CHECK(LEN(postal_code) <= 6),
[state] nvarchar(20) NOT NULL CHECK(LEN([state]) < 20),
country nvarchar(255) NOT NULL CHECK(country IN ('USA', 'Canada'))
);

GO

CREATE TABLE [dbo].customer_note (
note_id int IDENTITY(1,1) NOT NULL CONSTRAINT pk_note PRIMARY KEY,
customer_id int NOT NULL CONSTRAINT fk_note_customer_id 
	FOREIGN KEY REFERENCES [dbo].customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
note nvarchar(255) NOT NULL CHECK (LEN(note) <= 255)
);

GO