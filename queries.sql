EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"


--1.	Functional Requirement 1: A list of what restaurants serve a specific food.  
SELECT s.Name
 FROM [Stores And Restaurants] s, Inventory i, Offer o
Where i.Name='noodles' And i.[Inventory ID]=o.[Inventory ID] AND s.[Store Restraunt ID]=o.[Store Restraunt ID];


--2.	Functional Requirement 2: A list of the what a specific employee is trained to do. 
SELECT t.[Training ID], t.[Description], e.Name
FROM Training t, [Trained To] tt, Employees e
WHERE e.[Employee ID] = tt.[Employee ID] AND 
   tt.[Training ID] = t.[Training ID] AND e.[Name] = 'Jermaine Randall'


--3.	Functional Requirement 3: The number of seasonal and year round employees.
   SELECT c.[Contract Type], COUNT(*)
FROM [Contract] c, Employees e
WHERE e.[Contract ID] = c.[Contract ID]
GROUP BY c.[Contract Type]


--4.	Functional Requirement 4: All the disciplinary write ups for a specific employee.
 SELECT wu.Reason, wu.Date, wu.Time, e1.Name
FROM Employees e, [Write Up] wu, Employees e1
WHERE e.[Employee ID] = wu.[Employee ID] AND
              wu.[Supervisor ID] = e1.[Employee ID] AND e1.Name = 'Mia Burt'


--5.	Functional Requirement 5: The number of season pass holders for each season. 
SELECT s.Name, COUNT(*)
FROM Season s, [Season Passes] sp
WHERE s.[Season ID] = sp.[Season ID]
GROUP BY s.Name


--6.	Functional Requirement 6: Then number of rides, buildings and restraints/stores in each sub park. 
SELECT [Sub Park ID], COUNT([Building ID]) AS [Num of Buildings] INTO tableb
FROM Buildings 
GROUP BY [Sub Park ID]

SELECT [Sub Park ID], COUNT([Ride ID]) AS [Num of Rides] INTO tabler
FROM Rides
GROUP BY [Sub Park ID]

SELECT [Sub Park ID], COUNT([Store Restraunt ID]) AS [Num of Stores and Restaurants] INTO tablesr
FROM [Stores And Restaurants] 
GROUP BY [Sub Park ID]

SELECT * 
FROM tablesr sr, tabler r, tableb b
WHERE sr.[Sub Park ID] = r.[Sub Park ID] AND 
r.[Sub Park ID] = b.[Sub Park ID]


--7.	Functional Requirement 7: The GPS coordinates for all the bathrooms. 
SELECT b.[GPS Coordinates]
FROM Buildings b, [General Use] gu
WHERE b.[General Use ID] = gu.[General Use ID]


--8.	Functional Requirement 8: The number of current season pass holders in each city. 
SELECT sp.City, COUNT(*)
FROM Season s, [Season Passes] sp
WHERE s.[Season ID] = sp.[Season ID] AND s.Name = 'Hall Vang'
GROUP BY sp.City

--9.    Functional Requirement 9: Find the use of a building. 
SELECT gu.[Use Description]
FROM [General Use] gu, Buildings b
WHERE b.[Building ID] = 5 AND b.[Building ID] = gu.[General Use ID]


--10.	Functional Requirement 10: All employees who have been trained to work in at least two different positions and have received no disciplinary write ups. 
SELECT tt.[Employee ID] INTO newtable
FROM [Trained To] tt
GROUP BY tt.[Employee ID]
HAVING COUNT(*)>=0


SELECT [Employee ID]
FROM newtable
WHERE [Employee ID] NOT IN (SELECT [Employee ID] FROM [Write Up])

GO