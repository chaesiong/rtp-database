CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTRATEPER" ("ESTIMATEYEAR", "ESTIMATEMONTH", "RATEPER") AS 
  SELECT   estimateyear,
              estimatemonth,
              (SUM (totalamount) / (  SELECT   SUM (numrate) FROM vwotrate))
                 rateper
       FROM   ot_otslip
   GROUP BY   estimateyear, estimatemonth ;
