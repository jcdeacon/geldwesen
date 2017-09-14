/* This file summarizes a finance database to allocate budgets based on
incomes and expenses. 
 
 It is composed by Julia Deacon under the tutelage of Fabian Bömer. */

/* If the database finance already exists, then kill it. */
drop database if exists finance;
create database finance; /* Make a database called finance. */

use finance; /* We will be using the database finance. */

/* This table contains the allocation schemes. */
create table schemes (
    name Varchar(20),
    scheme json,
    primary key (name));

/* This table catalogs incomes and expenses. */
create table transactions (
    sort Char(1),
    quantity Decimal(7,2),
    txn_date Date,
    date_added Date,
    scheme Varchar(20),
    description Text,
    foreign key s_name (scheme) references schemes(name) on delete SET NULL,
    primary key(quantity, txn_date, sort)
    );

load data local infile '../sch.txt' into table schemes fields terminated by '|';

