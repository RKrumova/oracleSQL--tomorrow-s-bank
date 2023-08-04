--1
select customerID from bankCard where currency like 'BGN';
--2
select customerID from bankCard where amount = 0;
--3
alter table bankCard add cardName varchar2(105);
merge into bankCard using customer
on (bankCard.customerID = customer.customerID) when matched then 
update set cardName = customer.firstName || 'Account' || bankCard.currency;
select * from bankCard;


