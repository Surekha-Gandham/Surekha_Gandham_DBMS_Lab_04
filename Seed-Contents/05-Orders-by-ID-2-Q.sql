select o.cus_id, o.ord_id, o.ORD_AMOUNT, o.ORD_DATE, sp.SUPP_PRICE,
p.PRO_NAME from `order` o
	inner join supplier_pricing sp
    inner join product p
on (o.PRICING_ID = sp.PRICING_ID AND sp.PRO_ID = p.PRO_ID)
where o.CUS_Id = 2;