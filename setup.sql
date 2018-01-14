/* This file summarizes a finance database to allocate budgets based on
incomes and expenses. 
 
 It is composed by Julia Deacon under the tutelage of Fabian Bömer. */

/* If the database finance already exists, then kill it. */
drop database if exists finance;
create database finance; /* Make a database called finance. */

use finance; /* We will be using the database finance. */

/* This table contains the allocation schemes. */
create table schemes (
    name Varchar(50),
    scheme json,
    primary key (name));

/* This table catalogs incomes and expenses. */
create table transactions (
    sort Char(1),
    quantity Decimal(7,2),
    txn_date Date,
    date_added Date,
    scheme_name Varchar(50),
    description Text,
    foreign key s_name (scheme_name) references schemes(name) on delete SET NULL,
    primary key(quantity, txn_date, sort)
    );

load data local infile '../sch.txt' into table schemes fields terminated by '|';

 load data local infile '../txn.txt' into table transactions fields terminated by '|';

/*This table summarizes the amounts remaining in each category.
create table summary (
    date Date,
    bins json);

insert into schemes values (
    "test_scheme",
    '{
    "necessities": 25,
    "fun": [25, {
        "gifts": [10, {
            "charity": 20,
            "other": 80}],
        "trips": 45,
        "other": 45}],
    "capital": 10,
    "savings": [40, {
        "keeping": 50,
        "investing": [50, {
            "bitcoin": 75,
            "gold": 25,
            "other": 0}]}]}'
    );

insert into transactions values (
    'i',
    100,
    current_timestamp(),
    "test_scheme",
    "test transaction");*/
