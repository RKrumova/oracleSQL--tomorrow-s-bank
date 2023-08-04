set serveroutput on;
-- Functional
--1 crud customers
create PROCEDURE create_Customer(
    customerID in customer.customerID%type,
    egn in customer.egn%type,
    firstName in customer.firstName%type,
    lastName in customer.lastName%type,
    additionalName in customer.additionalName%type,
    address in customer.address%type,
    phone in customer.phone%type,
    email in customer.email%type)
is begin 
    insert into customer (customerID, egn, firstName, lastName, additionalName, address, phone, email)
    values(customerID, egn, firstName, lastName, additionalName, address, phone, email);
    dbms_output.put_line('Customer Added!');
end create_Customer;

create PROCEDURE edit_Customer(
    customerID in customer.customerID%type,
    egn in customer.egn%type,
    firstName in customer.firstName%type,
    lastName in customer.lastName%type,
    additionalName in customer.additionalName%type,
    address in customer.address%type,
    phone in customer.phone%type,
    email in customer.email%type)
is begin 
    update customer 
    set
    egn = egn,
    firstName = firstname,
    lastName=lastname,
    additionalName = additionalName,
    address = address,
    phone = phone,
    email = email
    where customerID = customerID;
    dbms_output.put_line('Customer Edited!');
end edit_Customer;

create PROCEDURE delete_Customer(customerID in customer.customerID%type)
is begin 
    delete from customer
    where customerid = customerid;
    dbms_output.put_line('Customer Edited!');
end delete_Customer;
--2 crud bank account

create PROCEDURE create_bankCard(
bankID in bankID%type,
customerID in customerID%type,
typeCard in typeCard%type,
amount in amount%type,
currency in currency%type,
mainCard in mainCard%type)
is begin
    insert into bankCard (bankID, customerID, typeCard, amount, currency, mainCard)
    values (bankID, customerID, typeCard, amount, currency, mainCard);
    dbms_output.put_line('Bank card created!');
end create_bankCard;

create or replace procedure edit_bankCard
(
bankID in bankCard.bankID%type,
customerID in bankCard.customerID%type,
typeCard in bankCard.typeCard%type,
amount in bankCard.amount%type,
currency in bankCard.currency%type,
mainCard in bankCard.mainCard%type)
is begin
    update bankCard set
    customerID=customerid,
    typeCard = typecard,
    amount = amount,
    currency = currency,
    mainCard = mainCard
    where bankID = bankID;
    dbms_output.put_line('Bank card edited!');
end edit_bankCard;    

create procedure delete_bankCard(bankID in bankCard.bankID%type)
is begin
    delete from bankCard where bankID = bankID;
    dbms_output.put_line('Bank card deleted!');
end delete_bankCard;
