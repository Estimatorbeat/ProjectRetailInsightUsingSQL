--1. How many records are in SM-Stores orders table.
select count(*)
from orders;


--2. How many Cities do SM-stores have properties in.
select count(Distinct "PropertyCity") as "property cities"
from propertyinfo;


--3. How many orders were placed in each date stated in the orders table.

select "OrderDate", count("OrderID") as "Number of Orders"
from orders
group by "OrderDate"
order by "OrderDate"




--4. Return all records where the quantity purchased is above 5.

select "OrderID", "Quantity"from orders
Where "Quantity" > 5


--5. A customer has requested for a refund claiming they procured goods from our store.
--Provide all the details of this order if the OrderID is = ‘3896’


select "OrderID", "OrderDate", "ProductName", "ProductCategory" "PropertyCity", "PropertyState", "Price", "Quantity"
from orders
left join products
on orders."ProductID" = products."ProductID"
left join propertyinfo
on orders."PropertyID" = propertyinfo."PropID"
where "OrderID" = 3896



-- 6. Can you process the number of orders we had in each year of SM-stores data.

select extract(year from "OrderDate") as Year, count("OrderID") as "No of Orders"
from orders
group by Year


-- 7. Which category is the most frequented in the year 2015.

select "ProductCategory", count("OrderID") as "No of orders"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
Where extract(year from "OrderDate") = 2015
group by "ProductCategory"
order by "No of orders" desc
limit 1


-- 8. Which category has the highest sales in the year 2016.

select "ProductCategory", Sum("Quantity" * "Price") as Total_Sales
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
Where extract(year from "OrderDate") = 2016
group by "ProductCategory"
limit 1



9. Which State has the most goods ordered. Return the state where sales >25000.

select * from orders	
select * from products
select * from propertyinfo

select distinct("PropertyState"), "ProductName", Sum("OrderID")as "No of goods"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
left join propertyinfo as pi
on o."PropertyID" = pi."PropID"
group by "PropertyState", "ProductName"
order by "No of goods" desc
limit 1




10. What is the cost of a ‘Coffee Maker’ located in Texas.


select "OrderID", "ProductName", "PropertyState", "Price"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
left join propertyinfo as pi
on o."PropertyID" = pi."PropID"
where "OrderID" = 2193


-- 11. What are the product categories with a product id spanning 10 to 30.


select "ProductID", "ProductCategory"
from products
where "ProductID" between 10 and 30


12. How many products start with the letter ‘D’.


select "ProductName" from products
where "ProductName" like 'D%'


13. Find the name and category, property city and state of the product with a productid of 105


select "OrderID", "ProductName", "PropertyCity", "PropertyState"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
left join propertyinfo as pi
on o."PropertyID" = pi."PropID"
where p."ProductID" = 105


-- 14. a). Find all orders for ‘Permanent Markers’, ‘Sticky Notes’ and ‘Note Pads’


select "OrderID", "ProductName"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
where "ProductName" in ('Permanent Markers', 'Sticky Notes', 'Note Pads') 



-- b). Find the number of ‘Permanent Markers’, ‘Sticky Notes’ and ‘Note Pads’ ordered for year 2015.

select "ProductName", sum("Quantity") as "Total_Quantity"
from orders as o
left join products as p
on o."ProductID" = p."ProductID"
where "ProductName" in ('Permanent Markers', 'Sticky Notes', 'Note Pads') 
and extract(year from "OrderDate") = 2015
group by "ProductName"


-- 15. SM-stores wants to re-evaluate the prices of their goods, provide a list of their products, categories and the corresponding prices. Group their products into cheap(<$50), affordable(<$100), expensive. Find the number of products in each category.


Select "ProductName", "ProductCategory", "Price",
Case when "Price" < 50 then 'Cheap'
when "Price" < 100 then 'Affordable'
else 'Expensive'
end as "PriceCategory"
from  products




SELECT 
    "ProductName",
    SUM("Quantity") AS "TotalQuantity"
FROM 
    orders AS o
LEFT JOIN 
    products AS p 
ON 
    o."ProductID" = p."ProductID"
WHERE 
    "ProductName" IN ('Permanent Markers', 'Sticky Notes', 'Note Pads') 
    AND EXTRACT(YEAR FROM "OrderDate") = 2015
GROUP BY 
    "ProductName"

select * from orders