--Find the top N customers with the highest total purchase amounts.
select top(10) * from shopping_trends_Data
order by Purchase_Amount_USD desc;

--Gender-Based Purchases: Calculate the total purchase amount for each gender category.
select SUM(Purchase_Amount_USD) as Purchase_Amount
from shopping_trends_Data
group by Gender;


--Popular Items by Category: Identify the most popular item in each category based on the number of purchases.
--select * from shopping_trends_Data;
SELECT Category, Item_Purchased, COUNT(*) AS PurchaseCount
FROM shopping_trends_Data
GROUP BY Category, Item_Purchased
ORDER BY PurchaseCount DESC;

--Customer Age Groups: Categorize customers into different age groups (e.g., 18-25, 26-35, etc.) and count the number of customers in each group.
select Customer_ID,Age
from shopping_trends_Data
where age Between 18 and 25;

--Items Sold by Season: Determine which items are sold the most during each season.
select Season,Item_Purchased,count(*) as itemcount from shopping_trends_Data
group by Season, Item_Purchased
order by itemcount;

--Highly Rated Items: List items with the highest average review ratings.
select * from shopping_trends_Data;
select Item_Purchased,AVG(Review_Rating) from shopping_trends_Data
group by Item_Purchased;

--Subscription Analysis: Calculate the average purchase amount for customers with a subscription versus those without a subscription.
select Subscription_Status,avg(Purchase_Amount_USD) as Average
from shopping_trends_Data
group by Subscription_Status;

--Discount Usage: Find out the percentage of customers who used a discount on their purchases.
select Discount_Applied,
(count(*) * 100.0) / (SELECT COUNT(*) FROM shopping_trends_Data) AS DiscountPercentage from shopping_trends_Data
group by Discount_Applied;

--Preferred Payment Method: Identify the most preferred payment method among customers.
select top(1) Payment_Method, count(Payment_Method) as Preffered_Payment from shopping_trends_Data
group by Payment_Method
order by Preffered_Payment;

--Shipping Preference: Analyze the most chosen shipping type (e.g., Express, Standard) by customers.
select Shipping_Type,count(*) as Shipping_Count from shopping_trends_Data
group by Shipping_Type;

--Repeat Customers: Find the number of customers who have made repeat purchases (more than one transaction).
select count(Customer_ID) from shopping_trends_Data
where Previous_Purchases > 1;

--Purchase Frequency Analysis: Determine the most common purchase frequency (e.g., Weekly, Monthly) among customers.
select Customer_ID,Frequency_of_Purchases, count(*) from shopping_trends_Data;

SELECT Frequency_of_purchases,count(Frequency_of_Purchases) as Frequency from shopping_trends_Data
group by Frequency_of_Purchases
order by Frequency desc;


--Location-Based Analysis: Analyze which locations have the highest and lowest total purchase amounts.
select Location,sum(Purchase_Amount_USD) as sum_amnt
from shopping_trends_Data
group by Location
order by sum_amnt;

--Color Preferences: Find out the most popular colors for purchased items.
select Color,count(color) as countofcolor
from shopping_trends_Data
group by color
order by countofcolor desc;

--Item Sizes Analysis: Identify the most commonly purchased item sizes.
select top(1) Size,count(Size) as Count_Of_Size from shopping_trends_Data
group by Size
order by Count_Of_Size desc;

--Promo Code Effectiveness: Analyze whether the use of promo codes correlates with higher purchase amounts.
select Promo_Code_Used,sum(Purchase_Amount_USD) as Total_Purchase_Amount from shopping_trends_Data
group by Promo_Code_Used;
--Seasonal Trends: Determine if there are any seasonal trends in purchase amounts or customer behaviors.
select Season,sum(Purchase_Amount_USD) as Per_Season_Amount from shopping_trends_Data
group by Season
order by Per_Season_Amount desc;
