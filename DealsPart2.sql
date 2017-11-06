#Name: Conor Feeney
#Purpose: Deals Part 2 - Completed Date: 11/06/2017


# Indicate that we are using the deals database
USE deals;  
# Execute a test query  
SELECT *
FROM Companies
WHERE CompanyName like "%Inc.";

# Select companies sorted by CompanyName
SELECT *
FROM Companies
ORDER BY CompanyID;

#Test Merge
SELECT DealName, PartNumber, DollarValue
FROM Deals a , dealparts b
WHERE a.DealID = b.DealID;

#Select dealparts using dollar value using a join
SELECT DealName, PartNumber, DollarValue
FROM Deals a join dealparts b
on a.DealID = b.DealID;

# Create a view that matches companies to deals
CREATE View CompanyDeals AS
SELECT DealName,RoleCode,CompanyName
FROM Companies
	JOIN Players ON (Companies.CompanyID = Players.CompanyID)
	JOIN Deals ON (Players.DealID = Deals.DealID)
ORDER BY DealName;

# A test of the CompanyDeals view
SELECT * FROM CompanyDeals;

#Creating a view that shows #parts and dollar value with each deal
#Drop View DealsValues;
CREATE VIEW DealsValues as 
SELECT DealID, count(PartNumber) as No_Parts, Sum(DollarValue) as Total_Dollar_Value
FROM dealparts
group by DealID;

SELECT * FROM DealsValues

#Creating a deals summary view
drop view DealSummary;
Create View DealSummary as 
SELECT a.DealID,DealName, No_Parts, Total_Dollar_Value, count(PlayerID) as No_PLayers TC.TypeCode
FROM Deals a 
#WHERE DealID in ( SELECT DealID, TypeCode FROM DealTypes group by dealID )
join dealsvalues b on a.DealID = b.DealID 
join players c on a.DealID = c.DealID
group by DealID;

SELECT * from DealSummary

#Creating view that shows # deals and value for each deal type
#drop view DealsByType;
Create View DealsByType as 
SELECT TypeCode, count(a.DealID) as No_Deals_Per_Type, sum(DollarValue) as Dollar_Value_Per_Type
FROM dealtypes a 
JOIN dealparts b on a.DealID=b.DealID
group by TypeCode;

SELECT * FROM DealsByType

#Creating view that shows Company names and roles
#drop view DealPlayers;
Create View DealPlayers as 
SELECT Distinct a.CompanyID, b.CompanyName, a.RoleCode
FROM Players a 
JOIN companies b on a.CompanyID = b.CompanyID
JOIN rolecodes c on a.RoleCode = c.RoleCode
ORDER BY  c.RoleSortOrder ASC;

SELECT * FROM DealPlayers 

#Create a Summary view for firms showing # deals and value per firm
#drop view DealsByFirm;
Create View DealsByFirm as 
SELECT a.FirmID, Count(C.DealID) as No_Of_Deals_Per_Firm, sum(D.DollarValue) as Dollar_Value_Per_Firm
FROM firms a
Left JOIN playersupports b on a.firmID = b.FirmID
JOIN players c on b.PlayerID = c.PlayerID
JOIN dealparts d on c.DealID = d.DealID
group by a.firmID;

select * from DealsByFirm
