show databases;
use database_zepto;
show tables;
desc zepto;
create Table zepto(s_id serial primary key,
Category varchar(120), name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock BOOLEAN,
quantity INTEGER);
-- check data imported properly or not  --
select * from zepto
limit 10;
-- check are they any null values
select * from zepto
where s_id is null or
category is null or
mrp is null or
discountPercent is null or
availableQuantity is null or
discountedSellingPrice is null or
weightInGms is null or
outOfStock is null or
quantity is null;
-- different product categories
select distinct category from zepto
order by category;
-- products in stock vs out of stock-- 
select count(*), outOfStock from zepto
group by outOfStock;
-- product present multiple times
select name, count(s_id) from zepto
group by name
having count(name)>1
order by count(s_id) desc;
-- data cleaning 
select * from zepto 
where mrp=0 or discountedSellingPrice=0;
-- update zepto set outOfStock=True where outOfStock=1;
delete from zepto
where s_id=3603;
rollback;
insert into zepto(s_id,Category,name,mrp,discountPercent,availableQuantity,discountedSellingPrice,weightInGms,outOfStock,quantity)values(3306,'Paan Corner','Dove Daily Shine Conditioner',19000,0,6,19000,175,0,180);
select mrp from zepto where s_id=3603;
-- 'convert paise to rupees'
update zepto 
set discountedSellingPrice=discountedSellingPrice/100,
mrp=mrp/100;
-- WAQDT best value products based on discount percentage;
select distinct name, discountPercent from zepto order by discountpercent desc
limit 10;
-- WAQDT HIGH PRICE PRODUCTS are OUT OF STOCK;
SELECT distinct name,mrp,outOfStock FROM ZEPTO where outOfStock =1 
order by mrp desc;
-- Calculate revenue of each cagtegory;
select sum(discountedSellingPrice*availableQuantity) revenue,category from zepto group by category
order by revenue;
-- WAQTD products mrp greater than 500 and discount is less than 10%;
select distinct name,mrp,discountPercent from zepto where discountPercent<10 and mrp>500
order by discountPercent desc;
-- WAQTD top 5 categories offering highest average discount percentage';
select distinct category, avg(discountPercent) highestAvGDiscount from zepto group by category 
order by highestAvGDiscount desc limit 5;
-- WAQTD to find price per graam for products above 100 grms and sort by best value;
select distinct weightInGms,name,round(discountedSellingPrice/weightInGms,2) per_gram_valuee from zepto where weightInGms>100
order by per_gram_valuee;
-- Group the product into categories like low , medium, bulk;
select distinct category, name,weightInGms, case when weightInGms <1000 then 'low' 
when weightInGms between 1000 and 5000 then 'medium'
else 'bulk' end as category from zepto;
-- wAQTD to find what is the total inventary weight per category;
select category, sum(weightInGms*availableQuantity) total_inventary from zepto group by category 
order by total_inventary desc;