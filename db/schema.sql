drop table if exists users;
drop table if exists posts;
drop table if exists categories;
drop table if exists posts_users;
drop table if exists categories_posts;

create table users (
    id integer primary key, 
    password_digest VARCHAR,
    username VARCHAR
);


create table posts (
    id integer primary key, 
    created_at DATETIME,
    -- updated_at DATETIME, 
    article VARCHAR, 
    title_of_article VARCHAR, 
    image_url VARCHAR, 
    user_id integer references users(id)
   
);

-- create table posts_users (
--     id integer primary key, 
--     user_id integer references users(id), 
--     post_id integer references posts(id)
-- );

create table categories (
    id integer primary key, 
    category_name varchar
);    

create table categories_posts (
    category_id integer references categories(id), 
    post_id integer references post(id)
);    


