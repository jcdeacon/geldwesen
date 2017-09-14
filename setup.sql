/* This file initializes a finance database to allocate budgets based on
incomes and expenses. 
 
 It is composed by Julia Deacon under the tutelage of Fabian Bömer. */

/* If the database finance already exists, then kill it. */
drop database if exists finance;
create database finance; /* Make a database called finance. */

use finance; /* We will be using the database finance. */

create table transactions (
    sort Char(1),
    quantity Decimal(7,2),
    date Date,
    scheme Varchar(20),
    description Text);

create table summary (
    date Date,
    necessities_pct Decimal(4,2),
    necessities_amt Decimal(7,2),
    fun_pct Decimal(4,2),
    fun_amt Decimal(7,2),
    capital_pct Decimal(4,2),
    capital_amt Decimal(7,2),
    savings_pct Decimal(4,2),
    savings_amt Decimal(7,2));

create table schemes (
    name Varchar(20),
    necessities_pct Decimal(4,2),
    fun_pct Decimal(4,2),
    capital_pct Decimal(4,2),
    savings_pct Decimal(4,2));

