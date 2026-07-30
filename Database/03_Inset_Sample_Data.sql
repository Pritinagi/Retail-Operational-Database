USE RetailOperationalDatabase
GO
/*==========--Categories_Data--==========*/
INSERT INTO dbo.Categories (Category_Name)
VALUES
	('Electronics'),
	('Grocery'),
	('Stationery'),
	('Home & Kitchen'),
	('Clothing'),
	('Sports'),
	('Toys'),
	('Furniture');


/*==========--Products_Data--==========*/
INSERT INTO dbo.Products (Product_Name,Product_Price,Category_Id)
VALUES 
	('Laptop', 85000.00, 101),
	('Wireless Mouse', 800.00, 101),
	('Smartphone', 15000.00, 101),
	('Rice', 750.00, 102),
	('Cooking Oil', 250.00, 102),
	('Notebook', 40.00, 103),
	('Ball Pen', 8.00, 103),
	('Coffee Mug', 225.00, 104),
	('Water Bottle', 200.00, 104),
	('T-Shirt', 600.00, 105),
	('Jeans', 900.00, 105),
	('Football', 900.00, 106),
	('Cricket Bat', 2000.00, 106),
	('Teddy Bear', 1200.00, 107),
	('Office Chair', 2100.00, 108);

/*==========--Stores_Data--==========*/
INSERT INTO dbo.Stores(Store_Name,Store_City)
VALUES 
	('Central Plaza','Delhi'),
	('City Mall','Mumbai'),
	('Tech Square','Bengaluru'),
	('Lake View','Chandigarh');


/*==========--Employees_Data--==========*/
INSERT INTO dbo.Employees (Employee_Name,Employee_Role,Store_Id)
VALUES  
	('Rahul Sharma','Manager',301),
	('Priya Verma','Cashier',301),
	('Amit Singh','Sales Associate',301),
	('Neha Gupta','Manager',302),
	('Arjun Patel','Cashier',302),
	('Sneha Kapoor','Sales Associate',302),
	('Vikram Rao','Manager',303),
	('Pooja Nair','Cashier',303),
	('Karan Mehta','Sales Associate',303),
	('Anjali Sharma','Manager',304),
	('Rohit Kumar','Cashier',304),
	('Simran Kaur','Sales Associate',304);



/*==========--Customers_Data--==========*/
INSERT INTO dbo.Customers(Customer_Name,Customer_Email,Customer_Phone)
VALUES
	('Aarav Sharma','aarav.sharma@email.com','9876500001'),
	('Diya Verma','diya.verma@email.com','9876500011'),
	('Rohan Gupta','rohan.gupta@email.com','9876500021'),
	('Meera Kapoor','meera.kapoor@email.com','9876500031'),
	('Arjun Singh','arjun.singh@email.com','9876500041'),
	('Kavya Patel','kavya.patel@email.com','9876500051'),
	('Vivaan Mehta','vivaan.mehta@email.com','9876500061'),
	('Ananya Nair','ananya.nair@email.com','9876500071'),
	('Isha Sharma','isha.sharma@email.com','9876500081'),
	('Kabir Joshi','kabir.joshi@email.com','9876500091'),
	('Sana Khan','sana.khan@email.com','9876500111'),
	('Yash Agarwal','yash.agarwal@email.com','9876500121'),
	('Mohit Jain','mohit.jain@email.com','9876500131'),
	('Nidhi Bansal','nidhi.bansal@email.com','9876500141'),
	('Yashika Kumari','yashika.kumari@email.com','9876500151');



/*==========--Orders_Data--==========*/
INSERT INTO dbo.Orders(customer_Id, Employee_Id,Order_Date,Total_amount)
VALUES 
	( 501, 401, '2026-01-05 10:15', 85000.00),
	( 502, 402, '2026-01-07 12:40', 120.00),
	( 503, 404, '2026-01-10 15:20', 2000.00),
	( 501, 403, '2026-01-18 11:10', 450.00),
	( 505, 405, '2026-02-02 14:00', 1200.00),
	( 506, 406, '2026-02-05 09:50', 4000.00),
	( 507, 407, '2026-02-10 17:10', 70800.00),
	( 508, 408, '2026-02-18 16:20', 750.00),
	( 509, 409, '2026-03-01 10:45', 2000.00),
	( 510, 410, '2026-03-08 13:30', 1800.00),
	( 501, 401, '2026-03-15 11:00', 950.00),
	( 511, 411, '2026-03-20 18:10', 600.00),
	( 512, 412, '2026-04-02 10:20', 15700.00),
	( 513, 402, '2026-04-10 15:40', 450.00),
	( 514, 405, '2026-04-15 12:10', 4400.00),
	( 515, 406, '2026-05-01 14:30', 250.00),
	( 503, 407, '2026-05-08 16:00', 1200.00),
	( 506, 408, '2026-05-15 09:15', 1250.00),
	( 509, 409, '2026-06-01 17:20', 7000.00),
	( 501, 410, '2026-06-10 10:00', 1400.00);


