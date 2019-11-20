CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_BLICKLIST" AS

  PROCEDURE SP_SEARCH (
      P_DATA IN BLOB,
      P_RESPONSE OUT CLOB
    ) AS
  REQ BLOB;
  RES CLOB;
v_wlcd          DL_BLACKLIST.TT_VARCHAR2 := DL_BLACKLIST.TT_VARCHAR2(); -- watchlist code
v_movementid    varchar2(200);
v_nationcd  varchar2(100);  
v_nationality  varchar2(100); 
v_passno  varchar2(200);       
v_idcard   varchar2(200);      
v_birthdte  varchar2(200);     
v_sex   varchar2(20);    
i_sex   int;  
v_efirstnm    varchar2(500);   
v_emiddlenmn    varchar2(500); 
v_efamilynm    varchar2(500);   
v_tfirstnm   varchar2(500);     
v_tmiddlenmn    varchar2(500);  
v_tfamilynm   varchar2(500);    
i_pibicsprdconn  int;           
  BEGIN
  REQ := P_DATA;
     select a.dateofbirth
	       ,a.firstname
		   ,a.surname
		   ,a.middlename
		   ,a.nationality
		   ,a.passportnumber
		   ,a.sex
		   ,a.idcard
		   ,a.movementid
    into   v_birthdte
	       ,v_efirstnm
		   ,v_efamilynm
		   ,v_emiddlenmn
		   ,v_nationality
		   ,v_passno
		   ,v_sex
		   ,v_idcard
		   ,v_movementid
    FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
			dateofbirth      VARCHAR2  	PATH '$.demographic.dateOfBirth',
			firstname        	VARCHAR2  	PATH '$.demographic.firstname',
			surname   		VARCHAR2  	PATH '$.demographic.surname',
			middlename   		VARCHAR2  	PATH '$.demographic.middlename',
			nationality 		VARCHAR2   	PATH '$.demographic.nationality',
		    passportnumber 				VARCHAR2    PATH '$.demographic.passportNumber',
			sex   		VARCHAR2  	PATH '$.demographic.sex',
			idcard   		VARCHAR2  	PATH '$.demographic.idcard',
			movementid   		VARCHAR2  	PATH '$.demographic.movementid'
        )) a;

    if v_nationality is not null then
    begin
     select countcd
     into v_nationcd
     from PIBICSDM2.country
     where abbcount =v_nationality  and ACTFLAG ='Y';
    exception   
    when no_data_found then
    v_nationcd := '';
     end;
    end if;

   if v_sex is not null then
    begin
       if upper(v_sex) ='M' then 
       i_sex := 1;
       end if;
        if upper(v_sex) ='F' then 
        i_sex := 2;
       end if;
    exception   
    when no_data_found then
      i_sex := null;
     end;
    end if;


    pibicsdm2.p_chk_blacklist
    (
        P_MOVEMENTID    => null,
        P_NATIONCD      => v_nationcd,
        P_PASSNO        => v_passno,
        P_IDCard        => v_idcard,
        P_BIRTHDTE      => v_birthdte,
        P_SEX           => i_sex,
        P_EFIRSTNM      => v_efirstnm,
        P_EMIDDLENMN    => v_emiddlenmn,
        P_EFAMILYNM     => v_efamilynm,
        P_TFIRSTNM      => NULL,
        P_TMIDDLENMN    => NULL,
        P_TFAMILYNM     => NULL,
        P_PIBICSPRDCONN => 1,
        P_WLCD          => v_wlcd
    );


  RES := '[]';
   if v_wlcd is not null then
   if v_wlcd.COUNT > 0 then
   select JSON_ARRAYAGG(JSON_OBJECT (
     'id' value  a.case_number,
     'case_number' value   nvl(a.case_number,' '),
     'passportnumber' value v_passno,
     'surname' value  nvl(aa.surname,' '),
     'givenname' value  nvl(aa.given_name,' '),
     'middlename' value  nvl(aa.middle_name,' '),
     'sex' value  nvl(aa.sex,' ') ,
     'nationality' value  nvl(aa.nationality,' '),
     'authority' value  nvl(a.authority,' '),
     'behavior' value  nvl(a.behavior,' '),
     'secret_level' value  nvl(a.secret_level,' '),
     'action_code' value  nvl(a.action_code,' '),
     'contact_owner_data' value  nvl(a.contact_owner_data,' '),
     'arrested_warrant_number' value  nvl(a.arrested_warrant_number,' ') ,
     'urgent_contact' value  nvl(a.urgent_contact,' ') ,
     'reason' value  nvl(a.reason,' ') ,
     'contact_telephone_number' value  nvl(a.contact_telephone_number,' ') ,
     'travel_permit_from' value  nvl(to_char(a.travel_permit_from,'dd/mm/yyyy'),' ') ,
     'ostay_tm6' value  nvl(a.ostay_tm6,' ') ,
     'ins_at' value  nvl(to_char(a.ins_at,'dd/mm/yyyy'),' ') ,
     'notice' value  nvl(a.notice,' '),
     'birth_date' value  to_char(aa.date_of_birth,'dd/mm/yyyy')
     ,'image_person' value fn_blob_to_clob(e.blob_value)
     ))
 into RES
 from  (select * from table(v_wlcd) ) b 
 inner JOIN DL_BLACKLIST.BLACKLIST_CASES a on a.case_number =b.column_value and a.is_active = 'Y'
 left join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES bb on bb.blacklist_case = a.id
left join DL_BLACKLIST.IDENTITIES aa  on aa.key_value = bb.identity and aa.is_active = 'Y'
left join DL_BLACKLIST.BIOMETRICS c on a.id=c.BLACKLIST_CASE_ID
left join (
select tb_max_process.*
                        from
                        ( SELECT TL.* , 
                        ROW_NUMBER () OVER (PARTITION BY  TL.BIOMETRIC_ID
                        ORDER BY TL.ID desc
                        ) RN_MAX_ISSUE_DT 
                        FROM   DL_BLACKLIST.FACES TL 
                        ) tb_max_process 
                        WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
) d on c.ID =d.BIOMETRIC_ID
left join DL_BLACKLIST.IMAGES e on d.IMAGE_ID =e.ID
WHERE rownum <= 2; 
end if;
end if;
 P_RESPONSE := '{"recordInfo":'||RES||',"msgInfo":{"msg_code":"00","msg_desc":"success"}}';  
 EXCEPTION 
    WHEN OTHERS THEN ROLLBACK;
    P_RESPONSE := '{"msgInfo":{"msg_code":"99","msg_desc":"' || SQLERRM || '"}}';  
  END SP_SEARCH;

END PKG_BLICKLIST;
/
  GRANT EXECUTE ON "SERVAPP"."PKG_BLICKLIST" TO "BIOSAADM";
