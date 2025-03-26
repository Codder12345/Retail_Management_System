
######==========###create database #####============######
create database RetailSystem;

###========Use Database======#######
use RetailSystem;


###=======create User Login table==============######
create table User( 
  UserID int(4) primary key auto_increment ,
  UserName  varchar(200),
  Password varchar(50),
  RoleID int ,foreign key(roleID) references Role(roleID)
  )
  
 ######================Create Role table===============#########
 
   create table Role(
   roleID int primary key Auto_increment,
   roleName varchar(200) unique not null
   );
   
 ###====================create Product  table=============########
 
  create table Products(
  ProductID int primary key auto_increment,
  ProductName varchar(200),
  ProductPrice Double(10,2),
  PCategory varchar(200),
  PBrand varchar(200),
  StockQuantity int not null
  );
   
   

   ##=================== create Customer Table=======================#####
   create table Customer(
   CustomerID int primary key auto_increment,
   CustomerName varchar(200) not null,
   contactInfo varchar(100), 
   userId int  unique,
   foreign  key( UserID ) references user( UserID )
   );
   
   ###===============Orders tables=============####
 CREATE TABLE Orders (
    orderId int  PRIMARY KEY AUTO_INCREMENT,
    customerId int ,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    totalAmount DOUBLE,
    FOREIGN KEY (CustomerID ) REFERENCES Customer(CustomerID )
);


####==============OrderDetails table ========================##########

create table OrderDetails (
  orderDetaiIlD int primary key auto_increment,
  orderID int,
  ProductID int,
  Quantity int  not null,
  Subtotal  Double not null,
  foreign key(orderID) references Orders(orderID),
  foreign key(ProductID) references Products (ProductID) 
  
);


###==================posystem table==================##############

create table Posystem (
PosID int primary key auto_increment,
cart json,
totalAmt Double
);


#####==================DashBoard Table for Reports=================####################
create table DashBoard(
 reportID int primary key auto_increment,
 reportType varchar(200),
 GenerateDate date,
 Details json
);


##============Inventory System tables ============###########

create table Inventory(
InvenID int primary key auto_increment,
ProductID int ,
Stocklevel int not null,
lowStockAlert boolean default false,
foreign key(ProductID)  references Products (ProductID)
  );
  
 ###======================################+Display All Tables+#############====================### 
 
 
 select * from User;
 
 select * from Role;
 select * from Customer;
 select * from  orders;
 select * from orderDetails;
 select * from Products;
 select * from Posystem;
 select * from DashBoard;
 select * from Inventory;