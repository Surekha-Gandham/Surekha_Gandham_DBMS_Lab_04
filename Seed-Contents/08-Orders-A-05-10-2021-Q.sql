select p.pro_id, p.pro_name
-- o.ord_id, o.ORD_AMOUNT, o.ORD_DATE, sp.SUPP_PRICE 
from `order` o
	inner join supplier_pricing sp
    inner join product p
on (o.PRICING_ID = sp.PRICING_ID AND sp.PRO_ID = p.PRO_ID)
where o.ORD_DATE >= "2021-10-05"
group by p.PRO_ID;