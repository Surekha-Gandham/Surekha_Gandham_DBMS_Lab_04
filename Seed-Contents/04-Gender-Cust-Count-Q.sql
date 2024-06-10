select C_O.CUS_GENDER as 'Gender', count(C_O.CUS_GENDER) as 'NoOfCustomers' from (

select c.cus_id, c.cus_name, c.cus_gender from customer c inner join
`order` o on c.cus_id = o.cus_id
where o.ORD_AMOUNT >= 3000
group by c.cus_id
) as C_O
group by C_O.cus_gender