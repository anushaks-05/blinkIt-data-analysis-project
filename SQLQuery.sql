select * from blinkit_data

select sum(Total_sales) as Total_sales
from blinkit_data

select cast(sum(Total_sales)/1000000 as decimal(10,2)) AS Total_sales_milllions
from blinkit_data
where Item_Fat_Content = 'Low Fat'

select cast(sum(Total_sales)/1000000 as decimal(10,2)) AS Total_sales_milllions
from blinkit_data
where Outlet_Establishment_Year = 2022

select cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales from blinkit_data
select COUNT(*) AS no_of_items from blinkit_data

select cast(AVG(Total_Sales) as decimal(10, 2)) AS anusha from blinkit_data
where Outlet_Establishment_Year = 2022

select COUNT(*) AS no_of_items from blinkit_data
where Outlet_Establishment_Year = 2022

select CAST(avg(rating) as decimal(10,2)) as avg_rating from blinkit_data


select item_fat_content, cast(SUM(total_sales) as decimal (10,2)) as total_sales from blinkit_data group by Item_Fat_Content
order by total_sales desc


select item_fat_content, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Item_Fat_Content
order by total_sales desc


select item_fat_content, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
where Outlet_Establishment_Year = 2022
group by Item_Fat_Content
order by total_sales desc

select item_fat_content, 
        cast(SUM(total_sales)/1000 as decimal (10,2)) as total_sales_thousand,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Item_Fat_Content
order by total_sales_thousand desc

select Item_Type, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales_thousand,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Item_Type
order by total_sales_thousand desc


select top 5 Item_Type, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales_thousand,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Item_Type
order by total_sales_thousand desc

select top 5 Item_Type, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales_thousand,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Item_Type
order by total_sales_thousand asc


SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

select  Outlet_Establishment_Year, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc


select  Outlet_Establishment_Year, 
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Outlet_Establishment_Year
order by total_sales desc

SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

SELECT Outlet_Location_Type,
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type,
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
FROM blinkit_data
where Outlet_Establishment_Year = 2022
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC


SELECT Outlet_Location_Type,
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
FROM blinkit_data
where Outlet_Establishment_Year = 2020
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Type,
        cast(SUM(total_sales) as decimal (10,2)) as total_sales,
		CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		cast(AVG(Total_Sales) as decimal(10, 1)) AS avg_sales,
		COUNT(*) AS no_of_items, 
		CAST(avg(rating) as decimal(10,2)) as avg_rating 
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC
