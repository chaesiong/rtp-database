CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_WL1" IS
/******************************************************************************
   NAME:       INS_WL1
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/3/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INS_WL1
      Sysdate:         16/3/2011
      Date and Time:   16/3/2011, 13:52:24, and 16/3/2011 13:52:24
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
 /*<TOAD_FILE_CHUNK>*/ 
declare 
    createby varchar(10);
    hotel_seqno number;
    
    datefrom varchar(50);
    dateto varchar(50);
 
begin
    createby := 'SYSTEM'; 
    
    --select TO_CHAR(sysdate - 1, 'dd-mm-yyyy') ,TO_CHAR(sysdate - 1, 'dd-mm-yyyy')  into datefrom,dateto from dual;
    select TO_CHAR(sysdate , 'dd-mm-yyyy') ,TO_CHAR(sysdate , 'dd-mm-yyyy')  into datefrom,dateto from dual; 
    datefrom := datefrom || ' 00:00:00';
    dateto := dateto ||  ' 23:59:59'; 
    --dbms_output.put_line(' Insert New' || datefrom || '  -- ' || dateto );    
    ---  INSERT      WATCHLIST           
   INSERT INTO WATCHLIST (WLCD,OWNERAGE,AGCCONT,AGCPHONE,EMGCONT,DOCREF,SECLEV,BIRTHPLACE,ADDR,HOUSE,SOI,ROAD,MOO    ,DISTRICT,CITY,STATE,CURZIPCODE,HEIGHT,WEIGHT,HAIRCOLOR,HAIR,FACE,BUILD,EYECOLOR,COMPLEXION,FEATURE,PECULIARITY,OCCCD,TARGETNO,OPERREF,OWNERORG,WARRNO,WARRDTE,WARREXPDTE,DOCREFER,BLAWSNO,RLAWSNO,PENALNO,ALLEGECD,REASONCD,TDCD,CREUSR,CREDTE,CREORG,UPDUSR,UPDDTE,UPDORG,DOCDTE,DOCNO,STS,CAUSE,BIRTHDTE,SEX,NATIONCD,OTHERAGCCONT,RMK1,RMK2,RMK3,RMK4,RMKDTE,RMKDTE1,PRECINCTCD,ARREST,PERMITDTE1,PERMITDTE2,PERMIT,RMKAGCCONT,RMKARREST,RMKPERMIT,RMK11,RMK12,RMK13,RMKDTE11,RMKDTE12,RMKMORE)
    SELECT WLCD,OWNERAGE,AGCCONT,AGCPHONE,EMGCONT,DOCREF,SECLEV,BIRTHPLACE,ADDR,HOUSE,SOI,ROAD,MOO    ,DISTRICT,CITY,STATE,CURZIPCODE,HEIGHT,WEIGHT,HAIRCOLOR,HAIR,FACE,BUILD,EYECOLOR,COMPLEXION,FEATURE,PECULIARITY,OCCCD,TARGETNO,OPERREF,OWNERORG,WARRNO,WARRDTE,WARREXPDTE,DOCREFER,BLAWSNO,RLAWSNO,PENALNO,ALLEGECD,REASONCD,TDCD,CREUSR,CREDTE,CREORG,UPDUSR,UPDDTE,UPDORG,DOCDTE,DOCNO,STS,CAUSE,BIRTHDTE,SEX,NATIONCD,OTHERAGCCONT,RMK1,RMK2,RMK3,RMK4,RMKDTE,RMKDTE1,PRECINCTCD,ARREST,PERMITDTE1,PERMITDTE2,PERMIT,RMKAGCCONT,RMKARREST,RMKPERMIT,RMK11,RMK12,RMK13,RMKDTE11,RMKDTE12,RMKMORE
    FROM WATCHLIST@tmdb 
    WHERE credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ;
   commit;
   
    ---  INSERT      WATCHLISTNM        
    INSERT INTO WATCHLISTNM (WLCD,SEQNO,WLTLASTNM,WLTFIRSTNM,WLTMIDDLENM    ,WLELASTNM,WLEMIDDLENM,WLEFIRSTNM,EFSNDXNM,EMSNDXNM,ELSNDXNM,NATIONCD,BIRTHDTE,TFSNDXNM,TMSNDXNM,TLSNDXNM)
    SELECT  WLCD,SEQNO,WLTLASTNM,WLTFIRSTNM,WLTMIDDLENM    ,WLELASTNM,WLEMIDDLENM,WLEFIRSTNM,EFSNDXNM,EMSNDXNM,ELSNDXNM,NATIONCD,BIRTHDTE,TFSNDXNM,TMSNDXNM,TLSNDXNM 
    FROM WATCHLISTNM@tmdb 
    WHERE wlcd in (select wlcd from watchlist@tmdb  where credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ) ;
    commit;
     
    
    --  INSERT   WLCHARGE
    INSERT INTO WLCHARGE (WLCD,SEQNO,CHARGE_CODE)
    SELECT WLCD,SEQNO,CHARGE_CODE
    FROM WLCHARGE@tmdb 
    WHERE wlcd in (select wlcd from watchlist@tmdb  where  credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ) ;
    commit;
    
    --  INSERT   WLINDICATECARD  
    INSERT INTO WLINDICATECARD  (WLCD,SEQNO,IDCCD,DOCNO,ISUDTE,ISUPLACE)
    SELECT WLCD,SEQNO,IDCCD,DOCNO,ISUDTE,ISUPLACE
    FROM WLINDICATECARD@tmdb 
    WHERE wlcd in (select wlcd from watchlist@tmdb  where   credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ) ;
    commit;
    
    --  INSERT   WLRELATION   
    INSERT INTO WLRELATION (WLCD,SEQNO,RELATION,ARFIRSTNM    ,ARLASTNM,ARMIDDLENM,REMK)
    SELECT WLCD,SEQNO,RELATION,ARFIRSTNM    ,ARLASTNM,ARMIDDLENM,REMK
    FROM WLRELATION@tmdb  
    WHERE wlcd in (select wlcd from watchlist@tmdb  where  credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ) ;
    commit;

    --  INSERT   WLREMARK   
    INSERT INTO WLREMARK (WLCD,SEQNO,REMK)
    SELECT WLCD,SEQNO,REMK
    FROM WLREMARK@tmdb 
    WHERE wlcd in (select wlcd from watchlist@tmdb  where   credte  between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ) ;
    commit;
            
    
end;
 
END INS_WL1; 
/
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL1" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL1" TO "BIOSAADM";
