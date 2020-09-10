EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"

CREATE TABLE [Employees]
([Employee ID] int NOT NULL,
[SSN] VARCHAR(13) NOT NULL,
[Birthday] VARCHAR(255) NOT NULL,
[Phone Number] VARCHAR(100) NOT NULL,
[Name] VARCHAR(255) NOT NULL,
[Contract ID] int NOT NULL,
[Street] VARCHAR(255) NOT NULL, 
[City] VARCHAR(255) NOT NULL,
[Zip Code] VARCHAR(10) NOT NULL,
[State] VARCHAR(50) NOT NULL,
[Emergency Name] VARCHAR(255) NOT NULL,
[Emergency Phone Number] VARCHAR(100) NOT NULL,
[Supervisor Employee ID] VARCHAR(13) NOT NULL,
PRIMARY KEY([Employee ID])
);


SELECT * FROM Employees

CREATE TABLE [Contract]
([Contract ID] int NOT NULL,
[Contract Type] VARCHAR(255) NOT NULL,
PRIMARY KEY([Contract ID])
);


SELECT * FROM Contract

CREATE TABLE [Training]
([Training ID] int NOT NULL,
[Title] VARCHAR(255) NOT NULL,
[Description] VARCHAR(MAX) NOT NULL,
[Duration] int NOT NULL,
PRIMARY KEY([Training ID])
);


SELECT * FROM Training

CREATE TABLE [Trained To]
([Employee ID] int NOT NULL,
[Trainer Employee ID] int NOT NULL,
[Training ID] int NOT NULL,
[Date Trained] VARCHAR(255) NOT NULL,
PRIMARY KEY([Employee ID], [Training ID])
);


SELECT * FROM [Trained To]

CREATE TABLE [Work At]
([Employee ID] int NOT NULL,
[Position ID] int NOT NULL,
PRIMARY KEY([Employee ID], [Position ID])
);


SELECT * FROM [Work At]

CREATE TABLE [Positions]
([Position ID] int NOT NULL,
[Required Training ID] int NOT NULL,
[Description] VARCHAR(MAX) NOT NULL,
PRIMARY KEY([Position ID])
);


SELECT * FROM [Positions]

CREATE TABLE [Write Up]
([Write Up ID] int NOT NULL,
[Employee ID] int NOT NULL,
[Supervisor ID] int NOT NULL,
[reason] VARCHAR(MAX) NOT NULL,
[date] VARCHAR(255) NOT NULL,
[time] VARCHAR(255) NOT NULL,
PRIMARY KEY([Write Up ID])
);


SELECT * FROM [Write Up]

CREATE TABLE [Season Passes]
([Season Pass ID] int NOT NULL,
[Street] VARCHAR(255) NOT NULL, 
[City] VARCHAR(255) NOT NULL,
[Zip Code] VARCHAR(10) NOT NULL,
[State] VARCHAR(50) NOT NULL,
[Birthday] VARCHAR(255) NOT NULL, 
[Phone Number] VARCHAR(100) NOT NULL,
[Name] VARCHAR(255) NOT NULL,
[Purchase Date] VARCHAR(255) NOT NULL,
[Credit Card Number] VARCHAR(255) NOT NULL,
[Season ID] int NOT NULL,
[Sold By Employee ID] int NOT NULL,
PRIMARY KEY([Season Pass ID])
);


SELECT * FROM [Season Passes]

CREATE TABLE [Season]
([Season ID] int NOT NULL, 
[Name] VARCHAR(255) NOT NULL,
PRIMARY KEY([Season ID])
);



SELECT * FROM [Season]

CREATE TABLE [Sub Park]
([Sub Park ID] int NOT NULL, 
[Name]  VARCHAR(255) NOT NULL,
[Theme]  VARCHAR(255) NOT NULL,
PRIMARY KEY([Sub Park ID])
);


SELECT * FROM [Sub Park]

CREATE TABLE [Buildings]
([Building ID] int NOT NULL, 
[Sub Park ID] int NOT NULL, 
[Name] VARCHAR(255) NOT NULL,
[GPS Coordinates] VARCHAR(30) NOT NULL, 
[General Use ID] int NOT NULL,
PRIMARY KEY([Building ID],[Sub Park ID])
);


SELECT * FROM [Buildings]

CREATE TABLE [General Use]
([General Use ID] int NOT NULL, 
[Use Description] VARCHAR(MAX) NOT NULL,
PRIMARY KEY([General Use ID])
);


SELECT * FROM [General Use]

CREATE TABLE [Rides]
([Ride ID] int NOT NULL, 
[Sub Park ID] int NOT NULL,
[Name] VARCHAR(255) NOT NULL,
[Theme] VARCHAR(255) NOT NULL,
[Ride Release] VARCHAR(255) NOT NULL,
[GPS Coordinates] VARCHAR(30) NOT NULL,
PRIMARY KEY([Ride ID], [Sub Park ID])
);


SELECT * FROM [Rides]

CREATE TABLE [Stores And Restaurants]
([Store Restraunt ID] int NOT NULL,
[Sub Park ID] int NOT NULL,
[Name] VARCHAR(255) NOT NULL,
[GPS Coordinates] VARCHAR(30) NOT NULL,
[Description] VARCHAR(MAX) NOT NULL,
PRIMARY KEY([Store Restraunt ID], [Sub Park ID])
);


SELECT * FROM [Stores And Restaurants]

CREATE TABLE [Inventory]
([Inventory ID] int NOT NULL, 
[Supplier] VARCHAR(255) NOT NULL,
[Name] VARCHAR(255) NOT NULL,
PRIMARY KEY([Inventory ID])
);


SELECT * FROM [Inventory]

CREATE TABLE [Offer]
([Store Restraunt ID] int NOT NULL, 
[Inventory ID] int NOT NULL,
PRIMARY KEY([Store Restraunt ID],[Inventory ID])
);


SELECT * FROM Offer



GO