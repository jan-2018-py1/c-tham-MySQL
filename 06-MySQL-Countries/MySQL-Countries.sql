use world;
select * from cities;
select * from countries;
select * from languages;

#1. What query would you run to get all the countries that speak Slovene? Your query should return the name of the country, language and language percentage. Your query should arrange the result by language percentage in descending order. (1)
select c.name, l.language, l.percentage
from countries c
join languages l on c.id = l.country_id
where l.language = "slovene"
order by l.percentage desc;

select *  from countries c
join languages l on c.id = l.country_id;

select * from countries
where id in (16,96,107,200);

select * from languages
where language = "slovene";


#2. What query would you run to display the total number of cities for each country? Your query should return the name of the country and the total number of cities. Your query should arrange the result by the number of cities in descending order. (3)
select c2.name as country_name, count(c1.country_id)  as total_cities
from cities c1
join countries c2 on c1.country_id = c2.id
group by c2.name
order by total_cities desc;

select *
from cities c1
join countries c2 on c1.country_id = c2.id;

#3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? Your query should arrange the result by population in descending order. (1)
select c1.name as city_name, c1.population
from cities c1
join countries c2 on c1.country_id = c2.id
where c2.name = 'Mexico'
and c1.population > 500000
order by c1.population desc;

select *
from cities c1
join countries c2 on c1.country_id = c2.id
where c2.name = 'Mexico';

#4. What query would you run to get all languages in each country with a percentage greater than 89%? Your query should arrange the result by percentage in descending order. (1)
select c.name, l.language, l.percentage  
from countries c
join languages l on c.id = l.country_id
where l.percentage > 89
order by l.percentage desc;

select *  from countries c
join languages l on c.id = l.country_id;

#5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)
select name, surface_area, population
from countries
where surface_area < 501 
and population > 100000;

select *
from countries
where surface_area < 501;

select *
from countries;

#6. What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 and a life expectancy greater than 75 years? (1)
select name, government_form, capital, life_expectancy
from countries
where government_form = 'Constitutional Monarchy'
and capital > 200
and life_expectancy > 75
;

select *
from countries
where government_form = 'Constitutional Monarchy';

select *
from countries
where government_form like '%monarchy%';

select *
from countries;


#7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? The query should return the Country Name, City Name, District and Population. (2)
select c2.name, c1.name, c1.district, c1.population
from cities c1
join countries c2 on c1.country_id = c2.id
where c2.name = 'Argentina'
and c1.district = 'Buenos Aires'
and c1.population > 500000
;

select *
from cities c1
join countries c2 on c1.country_id = c2.id
where c2.name = 'Argentina'
and c1.district = 'Buenos Aires'
and c1.population > 500000
;

#8. What query would you run to summarize the number of countries in each region? The query should display the name of the region and the number of countries. Also, the query should arrange the result by the number of countries in descending order. (2)
select region, count(name) as number_countries
from countries
group by region
order by number_countries desc
;

select *
from countries
;