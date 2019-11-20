CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_WL3" IS
/******************************************************************************
   NAME:       INS_WL3   iNSERT LOG  
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/3/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INS_WL2
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
    
    --- Delete  WATCHLISTLOG
    delete from WATCHLISTLOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
    
    
    ---  INSERT      WATCHLIST           
    INSERT INTO WATCHLISTLOG (WLCD,OWNERAGE,AGCCONT,AGCPHONE,EMGCONT,DOCREF,SECLEV,BIRTHPLACE,ADDR,HOUSE,SOI,ROAD,MOO ,DISTRICT,CITY,STATE,CURZIPCODE,HEIGHT,WEIGHT,HAIRCOLOR,HAIR,FACE,BUILD,EYECOLOR,COMPLEXION,FEATURE,PECULIARITY,OCCCD,TARGETNO,OPERREF,OWNERORG,WARRNO,WARRDTE,WARREXPDTE,DOCREFER,BLAWSNO,RLAWSNO,PENALNO,ALLEGECD,REASONCD,TDCD,CREUSR,CREDTE,CREORG,UPDUSR,UPDDTE,UPDORG,DOCDTE,DOCNO,STS,CAUSE,BIRTHDTE,SEX,NATIONCD,OTHERAGCCONT,RMK1,RMK2,RMK3,RMK4,RMKDTE,RMKDTE1,PRECINCTCD,ARREST,PERMITDTE1,PERMITDTE2,PERMIT,RMKAGCCONT,RMKARREST,RMKPERMIT,RMK11,RMK12,RMK13,RMKDTE11,RMKDTE12,RMKMORE,LOGUSERID,LOGFLAG,LOGDTE,WATCHLISTLOGID)
    SELECT WLCD,OWNERAGE,AGCCONT,AGCPHONE,EMGCONT,DOCREF,SECLEV,BIRTHPLACE,ADDR,HOUSE,SOI,ROAD,MOO ,DISTRICT,CITY,STATE,CURZIPCODE,HEIGHT,WEIGHT,HAIRCOLOR,HAIR,FACE,BUILD,EYECOLOR,COMPLEXION,FEATURE,PECULIARITY,OCCCD,TARGETNO,OPERREF,OWNERORG,WARRNO,WARRDTE,WARREXPDTE,DOCREFER,BLAWSNO,RLAWSNO,PENALNO,ALLEGECD,REASONCD,TDCD,CREUSR,CREDTE,CREORG,UPDUSR,UPDDTE,UPDORG,DOCDTE,DOCNO,STS,CAUSE,BIRTHDTE,SEX,NATIONCD,OTHERAGCCONT,RMK1,RMK2,RMK3,RMK4,RMKDTE,RMKDTE1,PRECINCTCD,ARREST,PERMITDTE1,PERMITDTE2,PERMIT,RMKAGCCONT,RMKARREST,RMKPERMIT,RMK11,RMK12,RMK13,RMKDTE11,RMKDTE12,RMKMORE,LOGUSERID,LOGFLAG,LOGDTE,WATCHLISTLOGID
    FROM WATCHLISTLOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;

    --- Delete  WATCHLISTNMLOG
    delete from WATCHLISTNMLOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
    
    ---  INSERT      WATCHLISTNM        
    INSERT INTO  WATCHLISTNMLOG
    SELECT *
    FROM WATCHLISTNMLOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS') ;

    --- Delete  WLCHARGELOG
    delete from WLCHARGELOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
        
    --  INSERT   WLCHARGE
    INSERT INTO WLCHARGELOG  
    SELECT *
    FROM WLCHARGELOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;

    --- Delete  WLINDICATECARD
    delete from WLINDICATECARDLOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
        
    --  INSERT   WLINDICATECARD  
    INSERT INTO WLINDICATECARDLOG  
    SELECT *
    FROM WLINDICATECARDLOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;

    --- Delete  WLRELATIONLOG 
    delete from WLRELATIONLOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
            
    --  INSERT   WLRELATION   
    INSERT INTO WLRELATIONLOG 
    SELECT  *
    FROM WLRELATIONLOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;

    --- Delete  WLREMARKLOG 
    delete from WLREMARKLOG
    where logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
            
    --  INSERT   WLREMARK   
    INSERT INTO WLREMARKLOG 
    SELECT * 
    FROM WLREMARKLOG@tmdb
    WHERE logdte between TO_DATE(datefrom, 'dd-mm-yyyy HH24:MI:SS') and   TO_DATE(dateto, 'dd-mm-yyyy HH24:MI:SS')  ;
    
    commit;

end;
 
END INS_WL3; 
/
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL3" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL3" TO "BIOSAADM";
