-------------------------------Exploratory Data-------------------------------------
------------knowing the date that we have 
SELECT column_name, data_type,character_maximum_length
FROM information_schema.columns
where table_name='walmart';
------ add column name day to table 
ALTER TABLE walmart 
ADD COLUMN day varchar(15);
------ add column name month to table 
ALTER TABLE walmart 
ADD COLUMN month varchar(15);
------- add column name time_of_day
ALTER TABLE walmart 
add column time_of_day varchar (10);

------------update time_of_day
update walmart
set time_of_day = (case when time between TIME '00:00:00' and '12:00:00'then 'Morning'
     when time between  TIME '12:01:00' and '18:00:00' then 'Afternoon'
	 ELSE 'Evening'
	 END);
------update day column
update  walmart
set day = TO_CHAR(date,'day')
------update month column
update  walmart
set month = TO_CHAR(date,'Month')
-------------- well done the columns day and month  add to table 
------ how many branch are there in the dataset 
SELECT DISTINCT branch
FROM walmart
--------how many city Are there in the  dataset?
SELECT DISTINCT city
FROM walmart
---------how many costumer_type Are there in the dataset? 
SELECT DISTINCT customer_type
FROM walmart 
--------- how many gender are there are in the dateset?
SELECT DISTINCT gender 
FROM walmart 

----------- how many product_line are there in the dataset?
SELECT DISTINCT  product_line
FROM walmart 
------------- What Are the Months Present in the Dataset?
SELECT DISTINCT month 
FROM walmart
------------------------------Business Questions To Answer----------------------------
---What is the most common payment method?
SELECT payment_method,count(*) as count
FROM walmart
GROUP BY payment_method
ORDER BY count DESC;
---What is the most selling product line?
SELECT product_line, count(*) as count 
FROM walmart 
GROUP BY product_line
ORDER BY count DESC;
---What is the total revenue by month?
SELECT  month,sum(total) as sum_total
FROM walmart
GROUP BY month
ORDER BY sum_total DESC;
---What month had the largest COGS?
SELECT  month,sum(cogs) as sum_cogs
FROM walmart
GROUP BY month
ORDER BY sum_cogs DESC;
---What product line had the largest revenue?
SELECT product_line,sum(gross_income) as sum_income
FROM walmart
GROUP BY product_line
ORDER BY sum_income DESC;

--What is the city with the largest revenue?
SELECT city,sum(gross_income) as sum_income
FROM walmart
GROUP BY city
ORDER BY sum_income DESC;
--What product line had the largest VAT?

SELECT product_line,MAX(vat) AS largest_vat
FROM walmart
GROUP BY product_line
ORDER BY largest_vat DESC;

--Which branch sold more products than average product sold?
SELECT branch, sum(quantit) 
FROM walmart
GROUP BY branch
HAVING sum(quantit)>(SELECT AVG(quantit) FROM walmart)
---What is the most common product line by gender?
SELECT gender,product_line,count(*)
FROM walmart
GROUP BY gender,product_line 
ORDER BY product_line DESC
---What is the average rating of each product line?
SELECT product_line,ROUND(avg(retting),2) as ratting_avg
FROM walmart
GROUP BY product_line
ORDER BY ratting_avg DESC

----Number of sales made in each time of the day per weekday
SELECT day, time_of_day,SUM(quantit) sum_quantit
FROM walmart 
GROUP BY day, time_of_day
ORDER BY sum_quantit DESC;
---- Customer Type with Highest Order Volume ?
SELECT customer_type, count(*) as count 
FROM walmart 
GROUP BY customer_type
ORDER BY count DESC

---Which of the customer types brings the most revenue?
SELECT customer_type,sum(total) as total_rev
FROM walmart
GROUP BY customer_type
ORDER BY total_rev DESC

----Which customer type pays the most in VAT?
SELECT customer_type,sum(vat) as most_vat
FROM walmart
GROUP BY customer_type
ORDER BY most_vat DESC 

------What is the gender of most of the customers?
SELECT gender,count(*) as count
FROM walmart
GROUP BY gender 
ORDER BY count DESC

-------What is the gender distribution per branch?
SELECT gender,branch,count(*) as count
FROM walmart
GROUP BY gender, branch
ORDER BY branch 
--------Which time of the day do customers give most retings?
SELECT  time_of_day,count(retting) as retting_time_of_day 
FROM walmart 
GROUP BY time_of_day
ORDER BY retting_time_of_day DESC

-----Which time of the day do customers give most ratings per branch?
SELECT time_of_day,branch,count(*) as most_retting_per_branch
FROM walmart
GROUP BY time_of_day,branch
ORDER BY branch 

-----Which day of the week has the best avg ratings?
SELECT day, ROUND(avg(retting),2) as avg_retting
FROM walmart
GROUP BY day
ORDER BY avg_retting DESC

------Which day of the week has the best average ratings per branch?
SELECT day,branch, ROUND(avg(retting),2) as avg_retting
FROM walmart
GROUP BY day,branch
ORDER BY avg_retting Desc;
----Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, ROUND(AVG(vat),2) as largest_tax
FROM walmart 
GROUP BY city
ORDER BY largest_tax DESC
---------Which Product Line Has the Biggest Margin Profit ?
SELECT product_line,sum(gross_income) as count
FROM walmart
GROUP BY product_line
ORDER BY count DESC;

----Distribution of Customers per City?
SELECT city,customer_type, count(*) count
FROM walmart
GROUP BY city,customer_type
ORDER BY city 

