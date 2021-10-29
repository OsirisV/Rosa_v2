/*------------------------------ Creating tables ---------------------------------*/

create table clients (
    id int identity(1,1) primary key, 
    firstName varchar(100) not null,
    lastName varchar(100) not null,
    addresse varchar(100) not null,
    zipCode int not null,
    areaCode int not null,
    phoneNumber int not null,
    email varchar(100) not null
);

create table shoppingList (
    itemId int identity(1,1) primary key,
    itemName varchar(100) not null,
    quantity int not null,
    clientId int references clients(id)
);

create table orderList (   
    orderId int identity(1,1) primary key,
    clientId int references clients(id),
    orderDate VARCHAR(100),
    total numeric
);

create table shoppingList1(
    itemId int identity(1,1) primary key,
    itemName varchar(100) not null,
    quantity int not null,
    clientId int references clients(id)
); 

/* create table shoppingExpense (
    lineItemId int identity(1,1) primary key,
    orderId int references orderList(orderId),
    id int references shoppingList(itemId),
    price numeric not null,
    subtotal numeric not null
); */


/*--------------------- Inserting data into the table -------------------------------*/
 
insert into clients (firstName, lastName, addresse, zipCode, areaCode, phoneNumber, email) values 
('Osiris', 'Sielatshom', '12 rue', 1234, 123, 6765489,'osiris.siel@gmail.com'),
('John', 'Doe', '13 rue', 5678, 123, 4569872,'john.doe@gmail.com'),
('Clyde', 'Bak', '14 rue', 9012, 123, 1237656,'clyde.bak@gmail.com'),
('Moussa', 'Sow', '15 rue', 3456, 123, 7355564,'moussa.sow@gmail.com'),
('Daniel', 'Alves', '15 rue', 7890, 123, 6652876,'daniel.alves@gmail.com');

insert into shoppingList (itemName, quantity, clientId) values
('Chai', 2, 1), ('Chang', 6, 1), ('Chartreuse verte', 1, 2), ('Cote de Blaye', 2, 2), 
('Sasquatch Ale', 3, 3), ('Steeleye Stout', 1, 4), ('Chai', 2, 4), 
('Laughing Lumberjack Lager', 2, 5), ('Outback Lager', 2, 5);

insert into shoppingList1 (itemName, quantity, clientId) values
('Halos de Jupiter Cotes du Rhone, 2018', 2, 1), ('Macon Lugny Les Charmes', 2, 2),('Montet Sauvignon Blanc', 2, 3),
('Latour Pouilly Fuisse', 3, 4);

insert into orderList (clientId) values
(1), (2), (3), (4), (5); 


/*--------------------- Query statements -------------------------------*/

select * from clients;
select * from shoppingList;
select * from orderList;
select * from shoppingList1;

select firstName, itemName, quantity, total
from clients
inner join shoppingList on clients.id = shoppingList.clientId
inner join orderList on shoppingList.clientId = orderList.clientId;

/*****************************************To delete and drop tables**************************************/

delete from orderList;
delete from shoppingList;
delete from shoppingList1;
delete from shoppingExpense;

drop table clients;
drop table shoppingList;
drop table shoppingList1;
drop table orderList;
drop table shoppingExpense;


/*****************************************Other Queries*********************************************/

delete from shoppingList
where shoppingList.clientId = 1
and itemName = 'Chang';

update shoppingList
set itemName = 'Laughing Lumberjack Lager'
where clientId = 5;

select *
from clients, shoppingList, orderList
where clients.id =  shoppingList.clientId and orderList.clientId = shoppingList.clientId;

select *
from clients
inner join shoppingList
on clients.id = shoppingList.clientId;





/* select * from clients 
where id = (select max(id) 
from clients); */


select *
from shoppingList1
inner join orderList on ShoppingList1.clientid = orderList.clientId;