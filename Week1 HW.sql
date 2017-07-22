# Q1
	select max(distance) as max_dist
from flights
;
# Q2
	select distinct (engines)
from planes
where engines is not null
order by 1
;
create table max_seats as
	select 
		engines,
        max(seats) as most_seats
	from planes
    group by 1
;
	select
		*
	from planes p
    inner join max_seats ms
		on p.seats = ms.most_seats
        and p.engines = ms.engines
order by seats desc
;
# Q3
	select 
		COUNT(*) as flights
	from flights
;
# Q4
	select
		carrier,
        count(*) as flights
	from flights
    group by 1
;
# Q5
	select 
		name,
        count(*) as flights
	from airlines al
	left join flights fl
		on al.carrier = fl.carrier
	where al.carrier is not null
    group by 1
    order by 2 desc
;
# Q6
	select 
		name,
        count(*) as flights
	from airlines al
	left join flights fl
		on al.carrier = fl.carrier
	where al.carrier is not null
    group by 1
    order by 2 desc
    limit 5
;
# Q7
	select 
		name,
        count(*) as flights
	from airlines al
	left join flights fl
		on al.carrier = fl.carrier
	where 
		al.carrier is not null
        and distance >= 1000
    group by 1
    order by 2 desc
    limit 5
;
# Q8
# Which airports had days with at least 20 MPH winds (not gusts) and how many days
# were there?
	select
		origin,
        count(*) as windy_days
	from 
	  (select
		origin,
        year,
        month,
        day,
        max(wind_speed) as speed
	from weather
    where wind_speed >= 20
    group by 1,2,3,4
    ) as spds
	where 
        origin is not null	
    group by 1
    order by 2 desc
;