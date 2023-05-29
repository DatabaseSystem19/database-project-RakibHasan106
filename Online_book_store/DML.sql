
_ _ insert into publishers

insert into publisher values(1,'Penguin Random House');
insert into publisher values(2,'Harper Perennial Modern Classics');
insert into publisher values(3,'Simon and Schuster');
insert into publisher values(4,'Macmillan');
insert into publisher values(5,'Pearson');
insert into publisher values(6,'Relx');
insert into publisher values(7,'Thompson Reuters');
insert into publisher values(8,'Hachette Livre');
insert into publisher values(9,'Bertelsman');
insert into publisher values(10,'Scholastic Corporation');

_ _ insert into books table

insert into books values(1,'All the Light We Cannot See','Anthony Doerr',1,date'2014-05-06',9781476746586,540,'Historical Fiction');
insert into books values(2,'To Kill a Mocking Bird','Harper Lee',2,date'1960-01-01',9781476746579,300,'Classics');
insert into books values(3,'Inferno','Dan Brown',3,date'2013-05-14',9780385538176,463,'Thriller');
insert into books values(4,'Home Deus','Yuval Noah Harari',4,date'2017-02-21',9780385537560,450,'Nonfiction');
insert into books values(5,'Sapiens','Yuval Noah Harari',5,date'2018-03-27',9780385537550,400,'Nonfiction');
insert into books values(6,'joyland','Stephen King',6,date'2017-02-21',9780385537780,320,'Horror');
insert into books values(7,'Outliers','Malcolm Gladwell',7,date'2017-02-21',9780385537080,160,'Nonfiction');
insert into books values(8,'A Monster Calls','Patrick Ness',8,date'2017-02-21',9780385537120,220,'Drama');
insert into books values(9,'The Kite Runner','Khaled Hosseini',9,date'2017-02-21',9780385537270,870,'Drama');
insert into books values(10,'Anastasia Krupnik','Lois Lowry',10,date'2017-02-21',9780385537980,765,'Juvenile');


_ _ insert into customers table

insert into customers values(1,'Rakibul hasan','Adnan','adnan@gmail.com','1/4 red kite tower mirpur','Dhaka',1216,'01834137729');
insert into customers values(2,'Abidul Islam','Rony','rony@gmail.com','56 college road','Kustia',9745,'01956252815');
insert into customers values(3,'Gausul Azam','Goni','goni@gmail.com','1/2 stadium road','khulna',2345,'01945472819');
insert into customers values(4,'Faizul hasan','Zibon','zibon12@gmail.com','5/4 Sordarbarimor chistia','Sylhet',6785,'01678923540');
insert into customers values(5,'Obaidul Hasan','Obayed','obayed@gmail.com','3/4 station road','Norail',5698,'01609923540');
insert into customers values(6,'Mosharrof Sanowar','Borkot','sanowar@gmail.com','5 Dakbari mor','Khulna',6666,'01978923540');
insert into customers values(7,'Murad Kalam','Zibon','murad@gmail.com','37 Hajee Bridge','Chittagong',1213,'01678013540');
insert into customers values(8,'Meem Moriom','tinni','tinni@gmail.com','49 Korimuddin bypass','Dhaka',5905,'01678983540');
insert into customers values(9,'Mukta Marzia','bonna','bonna@gmail.com','79 borkot gooli','Mymensingh',1264,'01778923540');
insert into customers values(10,'provat hasan','Anik','anik@gmail.com','67 kamal sorok','Gopalgonj',3135,'01978923541');

_ _ insert into ordertable Table

insert into ordertable values(1,1,date'2022-04-23',840,'delivered');
insert into ordertable values(2,2,date'2022-05-03',463,'delivered');
insert into ordertable values(3,2,date'2022-07-12',450,'pending');
insert into ordertable values(4,10,date'2022-07-12',400,'delivered');
insert into ordertable values(5,6,date'2022-07-19',320,'pending');
insert into ordertable values(6,9,date'2022-07-12',540,'delivered');
insert into ordertable values(7,3,date'2022-08-23',320,'pending');
insert into ordertable values(8,1,date'2022-09-01',765,'delivered');
insert into ordertable values(9,2,date'2022-10-21',220,'pending');
insert into ordertable values(10,2,date'2022-11-12',450,'delivered');


_ _ insert into orderDetails table

insert into orderDetails values(1,1,'All the Light We Cannot See',1,540);
insert into orderDetails values(1,2,'To Kill a Mocking Bird',1,300);
insert into orderDetails values(2,3,'Inferno',1,463);
insert into orderDetails values(3,4,'Homo Deus',1,450);
insert into orderDetails values(4,5,'Sapiens',1,400);
insert into orderDetails values(5,6,'Joyland',1,320);
insert into orderDetails values(6,1,'All the Light We Cannot See',1,540);
insert into orderDetails values(7,6,'joyland',1,320);
insert into orderDetails values(8,10,'Anastasia Krupnik',1,765);
insert into orderDetails values(9,4,'A Monster Calls',1,220);
insert into orderDetails values(10,4,'Homo Deus',1,450);

_ _ insert into inventory table
insert into inventory values(1,20);
insert into inventory values(2,25);
insert into inventory values(3,56);
insert into inventory values(4,96);
insert into inventory values(5,196);
insert into inventory values(6,200);
insert into inventory values(7,14);
insert into inventory values(8,9);
insert into inventory values(9,11);
insert into inventory values(10,5);


--union

select b_id from books where b_id>=8 union select b_id from books where b_id>=7;


--Aggregate function

--COUNT

select count(*) from books;

select count(*) as number_of_orders from ordertable;

select count(distinct customer_id) as no_of_orders_by_customers from ordertable;


--AVERAGE
select avg(quantity) from inventory;

--SUM
select sum(quantity) from inventory;

--MAX,MIN
select max(quantity) from inventory;
select min(quantity) from inventory;

--GROUP
select genre,count(*) as no_of_books from books group by genre;
--HAVING
select count(*) as no_of_books from books group by genre having price<500;


--NESTED

select lastname from customers where customer_id = (select customer_id from ordertable where status='pending');

--SOME,ALL,EXISTS
SELECT * FROM books WHERE price > SOME (SELECT price FROM books WHERE price >= 100 AND price <= 200);

SELECT * FROM books WHERE price > ALL (SELECT price FROM books WHERE price >= 100 AND price <= 200);

SELECT * FROM books WHERE EXISTS (SELECT * FROM orderDetails WHERE books.b_id = orderDetails.b_id);


--String operation
select * from customers where lastname like '%Ad%';

--Join operation
select * from books natural join publisher;

select * from books join publisher using(publisher_id);

select * from customers left outer join ordertable using(customer_id);
select * from customers right outer join ordertable using(customer_id);

select * from customers full outer join ordertable using(customer_id);
