CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHK_BLACKLIST_20190505" 

(

  P_MOVEMENTID IN VARCHAR2

, P_NATIONCD IN VARCHAR2

, P_PASSNO IN VARCHAR2

, P_IDCard IN VARCHAR2

, P_BIRTHDTE IN VARCHAR2

, P_SEX IN varchar2

, P_EFIRSTNM  IN VARCHAR2

, P_EMIDDLENMN IN VARCHAR2

, P_EFAMILYNM IN VARCHAR2

, P_WLCD OUT VARCHAR2

) AS

 

  -- added for direct sql usage

  PRAGMA AUTONOMOUS_TRANSACTION;

 

 -- P_WLCD VARCHAR2(100) := 'NotFound';

  V_Results   VARCHAR2(100) := 'NotFound';

  WLFULLNMTWO VARCHAR2(100) := null;

  WLFULLNMTHREE VARCHAR2(100) := null;

 

BEGIN

   

    -- add condtions here to return if required params are null

   

    WLFULLNMTWO := REPLACE(P_EFIRSTNM || P_EFAMILYNM,' ','')||'%';

    WLFULLNMTHREE := REPLACE(P_EFIRSTNM || P_EFAMILYNM || P_EMIDDLENMN,' ','')||'%';

 
    IF P_NATIONCD = 'V03'

    THEN

    WLFULLNMTWO  := null;

    END IF;
  

begin

          select w.WLCD into V_Results 

                FROM watchlist W, WATCHLISTNM WN

                --, COUNTRY C -- no use of country if not checking active flag

                WHERE W.WLCD=WN.WLCD

                --AND WN.NATIONCD=C.COUNTCD

                AND

                ((REPLACE(WLEFIRSTNM||WLEMIDDLENM||WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLEFIRSTNM||WLELASTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR

                (REPLACE(WLEMIDDLENM||WLEFIRSTNM||WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLEMIDDLENM||WLELASTNM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR

                (REPLACE(WLELASTNM||WLEFIRSTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLELASTNM||WLEMIDDLENM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR

                (REPLACE(WLEFIRSTNM||WLEMIDDLENM||WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLEFIRSTNM||WLELASTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR

                (REPLACE(WLEMIDDLENM||WLEFIRSTNM||WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLEMIDDLENM||WLELASTNM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE) OR

                (REPLACE(WLELASTNM||WLEFIRSTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLELASTNM||WLEMIDDLENM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE))

                AND WN.NATIONCD = P_NATIONCD 

                AND WN.birthdte = case when LENGTH(WN.birthdte) > 4 then P_BIRTHDTE else  substr(P_BIRTHDTE,-4,4) end

                AND ROWNUM = 1;

                

EXCEPTION

   WHEN NO_DATA_FOUND

   THEN

       V_Results :='NotFound';

end;

 

if V_Results <> 'NotFound'

then

    P_WLCD := V_Results;

 

else

 

begin


              

               -- no use of country if not checking active flag

               -- no use of outer join

               -- created index on WLINDICATECARD.DOCNO and WLINDICATECARD.WLCD

               select w.WLCD into V_Results

               FROM watchlist W, WATCHLISTNM WN, WLINDICATECARD  WC

               WHERE (replace(WC.DOCNO,'-','') = replace(P_PASSNO,'-','') or replace(WC.DOCNO,'-','') = replace(P_IDCard,'-',''))

               AND W.WLCD=WC.WLCD AND WN.WLCD=W.WLCD

               AND WN.NATIONCD = P_NATIONCD 

               AND ROWNUM = 1;

              

        P_WLCD := V_Results;   

  

    

 EXCEPTION

   WHEN NO_DATA_FOUND

   THEN

       V_Results :='NotFound';

       P_WLCD := V_Results ;

end;

   

end if;

 

if V_Results <> 'NotFound'

then

    

    begin

    INSERT INTO pibicsdm2.FOUNDWLResults(WLCD, MOVEMENTID, SYSTEMDATE) VALUES(P_WLCD, P_MOVEMENTID, sysdate) ;

        --commit;

    -- added exception

    exception

        when others then

            -- use logger here

            NULL;

    end;

 

end if;

commit;

END P_CHK_BLACKLIST_20190505;
/
