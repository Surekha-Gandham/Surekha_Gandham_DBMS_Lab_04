SELECT SUPP_ID, SUPP_NAME, AverageRating, 
	CASE
		WHEN AverageRating = 5 THEN 'Excellent Service'
        WHEN AverageRating > 4 THEN 'Good Service'
        WHEN AverageRating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END As ServiceType
 FROM (
select s.SUPP_ID, s.SUPP_NAME, avg(r.RAT_RATSTARS) AverageRating
from rating r
	inner join `order` o
    inner join supplier_pricing sp
    inner join supplier s
on (
r.ORD_ID = o.ORD_ID AND
o.PRICING_ID = sp.PRICING_ID AND
sp.SUPP_ID = s.SUPP_ID
)
group by supp_id
) as R_O_SP_S;



CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplaySupplierRatingDetails`()
BEGIN

SELECT SUPP_ID, SUPP_NAME, AverageRating, 
	CASE
		WHEN AverageRating = 5 THEN 'Excellent Service'
        WHEN AverageRating > 4 THEN 'Good Service'
        WHEN AverageRating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END As ServiceType
 FROM (
select s.SUPP_ID, s.SUPP_NAME, avg(r.RAT_RATSTARS) AverageRating
from rating r
	inner join `order` o
    inner join supplier_pricing sp
    inner join supplier s
on (
r.ORD_ID = o.ORD_ID AND
o.PRICING_ID = sp.PRICING_ID AND
sp.SUPP_ID = s.SUPP_ID
)
group by supp_id
) as R_O_SP_S;

END


call DisplaySupplierRatingDetails();