

-- we implemented
-- ER diagram,
-- 9 tables for restaurant menu management
-- we used select ,insert ,delete,update, as per you said we used trigger in our assignments


create database team9;
use team9;

create table signup (
id int primary key auto_increment,
First_name char(15),
Last_name char(15),
Password_ varchar(10),
Email varchar(30) unique);

delimiter //
	create trigger SignUp
	after insert
	on signup for each row
	begin
		insert into Gmail values(new.Email,"Account Created ");
	end; //
delimiter ;
select * from signup;

insert into signup values(0,'Chaitanya','Apate','123456','apatechaitanya9@gmail.com');

create table Gmail (
Email varchar(30) unique,
Descriptions varchar(20));


select * from Gmail;

delete from signup where Email = 'apatechaitanya9@gmail.com';

create table DeletedGmail (
Email varchar(30) unique,
Descriptions varchar(20));

select * from DeletedGmail;

delimiter //
	create trigger DeleteAccount
	after delete on signup for each row
	begin
		insert into DeletedGmail values(old.Email,"Account Deleted ");
	end; //
delimiter 

create table customer(
cid int primary key auto_increment,
name varchar(45) not null,
phoneno char(10) unique,
address varchar(15),
wid int(20),
id int,
foreign key(id) references signup (id) on update cascade
   on delete cascade
);
drop table customer;

create table meal(
mid int primary key auto_increment,
mname varchar(45),
price varchar(20),
quantity int,
cheffid int
);

drop table meal;


create table cheff(
cheffid int primary key auto_increment,
cname varchar(35),
sal int,
hiredate date
);

insert into customer values(0,'chaitanya','72188181','MP',1);
insert into customer values
(0,'hitesh','02310000','AP',2),
(0,'ankita','111111111','MP BORDER',3);
insert into customer values(0,'Bhushan','444444444','Beed',6);

select * from Customer;

insert into meal values
(0,'burger','200',1,50),
(0,'chicken','300',1,50),
(0,'perri-perri','300',1,15);

insert into meal 


select * from meal;

insert into Cheff values
(0,'din',400,'2021-06-19'),
(0,'Ankii',500,'2022-01-11'),
(0,'Bhuvi',600,'2019-04-11');

select * from Cheff;
select * from meal;
select * from Customer;


-- orders

create table orders(
   oid int(23) primary key auto_increment,
   time date,
   status varchar(20),
   quantity int (20),
   cid int(20),
   foreign key (cid) references customer (cid) on update cascade
   on delete cascade,
   mid int (20),
   foreign key (mid) references meal (mid) on update cascade
   on delete cascade,
   wid int (20),
   foreign key (wid) references waiter1 (wid) on update cascade
   on delete cascade
   );
   
   drop table orders;
   
   -- insert
   insert into orders values(0,now(),'served',1,1,2,1);
   insert into orders values(0,now(),'served',4,5,2,7);
   insert into orders value(0,now(),'served',10,5,3,10);
   insert into orders value(0,now(),'served',10,5,3,10);
   
	-- delete						
   delete from orders where oid = 15;
   
   -- update
   update orders set status = 'pendig' where oid = 4;
	
select * from orders;

update  customer set cid = 4
where name = 'nitin';

desc Cheff;

select * from cheff;

create table waiter1(
 wid int (20) primary key auto_increment,
 name varchar(25),
 sal float,
 hiredate date
 );
 select * from waiter1;
 
insert into waiter1 values
 -- (0,'chottu',200,sysdate()),
--  (0,'Ramu Kaka',200,sysdate()),
 (0,'Ramu Kaka',300,sysdate()),
 (0,'Biru',100,sysdate()); 
 
 insert into waiter1 values
 (0,'chottu',200,sysdate()),
 (0,'Bheem',300,sysdate());
 
 drop table orders;
 create table restaurant(
 name varchar(50),
 phone char(10) unique,
 address varchar(25)
 );
 
-- ALTER TABLE restaurantsignup
-- ADD UNIQUE (phone);
 insert into restaurant values('ANKITA','7218866148','MP');
 insert into restaurant values('CHAITANYA','7218466148','MP');
 insert into restaurant values('HITESH','7213866148','MP');
 select * from orders;
 
 
desc orders;
desc meal;
desc Cheff;
desc waiter;
desc restaurant;
desc customers;

-- here we created view 
select  customer.name 'Customer',customer.phoneno 'Contacts',waiter1.name as'Waiter Name',meal.mname,meal.price 'Meal',
cheff.cname as 'Made By' ,orders.time as 'Time'
from customer,waiter1,meal,cheff,orders
where orders.mid = meal.mid and orders.wid = waiter1.wid and orders.cid = customer.cid
order by customer.name;


