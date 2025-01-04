CREATE DATABASE PIZZA_SALES;

USE PIZZA_SALES;

                       /* || Total Revenue || */
                      
Select concat( '$ ' , round(sum(`total_price`),2)) as Total_Revenue
from `pizza_sales`;

                       /* || Average Order Value || */
                       
Select round(sum(`total_price`) / count(distinct `order_id`), 2) as Avg_Order_Value
from `pizza_sales`;

                       /* || Total Pizzas Sold || */
                       
Select format(sum(`quantity`), "NO") as Total_Pizzas_Sold
from `pizza_sales`;

                       /* || Total Orders || */
                       
Select format(Count(distinct `order_id`), "NO") as Total_Order
from `pizza_sales`;

                       /* || Average Pizza Per Order || */
                       
Select round(sum(`quantity`) / count(distinct `order_id`),2) as Avg_Pizza_Per_Order
from `pizza_sales`;


                       /* || Daily Trend For Total Orders || */
                       
Select `Day Name` as Day, Round(Count(distinct `order_id`), "No") as Total_Orders
from `pizza_sales`
group by Day
order by Total_Orders ASC;

                       /* || Monthly Trend For Total Orders || */
                       
Select `Month Name` as Month, Round(Count(distinct `order_id`), "No") as Total_Orders
from `pizza_sales`
group by Month;

                       /* || % Sales by Pizza Category || */
                       
Select `pizza_category` as Pizza_Category, cast(sum(`total_price`) as decimal(10, 2)) as Total_Revenue,
cast(sum(`total_price`) * 100 / (select sum(`total_price`) from `pizza_sales`) as decimal(10, 2)) as PCT
from `pizza_sales`
group by Pizza_Category;

                       /* || % Sales by Pizza Size || */
                       
Select `pizza_size` as Pizza_Size, cast(sum(`total_price`) as decimal(10, 2)) as Total_Revenue,
cast(sum(`total_price`) * 100 / (select sum(`total_price`) from `pizza_sales`) as decimal(10, 2)) as PCT
from `pizza_sales`
group by Pizza_Size
order by Pizza_Size;

                       /* || Total Pizza Sold by Pizza Category || */
                       
Select `pizza_category` as Pizza_Category, format(sum(`quantity`), "NO") as Total_Pizza_Sold
from `pizza_sales`
group by Pizza_Category;

                       /* || Top 5 Pizzas by Revenue || */
					
Select `pizza_name` as Pizzas, concat("$ ", round(sum(`total_price`),2)) as Revenue
from `pizza_sales`
group by Pizzas
order by Revenue Desc
limit 5;

                       /* || Bottom 5 Pizzas by Revenue || */
                       
Select `pizza_name` as Pizzas, concat("$ ", round(sum(`total_price`),2)) as Revenue
from `pizza_sales`
group by Pizzas
order by Revenue Asc
limit 5;

                       /* || Top 5 Pizzas by Quantity || */
                       
Select `pizza_name` as Pizzas, sum(`quantity`) as Total_Pizza_Sold
from `pizza_sales`
group by Pizzas
order by Total_Pizza_Sold Desc
limit 5;

                       /* || Bottom 5 Pizzas by Quantity || */
                       
Select `pizza_name` as Pizzas, sum(`quantity`) as Total_Pizza_Sold
from `pizza_sales`
group by Pizzas
order by Total_Pizza_Sold ASC
limit 5;

                       /* || Top 5 Pizzas by Total Orders || */
                       
Select `pizza_name` as Pizzas, count( distinct `order_id`) as Total_Orders
from `pizza_sales`
group by Pizzas
order by Total_Orders Desc
limit 5;

                       /* || Bottom 5 Pizzas by Total Orders || */
                       
Select `pizza_name` as Pizzas, count( distinct `order_id`) as Total_Orders
from `pizza_sales`
group by Pizzas
order by Total_Orders Asc
limit 5;