/*==========--OrderItems_Data--==========*/
INSERT INTO dbo.OrderItems(Order_Id,Product_Id,Quantity,Unit_Price)
VALUES
	(1001, 201, 1, 85000.00),
	(1002, 206, 2, 40.00),
	(1002, 207, 5, 8.00),
	(1003, 215, 1, 1500.00),
	(1004, 208, 2, 225.00),
	(1005, 212, 1, 900.00),
	(1006, 203, 1, 3500.00),
	(1007, 201, 1, 70000.00),
	(1008, 209, 3, 200.00),
	(1009, 213, 1, 2000.00),
	(1010, 211, 2, 900.00),
	(1011, 205, 2, 250.00),
	(1011, 204, 3, 150.00),
	(1012, 210, 1, 500.00),
	(1013, 203, 1, 15000.00),
	(1014, 207, 10, 30.00),
	(1015, 215, 2, 2100.00),
	(1016, 208, 1, 250.00),
	(1017, 212, 1, 1100.00),
	(1018, 205, 2, 425.00),
	(1019, 203, 1, 6500.00),
	(1020, 210, 2, 600.00),
	(1003, 208, 2, 250.00),
	(1005, 209, 2, 150.00),
	(1006, 202, 1, 500.00),
	(1007, 202, 1, 800.00),
	(1008, 206, 5, 30.00),
	(1012, 207, 5, 20.00),
	(1013, 202, 2, 350.00),
	(1014, 206, 3, 50.00),
	(1015, 208, 1, 200.00),
	(1017, 209, 1, 100.00),
	(1018, 204, 2, 200.00),
	(1019, 202, 1, 500.00),
	(1020, 208, 2, 100.00);


/*==========--Inventory_Data--==========*/
INSERT INTO dbo.Inventories(Store_Id,Product_Id,Quantity)
VALUES 
	(301, 201, 10),
	(301, 202, 30),
	(301, 203, 15),
	(301, 206, 80),
	(301, 207, 200),
	(302, 204, 60),
	(302, 205, 45),
	(302, 208, 35),
	(302, 209, 50),
	(302, 210, 25),
	(303, 201, 8),
	(303, 211, 20),
	(303, 212, 18),
	(303, 213, 12),
	(303, 215, 10),
	(304, 203, 9),
	(304, 206, 40),
	(304, 210, 22),
	(304, 214, 30),
	(304, 215, 6);



/*==========--Payments_Data--==========*/
INSERT INTO dbo.Payments(Order_Id,Payment_Date,Payment_Method)
VALUES
	(1001, '2026-01-05 10:20', 'Credit Card'),
	(1002, '2026-01-07 12:45', 'UPI'),
	(1003, '2026-01-10 15:25', 'Debit Card'),
	(1004, '2026-01-18 11:15', 'Cash'),
	(1005, '2026-02-02 14:05', 'UPI'),
	(1006, '2026-02-05 09:55', 'Credit Card'),
	(1007, '2026-02-10 17:15', 'Debit Card'),
	(1008, '2026-02-18 16:25', 'Cash'),
	(1009, '2026-03-01 10:50', 'UPI'),
	(1010, '2026-03-08 13:35', 'Credit Card'),
	(1011, '2026-03-15 11:05', 'Cash'),
	(1012, '2026-03-20 18:15', 'UPI'),
	(1013, '2026-04-02 10:25', 'Debit Card'),
	(1014, '2026-04-10 15:45', 'Cash'),
	(1015, '2026-04-15 12:15', 'Credit Card'),
	(1016, '2026-05-01 14:35', 'UPI'),
	(1017, '2026-05-08 16:05', 'Cash'),
	(1018, '2026-05-15 09:20', 'Debit Card'),
	(1019, '2026-06-01 17:25', 'Credit Card'),
	(1020, '2026-06-10 10:05', 'UPI');