drop table if exists user
drop table if exists post
drop table if exists category
drop table if exists action_taken
drop table if exists category_post

create table user (id integer primary key, username VARCHAR, password VARCHAR);

create table post (id integer primary key, author VARCHAR, time_posted integer, user_id integer, article VARCHAR, title_of_article VARCHAR, image_url VARCHAR, last_upload VARCHAR, category_id integer, category integer );

create table action_taken(id integer primary key, user_id integer, post_id integer, type_of_action VARCHAR);

create table category(id integer primary key, post_id integer, category_name varchar);	

create table category_post(id integer primary key, category_id integer, post_id integer);	


