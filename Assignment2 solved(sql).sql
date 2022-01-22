Create database Superstores;
use Superstores;
select Customer_Name as CustomerName ,Customer_Segment as CustomerSegment from cust_dimen;
select * from cust_dimen order by Customer_Name desc;
select Order_ID,Order_Date from orders_dimen where Order_Priority='High';
select sum(sales) as Total_sales, avg(sales) as Avg_sales from market_fact;
select max(sales),min(sales) from market_fact;
select Region,count(*) as no_of_customers from cust_dimen group by region order by no_of_customers desc;
select Region,count(*) as no_of_customers from cust_dimen group by region order by no_of_customers desc limit 1;
select Customer_Name,count(*) as no_of_tables_purchased 
from market_fact as mf,cust_dimen as cd,prod_dimen as pd 
where mf.cust_id=cd.cust_id and 
mf.prod_id=pd.prod_id and
 pd.product_sub_category='Tables'and
 cd.region='Atlantic'
 group by customer_name;
select customer_name from cust_dimen
 where province='ontario' and customer_segment='small business';
 select prod_id,sum(order_quantity)as no_of_products_sold from market_fact group by prod_id order by sum(order_quantity) desc;
 select prod_id,product_sub_category from prod_dimen where 
 product_category ='Furniture' or product_category='Technology';
 select product_category ,profit from
 prod_dimen as pd ,market_fact as mf where
 pd.prod_id=mf.prod_id 
 group by product_category order by profit desc;
 select product_category,product_sub_category,profit from
 prod_dimen as pd ,market_fact as mf where
 pd.prod_id=mf.prod_id
 group by product_sub_category order by product_category;
 select order_date,order_quantity,sales from 
 orders_dimen as od,market_fact as mf 
 where od.ord_id=mf.ord_id group by order_date;
 select distinct customer_name from cust_dimen where customer_name like '_R%'or customer_name like '___D%';
 select cd.cust_id, cd.customer_name,cd.region,mf.sales from
 cust_dimen as cd inner join market_fact as mf 
 on cd.cust_id=mf.cust_id where sales between 1000 and 5000 group by cust_id; 
 select sales from(select sales from market_fact order by sales desc limit 3)as market_fact order by sales limit 1 ;
select cd.region,count(mf.ship_id)as no_of_shipments,mf.profit as profit_in_each_region from cust_dimen as cd
 inner join market_fact as mf on cd.cust_id=mf.cust_id  
 inner join prod_dimen as pd on mf.prod_id=pd.prod_id 
 where product_sub_category='STORAGE & ORGANIZATION' 
 group by region
order by profit desc; 
