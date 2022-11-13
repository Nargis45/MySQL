create database if not exists sales;
#create schema if not exists sales;
use sales;
drop table sales;
drop table customers;
CREATE TABLE sales (
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;
CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    primary key (customer_id)
);
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 1)
;
Alter table customers
change column number_of_complaints number_of_complaints int default 0;

Alter table customers
change column customer_id customer_id int Auto_increment;

INSERT INTO customers (first_name, last_name, gender, email_address)
VALUES ('Nargis', 'Nasreen', 'F', 'nargisnas@gmail.com');

Alter table customers
alter column number_of_complaints drop default;
SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    sales.sales;
CREATE TABLE items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code)
);  
drop table companies;
    CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) default 'X',
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id),
    unique key (headquarters_phone_number)
);
Alter table companies 
modify company_name VARCHAR(255) NULL;

Alter table companies
change column company_name company_name VARCHAR(255) Not Null;