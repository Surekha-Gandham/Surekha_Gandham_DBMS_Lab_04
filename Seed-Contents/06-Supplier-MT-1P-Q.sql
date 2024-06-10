select s.*, NoOfProducts_Supplied from supplier s 
inner join (
select supp_id, count(pro_id) as NoOfProducts_Supplied from supplier_pricing
group by supp_id
HAVING NoOfProducts_Supplied > 1
) as sp
on s.supp_id = sp.supp_id