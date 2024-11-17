#Acadia Assesment

#A) What % of sales result in a return?
SELECT (COUNT(ReturnOrderID) * 100)/ (Select COUNT(OrderID) AS Percent_Sales_With_Return FROM Acadia.ss)AS Percent_Sales_With_Return
FROM Acadia.ss 
WHERE ReturnOrderID IS NOT NULL;
 # Outpur: 1.6829

#B) What % of returns are full returns?
SELECT (COUNT(CASE WHEN FullReturn = 'True' THEN 1 END) * 100.0 / COUNT(ReturnOrderID)) AS Percent_Full_Returns
FROM Acadia.ss
WHERE ReturnOrderID IS NOT NULL;
  # Output: 16.72535

#C) What is the average return % amount (return % of original sale)?
SELECT AVG(ReturnAmtSales)*100 AS Avg_Return_Percent
FROM Acadia.ss
WHERE ReturnOrderID IS NOT NULL;
  # Output: 761.07

#D) What % of returns occur within 7 days of the original sale?
SELECT (COUNT(CASE WHEN RetunUnder7Days = '1' THEN 1 END) * 100.0 / COUNT(ReturnOrderID)) AS Percent_Returns_Within_7_Days
FROM Acadia.ss
WHERE ReturnOrderID IS NOT NULL;
  #Output: 48.59155
  
#E) What is the average number of days for a return to occur?
SELECT AVG(CAST(DateDifference AS SIGNED)) AS Avg_Days_To_Return
FROM Acadia.ss
WHERE ReturnOrderID IS NOT NULL;
  # Output: 58.8345
  
#F) Who is our most valuable customer?
SELECT CustomerID, SUM(CAST(REPLACE(NetSales, '$', '') AS DECIMAL(10,2))) AS Total_Net_Sales
FROM Acadia.ss
GROUP BY CustomerID
ORDER BY Total_Net_Sales DESC LIMIT 1;
  #output:Customer Id-HQARS21556 ,NetSales:39140.75
          

#Show Columns Data
Select SumSales from Acadia.ss;