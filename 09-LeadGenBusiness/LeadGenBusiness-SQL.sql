use lead_gen_business;
select * from billing;
select * from clients;
select * from sites;
select * from leads;


#1. What query would you run to get the total revenue for March of 2012?
select date_format(charged_datetime,"%Y%m"), sum(amount)
from billing
where  date_format(charged_datetime,"%Y%m") = "201203"
group by date_format(charged_datetime,"%Y%m")
;

select * 
from billing
where  date_format(charged_datetime,"%Y%m") = "201203"
;

#2. What query would you run to get total revenue collected from the client with an id of 2?
select concat(c.first_name, ' ',c.last_name) as client, sum(b.amount)
from billing b
join clients c on b.client_id = c.client_id
where b.client_id = 2
group by client
;

select * 
from billing b
join clients c on b.client_id = c.client_id
where b.client_id = 2
;

#3. What query would you run to get all the sites that client=10 owns?
select concat(c.first_name, ' ',c.last_name) as client, domain_name
from sites s
join clients c on s.client_id = c.client_id
where s.client_id = 10
;

select * 
from sites s
join clients c on s.client_id = c.client_id
where s.client_id = 10
;

#4. What query would you run to get total # of sites created per month per year for the client with an id of 1? What about for client=20?
select s.client_id,  concat(c.first_name, ' ',c.last_name) as client, date_format(created_datetime,"%Y%m") as site_created, count(domain_name) as no_site
from sites s
join clients c on s.client_id = c.client_id
where s.client_id = 1
group by s.client_id, client, site_created
;
select s.client_id,  concat(c.first_name, ' ',c.last_name) as client, date_format(created_datetime,"%Y%m") as site_created, count(domain_name) as no_site
from sites s
join clients c on s.client_id = c.client_id
where s.client_id = 20
group by s.client_id, client, site_created
;

select * 
from sites s
join clients c on s.client_id = c.client_id
where s.client_id = 1
;
#5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?

select s.domain_name,  date_format(l.registered_datetime,'%Y%m%d') as leads_date, count(l.leads_id) as num_leads
from sites s
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20110215' 
group by s.domain_name,  leads_date
order by leads_date
;

select * 
from sites s
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20110215' 
;

select * 
from sites s
join leads l on s.site_id = l.site_id
;

#6. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?
select c.client_id,  concat(c.first_name, ' ',c.last_name) as client_name, count(l.leads_id) as cnt 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20111231'
group by c.client_id, client_name
order by c.client_id
;


select c.client_id,  concat(c.first_name, ' ',c.last_name) as client_name, date_format(l.registered_datetime,'%Y%m') as leads_month, count(l.leads_id) as cnt 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20111231'
group by c.client_id, client_name, leads_month
order by c.client_id
;

select * 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20111231' 
order by c.client_id
;

#7. What query would you run to get a list of client names and the total # of leads we've generated for each client each month between months 1 - 6 of Year 2011?
select concat(c.first_name, ' ',c.last_name) as client_name, date_format(l.registered_datetime,'%Y%m') as leads_month, count(l.leads_id) as cnt 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m') between '201101' and '201106' 
group by c.client_id, client_name, leads_month
order by leads_month
;

select * 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m') between '201101' and '201106' 
order by c.client_id
;

#8. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  
#Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.


#?????
select concat(c.first_name, ' ',c.last_name) as client_name, s.domain_name, count(s.site_id) as cnt 
from clients c
join sites s on c.client_id = s.client_id
left join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20111231'
group by 1,2
order by c.client_id
;


select *
from clients c
join sites s on c.client_id = s.client_id
left join leads l on s.site_id = l.site_id
where date_format(l.registered_datetime,'%Y%m%d') between '20110101' and '20111231'
order by c.client_id
;

#Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.

select concat(c.first_name, ' ',c.last_name) as client_name, s.domain_name,  count(l.leads_id) as cnt 
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
group by client_name, s.domain_name
order by 1,2
;

select *
from clients c
join sites s on c.client_id = s.client_id
join leads l on s.site_id = l.site_id
order by c.client_id
;

#9. Write a single query that retrieves total revenue collected from each client for each month of the year. Order it by client id.

select c.client_id, concat(c.first_name, ' ',c.last_name) as client_name, date_format(b.charged_datetime,'%Y%m') as charged_month, sum(amount) 
from billing b
join clients c on b.client_id = c.client_id
group by c.client_id , client_name, charged_month
order by 1
;


select *
from billing b
join clients c on b.client_id = c.client_id
;

#10. Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client. 
#It will become clearer when you add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)
select concat(c.first_name, ' ',c.last_name) as client_name, group_concat(s.domain_name SEPARATOR ' / ')
from clients c
join sites s on c.client_id = s.client_id
group by client_name 
;

select concat(c.first_name, ' ',c.last_name) as client_name, s.domain_name
from clients c
join sites s on c.client_id = s.client_id
;

select *
from clients c
join sites s on c.client_id = s.client_id
;