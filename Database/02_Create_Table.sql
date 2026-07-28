USE RetailOperationalDatabase;
GO
/*==========--Category_Table--==========*/
CREATE TABLE dbo.Categories
(
	Category_Id INT IDENTITY(101,1) ,
	Category_Name VARCHAR(50) NOT NULL,

	CONSTRAINT UQ_Category_Name
		UNIQUE (Category_Name),

	CONSTRAINT Pk_Category_Id
		PRIMARY KEY (Category_Id)

);


/*==========--Product_Table--==========*/
CREATE TABLE dbo.Products
(
	Product_Id INT IDENTITY(201,1),
	Product_Name VARCHAR(50) NOT NULL,
	Product_Price DECIMAL(10,2) NOT NULL,
	Category_Id INT NOT NULL ,

	CONSTRAINT Pk_Product_Id
		PRIMARY KEY (Product_Id),

	CONSTRAINT UQ_Product_Category_Name
		UNIQUE (Category_Id,Product_Name),

	CONSTRAINT Fk_Product_Category
		FOREIGN KEY (Category_Id)
	REFERENCES dbo.Categories(Category_Id)
);



/*==========--Store_Table--==========*/

CREATE TABLE dbo.Stores
(

	Store_Id INT IDENTITY(401,1),
	Store_Name VARCHAR(50) NOT Null,
	Store_City VARCHAR(50) NOT Null,

	CONSTRAINT PK_Store_Id
		PRIMARY KEY (Store_Id),

	CONSTRAINT UQ_Store_name
		UNIQUE(Store_name,Store_City)


)