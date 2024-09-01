CREATE TABLE walmart(
    invoice_id varchar(30) PRIMARY KEY,
	branch varchar(15) NOT NULL,
	city varchar(20) NOT NULL,
	costumer_type varchar(30) NOT NULL,
	gender varchar (10) NOT NULL,
	product_line varchar(30) NOT NULL,
	unit_price decimal(10,2) NOT NULL,
	quantit int NOT NULL,
	vat float NOT NULL,
	total decimal(10,2) NOT NULL,
	date DATE NOT NULL,
	time TIMESTAMP NOT NULL,
	payment_method varchar(30) NOT NULL,
	cogs decimal(10,2) NOT NULL,
	gross_margin_percentage	FLOAT ,
	gross_income float,
	retting float
);
ALTER TABLE walmart
ALTER column vat TYPE decimal(10,2); 
select * from walmart

