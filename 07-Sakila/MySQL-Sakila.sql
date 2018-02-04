use sakila;
select * from actor;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;

#1. What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.
select c1.first_name, c1.last_name, c1.email, c2.address, c2.district, c3.city, c2.postal_code
from customer c1
join address c2 on c1.address_id = c2.address_id
join city c3 on c2.city_id = c3.city_id
where c3.city_id = 312;

select *
from customer c1
join address c2 on c1.address_id = c2.address_id
join city c3 on c2.city_id = c3.city_id
where c3.city_id = 312;

#2. What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category).
select f1.title, f1.description, f1.release_year, f1.rating, f1.special_features, f3.name as genre
from film f1
join film_category f2 on f1.film_id = f2.film_id
join category f3 on f2.category_id = f3.category_id
where f3.name = 'comedy'
;

select *
from film f1
join film_category f2 on f1.film_id = f2.film_id
join category f3 on f2.category_id = f3.category_id
where f3.name = 'comedy'
;

select * from category
where name = 'comedy'
;

#3. What query would you run to get all the films joined by actor_id=5? Your query should return the actor id, actor name, film title, description, and release year.
select a1.actor_id, a2.first_name, a2.last_name, f.title, f.description, f.release_year
from film f 
join film_actor a1 on f.film_id = a1.film_id
join actor a2 on a1.actor_id = a2.actor_id
where a1.actor_id = 5
;

select *
from film f 
join film_actor a1 on f.film_id = a1.film_id
join actor a2 on a1.actor_id = a2.actor_id
where a1.actor_id = 5;

select * 
from film_actor a1
join actor a2 on a1.actor_id = a2.actor_id
where a1.actor_id = 5;

#4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.
select c.first_name, c.last_name, c.email, a.address, a.district, i.city, a.postal_code
from store s
join customer c on s.store_id = c.store_id
join address a on c.address_id = a.address_id
join city i on a.city_id = i.city_id
where s.store_id = 1
and a.city_id in (1,42,312,459)
;

select * 
from store s
join customer c on s.store_id = c.store_id
join address a on c.address_id = a.address_id
join city i on a.city_id = i.city_id
where s.store_id = 1
and a.city_id in (1,42,312,459)
;

#5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rating, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.
select f.title, f.description, f.release_year, f.rating, f.special_features
from film f 
join film_actor a1 on f.film_id = a1.film_id
join actor a2 on a1.actor_id = a2.actor_id
where a1.actor_id = 15
and f.rating = 'G'
and f.special_features like '%behind the scenes%'
;

select *
from film f 
join film_actor a1 on f.film_id = a1.film_id
join actor a2 on a1.actor_id = a2.actor_id
where a1.actor_id = 15
and f.rating = 'G'
and f.special_features like '%behind the scenes%'
;


#6. What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.
select f.film_id, f.title, a.actor_id, a.first_name, a.last_name
from film f
join film_actor f1 on f.film_id = f1.film_id
join actor a on f1.actor_id = a.actor_id
where f.film_id = 369
;

select *
from film f
join film_actor f1 on f.film_id = f1.film_id
join actor a on f1.actor_id = a.actor_id
where f.film_id = 369
;

#7. What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).
select f1.title, f1.description, f1.release_year, f1.rating, f1.special_features, f3.name as genre
from film f1
join film_category f2 on f1.film_id = f2.film_id
join category f3 on f2.category_id = f3.category_id
where f1.rental_rate = 2.99
;

select *
from film f 
where f.rental_rate = 2.99
;

#8. What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.
select f1.title, f1.description, f1.release_year, f1.rating, f1.special_features, f3.name as genre, f5.first_name, f5.last_name
from film f1
join film_category f2 on f1.film_id = f2.film_id
join category f3 on f2.category_id = f3.category_id
join film_actor f4 on f1.film_id = f4.film_id
join actor f5 on f4.actor_id = f5.actor_id
where f5.first_name = 'sandra'
and f5.last_name = 'kilmer'
;


select *
from film f1
join film_category f2 on f1.film_id = f2.film_id
join category f3 on f2.category_id = f3.category_id
join film_actor f4 on f1.film_id = f4.film_id
join actor f5 on f4.actor_id = f5.actor_id
where f5.first_name = 'sandra'
and f5.last_name = 'kilmer'