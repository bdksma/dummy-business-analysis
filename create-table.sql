-- create table :

create table products (
	row int,
	product_id varchar(20) primary key,
	name varchar(100),
	category varchar(100),
	cost_price int
);

create table stores (
	row int,
	store_id varchar(20) primary key,
	name varchar(100),
	city varchar(100),
	region varchar(100)
);

create table customers (
	row int,
	customer_id   varchar(20) primary key,
	gender        VARCHAR(10),
	age_group     VARCHAR(10),
	income_level  VARCHAR(10)
);

CREATE TABLE sales_data (
    id          SERIAL PRIMARY KEY,
    date        DATE,
    product_id  VARCHAR(10) REFERENCES products(product_id),
    store_id    VARCHAR(10) REFERENCES stores(store_id),
    quantity    INTEGER,
    price       INTEGER
);

-- import data .csv dengan fitur import

-- cek data

select * from customers c;
select * from products p ;
select * from stores s;
select * from sales_data sd;

