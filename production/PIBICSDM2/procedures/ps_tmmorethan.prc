CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_TMMORETHAN" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_TMMORETHAN
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        18/08/2014   ittipon       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_TMMORETHAN
      Sysdate:         18/08/2014
      Date and Time:   18/08/2014, 22:12:09, and 18/08/2014 22:12:09
      Username:        ittipon (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    cursor c1 is
        
        /*
        select intdtno, nationcd, Count('X') cnt from tmmain where (to_char(indte, 'YYYYMM') between '201201' and  '201408') and nationcd in ('V03', 'R04') 
        and indeptcd in(select deptcd from department where (deptline in ('Y', 'M') or deptcd in ('00169','00170')) and actflag = 'Y')
        group by intdtno, nationcd
        having count('X') > 1; 
        */
        
        /*
        select intdtno, indeptcd, Count('X') cnt from tmmain where (to_char(indte, 'YYYYMM') between '201201' and  '201408') 
        --and nationcd in ('V03', 'R04')
        and nationcd = 'R04' 
        and indeptcd in(select deptcd from department where (deptline in ('Y', 'M') or deptcd in ('00169','00170')) and actflag = 'Y')
        group by intdtno, indeptcd
        having count('X') > 1;*/
        
        
        
        select intdtno, nationcd, Count('X') cnt from tmmain where (to_char(indte, 'YYYYMM') between '201201' and  '201409') and nationcd in (select countcd from country where pcsvisarun = '0014')
        group by intdtno, nationcd
        having count('X') > 1;
          
        
    rec_tm c1%rowtype;  
begin 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
 
    insert into tmmorethan (tdtno, nationcd, cnt) values (rec_tm.intdtno, rec_tm.nationcd, rec_tm.cnt);
    
    --insert into tmmorethan (tdtno, deptcd, cnt, creusr) values (rec_tm.intdtno, rec_tm.indeptcd, rec_tm.cnt, 'R04');
    
    commit;
 end loop; --cursor
 close c1;
 commit; 
 Exception
   when others then
         null;--prompt(sqlerrm||'[Re-Gen Error]');
end;



END ;
/
