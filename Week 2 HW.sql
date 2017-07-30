drop table if exists videos;
drop table if exists reviews;

-- Question 1
create table sql_training.videos(
	id int primary key not null auto_increment,
	title char(80),
    length float,
    url char(200)
    )
;
insert into videos(
    title,
    length,
    url
    )
    values
    ('How Indexes Work in MySQL', 48.666, 'https://www.youtube.com/watch?v=1hAp8tNcZLA'),
    ('MySQL Database Tutorial - 19 - GROUP BY', 7.333, 'https://www.youtube.com/watch?v=_uyyc5fc3J8'),
    ('The Update Command (MySQL)', 5.922, 'https://www.youtube.com/watch?v=M54FCOdUo78'),
    ('MySQL Database Tutorial - 31 - ALTER / DROP / RENAME TABLE', 6.0763, 'https://www.youtube.com/watch?v=ELI2-pEk1FY')
;
-- Question 2
	create table reviews(
		id int primary key not null auto_increment,
        user_name char(50),
        review_text char(200),
        video_id numeric
        )
;
	insert into reviews(
        user_name,
        review_text,
        video_id
	)
    values
		('neo', 'Great video.  Learned so much', 2),
		('cloud', 'Waste of time', 2),
		('steve_jobs', 'Not sure how I lived before this video', 1),
		('Sam I Am', 'Amazing content', 1),
		('steve_jobs', 'Solid video', 4)
;
-- Question 3
	select
		title,
        user_name as reviewer,
        review_text
	from
		videos v
		left join reviews r
			on v.id = r.video_id
	order by 1,2
;