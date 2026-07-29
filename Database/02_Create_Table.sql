USE RetailOperationalDatabase;
GO
/*==========--Category_Table--==========*/
CREATE TABLE dbo.Categories
(
	Category_Id INT IDENTITY(101,1) ,
	Category_Name VARCHAR(50) NOT NULL,

	CONSTRAINT UQ_Category_Category_Name
		UNIQUE (Category_Name),

	CONSTRAINT PK_Category_Category_Id
		PRIMARY KEY (Category_Id)

);
/*==========--Product_Table--==========*/
CREATE TABLE dbo.Products
(
	Product_Id INT IDENTITY(201,1),
	Product_Name VARCHAR(50) NOT NULL,
	Product_Price DECIMAL(10,2) NOT NULL,
	Category_Id INT NOT NULL ,

	CONSTRAINT PK_Product_Product_Id
		PRIMARY KEY (Product_Id),

	CONSTRAINT UQ_Product_Category_Name
		UNIQUE (Category_Id,Product_Name),

	CONSTRAINT FK_Product_Category_Id
		FOREIGN KEY (Category_Id)
		REFERENCES dbo.Categories(Category_Id)
);


/*==========--Store_Table--==========*/

CREATE TABLE dbo.Stores
(

	Store_Id INT IDENTITY(301,1),
	Store_Name VARCHAR(50) NOT Null,
	Store_City VARCHAR(50) NOT Null,

	CONSTRAINT PK_Store_Store_Id
		PRIMARY KEY (Store_Id),

	CONSTRAINT UQ_Store_Store_name
		UNIQUE(Store_name,Store_City)


)


/*==========--Employee_Table--==========*/
CREATE TABLE dbo.Employees
(

	Employee_Id INT IDENTITY(401,1),
	Employee_Name VARCHAR(50) NOT NULL,
	Employee_Role VARCHAR(50) NOT NULL,
	Store_Id INT NOT NULL,

	CONSTRAINT PK_Employee_Employee_Id
		PRIMARY KEY (Employee_Id),
	CONSTRAINT FK_Employee_Store_Id
		FOREIGN KEY (Store_Id)
		REFERENCES dbo.Stores(Store_Id)
)


/*==========--Customer_Table--==========*/
CREATE TABLE  dbo.Customers
(

	Customer_Id INT IDENTITY(501,1),
	Customer_Name VARCHAR(50) NOT NULL,
	Customer_Email VARCHAR(50),
	Customer_Phone VARCHAR(15),

	CONSTRAINT PK_Customer_Customer_Id
		PRIMARY KEY (Customer_Id),
	CONSTRAINT UQ_Customer_Customer_Email
		UNIQUE(Customer_Email),
	CONSTRAINT UQ_Customer_Customer_Phone
		UNIQUE(Customer_Phone)
)

/*==========--Order_Table--==========*/
CREATE TABLE dbo.Orders
(

Order_Id INT IDENTITY(1001,1),
Customer_Id INT NOT NULL,
Employee_Id INT NOT NULL, 
Order_Date DATETIME NOT NULL,
Total_Amount DECIMAL(10,2) NOT NULL,


CONSTRAINT PK_Order_Order_Id
	PRIMARY KEY(Order_Id),
CONSTRAINT FK_Order_Customer_Id
	FOREIGN KEY(Customer_Id)
	REFERENCES dbo.Customers(Customer_Id), 

CONSTRAINT FK_Order_Employee_Id
	FOREIGN KEY(Employee_Id)
	REFERENCES dbo.Employees(Employee_Id)


)

/*==========--OrderItem_Table--==========*/
CREATE TABLE dbo.OrderItems
(

OrderItem_Id INT IDENTITY(2001,1),
Order_Id INT NOT NULL,
Product_Id INT NOT NULL,
Quantity INT NOT NULL,
Unit_Price Decimal(10,2) NOT NULL,


CONSTRAINT PK_OrderItem_OrderItem_Id
	PRIMARY KEY(OrderItem_Id),
CONSTRAINT FK_OrderItems_Order_Id
	FOREIGN KEY(Order_Id)
	REFERENCES dbo.Orders(Order_Id),
CONSTRAINT FK_OrderItems_Product_Id
	FOREIGN KEY(Product_Id)
	REFERENCES dbo.Products(Product_Id),
CONSTRAINT UQ_OrderItem_OrderDetails
	UNIQUE(Order_Id,Product_id)
)
/*==========--Inventory_Table--==========*/
CREATE TABLE dbo.Inventories
(

Inventory_Id INT IDENTITY(3001,1),
Store_Id INT NOT NULL,
Product_Id INT NOT NULL,
Quantity INT NOT NULL,


CONSTRAINT PK_Inventories_Inventory_Id
	PRIMARY KEY(Inventory_Id),
CONSTRAINT FK_Inventories_Store_Id
	FOREIGN KEY(Store_Id)
	REFERENCES dbo.Stores(Store_Id),
CONSTRAINT FK_Inventories_Product_Id
	FOREIGN KEY(Product_Id)
	REFERENCES dbo.Products(Product_Id),
CONSTRAINT UQ_Inventory_Store_Product
	UNIQUE(Store_Id,Product_Id)
)

/*==========--Payments_Table--==========*/
CREATE TABLE dbo.Payments
(

Payment_Id INT IDENTITY(4001,1),
Order_Id INT NOT NULL,
Payment_Date DATETIME ,
Payment_Method VARCHAR(50) NOT NULL,

CONSTRAINT PK_Payments_Payment_id
	PRIMARY KEY(Payment_Id),
CONSTRAINT FK_Payments_Order_Id
	FOREIGN KEY(Order_Id)
	REFERENCES dbo.Orders(Order_Id),
CONSTRAINT UQ_Payments_Order
	UNIQUE(Order_Id)

)