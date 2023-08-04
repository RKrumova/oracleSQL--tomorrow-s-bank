
create or replace package manageCustomers_pkg 
is
procedure create_Customer(
    customerID in customer.customerID%type,
    egn in customer.egn%type,
    firstName in customer.firstName%type,
    lastName in customer.lastName%type,
    additionalName in customer.additionalName%type,
    address in customer.address%type,
    phone in customer.phone%type,
    email in customer.email%type);
procedure edit_Customer(
    customerID in customer.customerID%type,
    egn in customer.egn%type,
    firstName in customer.firstName%type,
    lastName in customer.lastName%type,
    additionalName in customer.additionalName%type,
    address in customer.address%type,
    phone in customer.phone%type,
    email in customer.email%type);
procedure delete_Customer(
    customerID in customer.customerID%type);
END manageCustomers_pkg;

create package body manageCustomers_pkg 
is
PROCEDURE create_Customer(
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
PROCEDURE edit_Customer(
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
PROCEDURE delete_Customer(customerID in customer.customerID%type)
is begin 
    delete from customer
    where customerid = customerid;
    dbms_output.put_line('Customer Edited!');
end delete_Customer;
end;
create or replace package manageBankCards_pkg is 
PROCEDURE create_bankCard(
bankID in bankCard.bankID%type,
customerID in bankCard.customerID%type,
typeCard in bankCard.typeCard%type,
amount in bankCard.amount%type,
currency in bankCard.currency%type,
mainCard in bankCard.mainCard%type);
procedure edit_bankCard(
bankID in bankCard.bankID%type,
customerID in bankCard.customerID%type,
typeCard in bankCard.typeCard%type,
amount in bankCard.amount%type,
currency in bankCard.currency%type,
mainCard in bankCard.mainCard%type);
procedure delete_bankCard(bankID in bankCard.bankID%type);
end manageBankCards_pkg;

create or replace package body manageBankCards_pkg is
PROCEDURE create_bankCard(
bankID in bankCard.bankID%type,
customerID in bankCard.customerID%type,
typeCard in bankCard.typeCard%type,
amount in bankCard.amount%type,
currency in bankCard.currency%type,
mainCard in bankCard.mainCard%type)
is begin
    insert into bankCard (bankID, customerID, typeCard, amount, currency, mainCard)
    values (bankID, customerID, typeCard, amount, currency, mainCard);
    dbms_output.put_line('Bank card created!');
end create_bankCard;
procedure edit_bankCard
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
procedure delete_bankCard(bankID in bankCard.bankID%type)
is begin
    delete from bankCard where bankID = bankID;
    dbms_output.put_line('Bank card deleted!');
end delete_bankCard;
end;

update customer set login = customer.firstName || 'User' ;
update customer set pass = customer.firstname || substr(egn,1,4); 
alter table customer modify pass varchar2(1000)

update customer 
set pass = utl_raw.cast_to_varchar2(dbms_crypto.hash(utl_raw.cast_to_raw(pass), dbms_crypto.hash_sh256));
