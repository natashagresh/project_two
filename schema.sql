drop table if exists users;
drop table if exists posts;
drop table if exists categories;
drop table if exists action_takens;
drop table if exists categories_posts;

create table users (id integer primary key, username VARCHAR, password VARCHAR);

create table posts (id integer primary key, author VARCHAR, time_posted integer, article VARCHAR, title_of_article VARCHAR, image_url VARCHAR, last_upload VARCHAR, category_id integer );

create table action_takens(id integer primary key, user_id integer, post_id integer, type_of_action VARCHAR);

create table categories(id integer primary key, post_id integer, category_name varchar);	

create table categories_posts(category_id integer references categories(id), post_id integer references post(id));	


