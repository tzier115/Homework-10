use sakila;

-- 1a
select first_name, last_name
from actor


-- 1b
select first_name from actor
union
select last_name from actor
    
ALTER TABLE actor
	add Actor_Name varchar(50) not null;

    
-- 2a
select actor_id, first_name, last_name 
from actor
where first_name = 'Joe'


-- 2b
select last_name
from actor
where last_name like '%GEN%';


-- 2c
select first_name, last_name
from actor
where last_name like '%LI%'
order by last_name, first_name;


-- 2d
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');


-- 3a
ALTER TABLE actor
add middle_Name varchar(50) not null
after first_name;
  
  
-- 3b
ALTER TABLE actor
modify middle_Name Blob;


-- 3c
ALTER TABLE actor
drop middle_name;


-- 4a
select last_name, count(last_name)
from actor
group by last_name;


-- 4b
select last_name, count(last_name)
from actor
where count(last_name) > 2
group by last_name;

SET SQL_SAFE_UPDATES = 0;


-- 4c
UPDATE actor
	SET first_name = 'HARPO'
where first_name like 'GROUCHO';


-- 4d
UPDATE actor
	SET first_name = 'GROUCHO', 'MUCHO GROUCHO'
where first_name like 'HARPO';


-- 5a
select*from sakila.address


-- 6a
SELECT first_name, last_name, address
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id;


-- 6b
select first_name, last_name, sum(amount)
from staff  
LEFT JOIN payment ON staff.staff_id = payment.staff_id
where payment_date BETWEEN '20050801' and '20050831'
group by staff.staff_id;    
    

-- 6c
select film.title, film_actor.actor_id
from film_actor
inner join film on
film.film_id = film_actor.film_id


-- 6d
select film.title, count(inventory_id)
from film
Join inventory on 
film.film_id = inventory.film_id
where film.title = 'Hunchback impossible';


-- 6e
select first_name, last_name, sum(amount)
from customer
join payment on customer.customer_id = payment.customer_id
group by payment.customer_id
order by last_name;


-- 7a
select title
from film
where title like 'K%'
or
title like 'Q%'
and language_id in(

select language_id 
from language
where name = 'English'

);


-- 7b
select first_name, last_name
from actor
where actor_id in 
(

	select actor_id
	from film_actor
	where film_id = 
    
	(
		select film_id
		from film
		where title = 'Alone Trip'
	)
);


-- 7c
select first_name, last_name, email
from customer
where address_id in 
(
	select address_id
	from address
	where city_id in 
	(
		select city_id
		from city
		where country_id in 
        (
			select country_id
            from country
            where country = 'Canada'
		)
			
	)
);


-- 7d
select title
from film
where film_id in
(
	select film_id
    from film_category
    where category_id in
    (
		select category_id
        from category
        where name = 'family'
	)
);


-- 7e
??

-- 7f Business in dollars each store brough in
select sum(amount) 
from payment
where staff_id in
(
	select staff_id
    from staff
    where store_id in
    (
		select store_id
        from store
        where store_id = 1
	)
);
        
select sum(amount) 
from payment
where staff_id in
(
	select staff_id
    from staff
    where store_id in
    (
		select store_id
        from store
        where store_id = 2
	)
);



    
    






    