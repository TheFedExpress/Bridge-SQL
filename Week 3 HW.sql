-- Final Homework
drop schema if exists security;
create schema security;
use security;
drop table if exists users;
drop table if exists groups;
drop table if exists rooms;
drop table if exists room_access;
create table groups(
	id int auto_increment primary key not null,
    group_name char(40) not null
    )
;
insert into groups(
	group_name
    )
    values
		("I.T."), ("Sales"),("Administration"),("Operations")
;
create table users(
	id int auto_increment primary key not null,
    user_name char(40),
    group_id int
	)
;
insert into users(
	user_name,
    group_id
    )
    values
		("Modesto", 1), ("Ayine", 1), ("Christopher", 2), ("Cheong woo", 2), 
        ("Heidy", null),("Saulat", 3)
;
create table rooms(
	id int auto_increment primary key not null,
    room_name char(20)
    )
;
insert into rooms(
	room_name
    )
    values
		("101"), ("102"), ("Auditorium A"), ("Auditorium B")
;
create table room_access(
	room_id int not null,
    group_id int not null
    )
;
insert into room_access(
	group_id,
    room_id
    )
    values
		(1,1), (1,2),
        (2,2), (2,3)
;
-- Relationships:
-- users-groups: many to one
-- users-rooms: one to many
-- groups-rooms: many to many
	select
		group_name,
        user_name
	from groups g
		left join users u
			on g.id = u.group_id
;
	select
		room_name,
        group_name
	from 
		rooms r
        left join room_access ra
			on r.id = ra.room_id
		left join groups g
			on ra.group_id = g.id
;
	select
		user_name,
        group_name,
        room_name
	from
		users u
        left join groups g
			on u.group_id = g.id
		left join room_access ra
			on g.id = ra.group_id
		left join rooms r
			on ra.room_id = r.id
	order by 1,2,3
;