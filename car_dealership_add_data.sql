-- Stored function to add customers
create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone VARCHAR, _address VARCHAR, _billing_info VARCHAR)
returns VOID
as $MAIN$
begin
	insert into customer(customer_id, first_name, last_name, phone, address, billing_info)
	values (_customer_id, _first_name, _last_name, _phone, _address, _billing_info);
end;
$MAIN$
language plpgsql;

-- Add customers
select add_customer(1, 'John', 'Doe', '555-555-5555', '123 Main St., Boston, MA, 88888', '4747-4747-4747-4747 999 05/28 03567');
select add_customer(2, 'Jane', 'Deer', '444-444-4444', '456 N West St, New York, NY 00123', '1111-2222-3333-4444 123 01/28 00123');
select add_customer(3, 'Austin', 'Smith', '333-333-3333', '9982 Eucalyptus Road, Seatte, WA, 98345', '5555-6666-7777-8888 999 02/29 98345');
select add_customer(4, 'Jasmine', 'Ingot', '222-222-2222', '38934 W Oak Rd, Sacramento, CA 88493', '9999-1111-2222-3333 03/30 88493');

-- Stored function to add salespeople
create or replace function add_salesperson(_sales_person_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns VOID
as $MAIN$
begin
	insert into salesperson(sales_person_id, first_name, last_name)
	values (_sales_person_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

-- Add salespeople
select add_salesperson(1001, 'Fulton', 'Alton');
select add_salesperson(1002, 'Melville', 'Emmeline');
select add_salesperson(1003, 'Whitney', 'Devereux');
select add_salesperson(1004, 'Teddy', 'Rowen');

-- Stored function to add cars
create or replace function add_car(_car_id INTEGER, _year_made INTEGER, _make VARCHAR, _model VARCHAR, _mileage INTEGER, _customer_id INTEGER, _sales_person_id INTEGER)
returns VOID
as $MAIN$
begin
	insert into car(car_id, year_made, make, model, mileage, customer_id, sales_person_id)
	values (_car_id, _year_made, _make, _model, _mileage, _customer_id, _sales_person_id);
end;
$MAIN$
language plpgsql;

-- Add Cars
select add_car(001, 2002, 'Ducati', '998S', 301, NULL, NULL);
select add_car(002, 2009, 'Lotus', 'Exige', 45232, 1, 1003);
select add_car(003, 2012, 'Toyota', 'Matrix', 121934, 2, NULL);
select add_car(004, 2014, 'Tesla', 'Model S', 22512, 1, 1001);
select add_car(005, 2008, 'Subaru', 'Outback', 65331, 4, 1001);
select add_car(006, 2023, 'Chevrolet', 'C3500', 1043, NULL, NULL);
select add_car(007, 2015, 'Toyota', 'Land Cruiser', 87002, 3, 1002);
select add_car(008, 2013, 'Kia', 'Optima', 157498, 4, NULL);

-- Add Sales Invoices 
insert into sales_invoice(invoice_num, sales_date, payment, sales_person_id, customer_id, car_id)
VALUES(5001, DATE '2015-08-12', 65608.78, 1002, 3, 007);

insert into sales_invoice(invoice_num, sales_date, payment, sales_person_id, customer_id, car_id)
VALUES(5002, DATE '2016-02-28', 28552.97, 1001, 4, 005);

insert into sales_invoice(invoice_num, sales_date, payment, sales_person_id, customer_id, car_id)
VALUES(5003, DATE '2016-06-01', 87200.23, 1003, 1, 002);

insert into sales_invoice(invoice_num, sales_date, payment, sales_person_id, customer_id, car_id)
VALUES(5004, DATE '2017-12-11', 103678.52, 1001, 1, 004);

-- Stored function to add mechanics
create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns VOID
as $MAIN$
begin
	insert into mechanic(mechanic_id, first_name, last_name)
	values (_mechanic_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

-- Add mechanics
select add_mechanic(1, 'Nikolas', 'Fred');
select add_mechanic(2, 'Noelle', 'Noel');
select add_mechanic(3, 'Lawrie', 'Rosalee');
select add_mechanic(4, 'Bradley', 'Luanne');
select add_mechanic(5, 'Farrell', 'Layla');

-- Stored function to add parts	
create or replace function add_parts(_part_id INTEGER, _part_name VARCHAR, _part_cost NUMERIC, _available_inventory INTEGER)
returns VOID
as $MAIN$
begin
	insert into parts_inventory(part_id, part_name, part_cost, available_inventory)
	values (_part_id, _part_name, _part_cost, _available_inventory);
end;
$MAIN$
language plpgsql;

-- Add parts
select add_parts(10001, 'AC Compressor', 475.23, 3);
select add_parts(10002, 'Brake Rotor', 289.04, 12);
select add_parts(10003, 'Camshaft', 176.34, 7);
select add_parts(10004, 'Wiper Blades', 28.99, 25);

-- Stored function to add maintenance recrods	
create or replace function add_maintenance_records(_maintenance_record INTEGER, _car_id INTEGER, _customer_id INTEGER)
returns VOID
as $MAIN$
begin
	insert into maintenance_records(maintenance_record, car_id, customer_id)
	values (_maintenance_record, _car_id, _customer_id);
end;
$MAIN$
language plpgsql;

-- Add Maintenance Records
select add_maintenance_records(9001, 001, NULL);
select add_maintenance_records(9002, 002, 1);
select add_maintenance_records(9003, 003, 2);
select add_maintenance_records(9004, 004, 1);
select add_maintenance_records(9005, 005, 4);
select add_maintenance_records(9006, 006, NULL);
select add_maintenance_records(9007, 007, 3);
select add_maintenance_records(9008, 008, NULL);

-- Stored function to add Service Tickets
create or replace function add_service_tickets(
	_service_ticket_id INTEGER,
	_service_date DATE,
	_work_performed VARCHAR,
	_amount_due numeric,
	_customer_id INTEGER,
	_car_id INTEGER,
	_mechanic_id INTEGER,
	_part_id INTEGER,
	_maintenance_record INTEGER
	)
returns VOID
as $MAIN$
begin
	insert into service_ticket(
	service_ticket_id,
	service_date,
	work_performed,
	amount_due,
	customer_id,
	car_id,
	mechanic_id,
	part_id,
	maintenance_record
	)
	values (
	_service_ticket_id,
	_service_date,
	_work_performed,
	_amount_due,
	_customer_id,
	_car_id,
	_mechanic_id,
	_part_id,
	_maintenance_record
	);
end;
$MAIN$
language plpgsql;

-- Add Service Tickets
select add_service_tickets(8001, DATE '2013-09-12', 'Oil change', 67.23, 4, 8, 1, null, 9008);
select add_service_tickets(8002, DATE '2015-03-23', 'Brake Service', 350.45, 2, 3, 2, 10002, 9003);
select add_service_tickets(8003, DATE '2016-04-04', 'Engine Gasket Servicing', 892.54, 4, 5, 3, null, 9005);
