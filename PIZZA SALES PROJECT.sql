
select * from [dbo].[pizza_sales]
--A. KPI’s

select sum(total_price) as total_revenue from pizza_sales

select * from pizza_sales

select sum(total_price)/ count(distinct order_id) as Avg_order_value from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select  count(distinct order_id) as Total_orders from pizza_sales

select cast (cast (sum(quantity) as decimal (10,2))/ cast(count(distinct order_id)
as decimal(10,2)) as decimal (10,2)) as Pizza_per_order 
from pizza_sales

----------------------------------------------------------------
--B. Daily Trend for Total Orders
--------------------------------------------
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- C. Monthly Trend for Orders
-----------------------------------------------------------
Select DATENAME(month, Order_date) as Month_Name, Count(Distinct order_id) As Total_Orders
from Pizza_sales
group by DATENAME(MONTH,Order_Date)
Order by Total_Orders DESC

--D. % of Sales by Pizza Category
------------------------------------------------------------
Select Pizza_category,SUM(TOTAL_price) as total_sales , SUM(TOTAL_PRICE)*100 / (select sum(total_price) from pizza_sales)
As PCT from pizza_sales 
WHERE Month (order_date) = 1
Group By pizza_category

---E. % of Sales by Pizza Size
------------------------------------------------------------------

Select Pizza_size,CAST(SUM(TOTAL_price) AS DECIMAL (10,2)) as total_sales ,

cast(SUM(TOTAL_PRICE)*100 / (select sum(total_price)  from pizza_sales) as DECIMAL (10,2))
As PCT from pizza_sales 
WHERE DATEPART (quarter, order_date) = 1
Group By pizza_size
Order By PCT DESC

--F. Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--G. Top 5 Pizzas by Revenue
Select  TOP 5 Pizza_name,SUM(TOTAL_price)  as total_revenue from pizza_sales
Group By pizza_name
Order By total_revenue desc

--H. Bottom 5 Pizzas by Revenue
Select  top 5 Pizza_name,SUM(TOTAL_price)  as total_revenue from pizza_sales
Group By pizza_name
Order By total_revenue ASC

--I. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--J. Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--K. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--L. Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC













