select P_SP.* from category C
inner join (
select P.cat_id, P.pro_id, P.pro_name, Minimal_Product_Price from product P inner join (
select pro_id, min(SUPP_PRICE) Minimal_Product_Price from supplier_pricing
group by pro_id
) as SP
on p.PRO_ID = SP.PRO_ID
) as P_SP 
ON (C.CAT_ID = P_SP.CAT_ID)