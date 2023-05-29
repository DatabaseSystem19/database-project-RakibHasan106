drop table inventory;
drop table orderDetails;
drop table ordertable;
drop table customers;
drop table books;
drop table publisher;
create table publisher(
	publisher_id number(10),
	publisher_name varchar(40),
	primary key(publisher_id)
);
create table books(
	b_id number(10),
	title varchar(40),
	author varchar(40),
	publisher_id number(10),
	publicationDate date,
	isbn number(13),
	price number(6),
	genre varchar(40),
	primary key(b_id),
	foreign key(publisher_id) references publisher(publisher_id)
);
create table customers(
	customer_id number(10),
	firstname varchar(40),
	lastname varchar(20),
	email varchar(40),
	address varchar(50),
	city varchar(10),
	zipcode number(5),
	phone varchar(11),
	primary key(customer_id)
);
create table ordertable(
	order_id number(10),
	customer_id number(10),
	orderDate date,
	orderTotal number(6),
	status varchar(10),
	primary key(order_id),
	foreign key(customer_id) references customers(customer_id)
	on delete cascade
);

create table orderDetails(
	order_id number(10),
	b_id number(10),
	book_name varchar(40),
	quantity number(3),
	price number(10),
	foreign key(b_id) references books(b_id),
	foreign key(order_id) references ordertable(order_id)
	on delete cascade
);

create table inventory(
	b_id number(10),
	quantity number(4),
	primary key(b_id),
	foreign key(b_id) references books(b_id)
	on delete cascade
);
