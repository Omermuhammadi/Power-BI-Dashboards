with cte as(
select 
a.Product,
a.Category,
a.Brand,
a.Description,
a.Cost_Price,
a.Sale_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.Country,
b.Units_Sold,


(Sale_Price * Units_Sold )as revenue,
(Cost_Price * Units_Sold) as total_cost,
FORMAT(date,'MMMM') as month,
FORMAT(date, 'yyyy') as year

from product_data a

join product_saless b

on a.Product_ID =b.Product)

select * ,
(1-discount *1.0/100)*revenue as dicount_revenue


from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.month = b.Month