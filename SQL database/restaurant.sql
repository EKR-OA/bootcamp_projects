-----------Create Table------------
CREATE TABLE food (
  food_id INT primary key,
  food_name TEXT
);

CREATE TABLE drinks (
  drinks_id INT primary key,
  drinks_name TEXT
);

CREATE TABLE members (
  member_status INT primary key,
  member TEXT
);

CREATE TABLE location (
  location_id INT primary key,
  location_name TEXT
);

CREATE TABLE orders (
  order_id INT primary key,
  order_name TEXT,
  order_date TEXT,
  bill INT,
  food_id INT,
  drinks_id INT,
  member_status INT,
  location_id INT,
  FOREIGN KEY(food_id) REFERENCES food (food_id)
  FOREIGN KEY(drinks_id) REFERENCES drinks (drinks_id)
  FOREIGN KEY( member_status) REFERENCES members ( member_status)
  FOREIGN KEY(  location_id) REFERENCES location ( location_id)
);
-----------Insert Data------------
insert into food values
  (1,'Salad'),
  (2,'Pizza'),
  (3,'Sushi'),
  (4,'Somtum'),
  (5,'Steak');

insert into drinks values
  (1,'Cola'),
  (2,'Drinking Water'),
  (3,'Thai-tea');

insert into members values
  (1,'Member'),
  (2,'Notmember');

insert into location values
  (1,'BKK'),
  (2,'HDY'),
  (3,'CNX');

insert into orders values
  (1,'Edward','2022-01-05',1500,5,3,1,2),
  (2,'Marry','2022-05-27',620,3,2,2,3),
  (3,'Ton','2021-10-15',340,2,1,1,1),
  (4,'John','2022-05-01',900,5,1,2,1),
  (5,'Aun','2022-09-01',1350,1,3,1,1);
  
  
--sqlite command--
.mode markdown
.header on


-----------CTE (With)------------
--Find Total income from each type of customer
with subjoin as(
  select
  ord.order_id,
  ord.order_name,
  ord.bill,
  mem.member
from orders AS ord
Inner join members AS mem on ord.member_status = mem.member_status
)

select
  member,
  sum(bill) AS 'Total for each customer type'
from subjoin
group by member;

-----------Sub Query------------
--Find top drinks order in year 2022
select
  drinkName,
  orderyear,
  count(*) AS Amount
from(
    select
    order_id,
    ord.order_name as name,
    strftime('%Y',ord.order_date) as orderyear,
    dr.drinks_name as drinkName    
    from orders as ord
    inner join drinks as dr on ord.drinks_id = dr.drinks_id
)
where orderyear = '2022'
GROUP BY drinkName
ORDER BY count(*) DESC;

-----------Other Query------------
--1--
--See which food is ordered at BKK branch
select
  ord.order_id AS id,
  ord.order_name AS name,
  food.food_name,
  loc.location_name
from orders as ord
Inner join location as loc ON ord.location_id = loc.location_id
Inner join food ON ord.food_id = food.food_id
where loc.location_id = 1;

--2--
--Find amount of member customer in each branch
select
  loc.location_name,
  count(*) AS Amount
from orders as ord
Inner join members as mem ON ord.member_status = mem.member_status
Inner join location as loc ON ord.location_id = loc.location_id
Where mem.member_status = 1
GROUP BY loc.location_name
ORDER BY count(*) DESC;

--3--
--Define member customer who may be love Thai-tea
select
  ord.order_id AS OrderID,
  ord.order_name AS Name,
  mem.member AS Member,
  food.food_name AS Food,
  dr.drinks_name AS Drinks,
  case
    when dr.drinks_id = 3 THEN 'Thai-tea lover'
    ELSE 'Not'
  END AS Style
from orders AS ord
Inner join drinks as dr ON ord.drinks_id = dr.drinks_id
Inner join food ON ord.food_id = food.food_id
Inner join members as mem ON ord.member_status = mem.member_status
Where mem.member_status = 1
