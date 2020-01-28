CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_EVOA" AS

PROCEDURE SP_CHECK_BALCKLIST (
        p_request     IN blob,
        p_response   OUT CLOB
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
  REQ := p_request;
     select a.dateofbirth
	       ,a.firstname
		   ,a.surname
		   ,a.middlename
		   ,a.nationality
		   ,a.passportnumber
		   ,a.sex
		   ,a.idcard
		   ,a.movementid
            ,b.TFIRSTNM as firstnameth
		   ,b.TFAMILYNM as surnameth
		   ,b.TMIDDLENM as middlenameth
    into   v_birthdte
	       ,v_efirstnm
		   ,v_efamilynm
		   ,v_emiddlenmn
		   ,v_nationality
		   ,v_passno
		   ,v_sex
		   ,v_idcard
		   ,v_movementid
           ,v_tfirstnm
           ,v_tfamilynm
           ,v_tmiddlenmn
    FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
			dateofbirth      VARCHAR2  	PATH '$.dateOfBirth',
			firstname        	VARCHAR2  	PATH '$.firstname',
			surname   		VARCHAR2  	PATH '$.surname',
			middlename   		VARCHAR2  	PATH '$.middlename',
			nationality 		VARCHAR2   	PATH '$.nationality',
		    passportnumber 				VARCHAR2    PATH '$.passportNumber',
			sex   		VARCHAR2  	PATH '$.sex',
			idcard   		VARCHAR2  	PATH '$.idcard',
			movementid   		VARCHAR2  	PATH '$.movementid'
        )) a
         left join PIBICSDM2.thaipassport b on a.passportnumber =b.PASSPORTNO ;

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
        P_MOVEMENTID    => 'M'||v_passno,
        P_NATIONCD      => v_nationcd,
        P_PASSNO        => v_passno,
        P_IDCard        => v_idcard,
        P_BIRTHDTE      => v_birthdte,
        P_SEX           => i_sex,
        P_EFIRSTNM      => v_efirstnm,
        P_EMIDDLENMN    => v_emiddlenmn,
        P_EFAMILYNM     => v_efamilynm,
        P_TFIRSTNM      => v_tfirstnm,
        P_TMIDDLENMN    => v_tmiddlenmn,
        P_TFAMILYNM     => v_tfamilynm,
        P_PIBICSPRDCONN => 1,
        P_WLCD          => v_wlcd
    );
    
   
  p_response := '[]';
  
   if v_wlcd is not null then
   if v_wlcd.COUNT > 0 then
select JSON_ARRAYAGG(JSON_OBJECT (
                                         'abisId' value c.abis_id,
                                         'key_value' value bb.id,
                                         'demographicMatch' value 'TRUE',
                                         'demographicScore' value 100,
                                         'sortingScore' value 100,
                                          'unique_value' value bb.id,
                                        'surname' value   aa.surname,
                                          'middlename' value   aa.MIDDLE_NAME,
                                        'givenname' value  aa.given_name,
                                         'date_of_birth' value    to_char(aa.date_of_birth,'dd/mm/yyyy'),
                                         'nationality' value nvl(aa.nationality,v_nationality),
                                          'Sex' value   aa.sex,
                                          'active_warrent' value  'TRUE',
                                         'Wlcd' value  a.case_number,
                                         'Seqno' value  aa.seqno,
                                         'Efirstnm' value  aa.given_name,
                                        'Efamilynm' value   aa.surname,
                                       'Tfirstnm' value    aa.GIVENNAME_THAI,
                                        'Tfamilynm' value   aa.SURNAME_THAI,
                                      'Birthdte' value    to_char(aa.date_of_birth,'dd/mm/yyyy'),
                                      'Nationtnm' value    d.NATIONTNM,
                                       'Nationenm' value   d.NATIONENM,
                                       'Tdtnm' value   a.notice ,
                                        'Reasontnm' value  a.reason,
                                       'Orgnm' value   a.authority ,
                                        'Operrefnm' value  a.behavior ,
                                       'Warrno' value   a.arrested_warrant_number ,
                                       'Agcphone' value   a.contact_telephone_number 
                                         ))
                                         into p_response
                                     from  (select * from table(v_wlcd)  ) b 
                                     LEFT JOIN DL_BLACKLIST.BLACKLIST_CASES a on a.case_number =b.column_value and a.is_active = 'Y'
                                     left join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES bb on bb.blacklist_case = a.id
                                    left join DL_BLACKLIST.IDENTITIES aa  on aa.key_value = bb.identity and aa.is_active = 'Y'
                                    left join DL_BLACKLIST.BIOMETRICS c on a.id=c.BLACKLIST_CASE_ID
                                    left join PIBICSDM2.COUNTRY d on aa.nationality =d.ABBCOUNT and d.actflag ='Y';
end if;
end if;
    exception when others then
  raise_application_error(-20001,'An error was encountered - PKG_EVOA.SP_CHECK_BALCKLIST'||SQLCODE||'-ERROR-'||SQLERRM); 
  END SP_CHECK_BALCKLIST;
END PKG_EVOA;
/
