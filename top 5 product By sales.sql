-- top 5 product By sales
SELECT Product,sum(Total_Sales) as Total_Sales
FROM dataset.amazon_sales
group by Product
order by Total_Sales desc
limit 5