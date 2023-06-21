create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(100)
);

create table salesperson(
	sales_person_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

create table car(
	car_id SERIAL primary key,
	year_made INTEGER,
	make VARCHAR(100),
	model VARCHAR(100),
	mileage INTEGER,
	customer_id INTEGER,
	sales_person_id INTEGER,
	foreign key(customer_id) references customer(customer_id),
	foreign key(sales_person_id) references salesperson(sales_person_id)
);

create table sales_invoice(
	invoice_num SERIAL primary key,
	sales_date DATE,
	payment numeric (8,2),
	sales_person_id INTEGER,
	customer_id INTEGER,
	car_id INTEGER,
	foreign key(customer_id) references customer(customer_id),
	foreign key(sales_person_id) references salesperson(sales_person_id),
	foreign key(car_id) references car(car_id)
);

create table parts_inventory(
	part_id SERIAL primary key,
	part_name VARCHAR(100),
	part_cost numeric(6,2),
	available_inventory INTEGER
);

create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

create table maintenance_records(
	maintenance_record SERIAL primary key,
	car_id INTEGER,
	customer_id INTEGER,
	foreign key(car_id) references car(car_id),
	foreign key(customer_id) references customer(customer_id)
);

create table service_ticket(
	service_ticket_id SERIAL primary key,
	service_date DATE,
	work_performed VARCHAR(100),
	amount_due NUMERIC(8,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id),
	car_id INTEGER,
	foreign key(car_id) references car(car_id),
	mechanic_id INTEGER,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	part_id INTEGER,
	foreign key(part_id) references parts_inventory(part_id),
	maintenance_record INTEGER,
	foreign key(maintenance_record)references maintenance_records(maintenance_record)
);



