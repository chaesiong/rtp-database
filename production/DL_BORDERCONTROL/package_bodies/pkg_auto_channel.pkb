CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_AUTO_CHANNEL" AS

  procedure Create_Movement( P_BRDDOCID  in  MOVEMENTS.BRDDOCID%type
                            ,P_LANDBARCD  in  MOVEMENTS.LANDBARCD%type
                            ,P_EXITFLG  in  MOVEMENTS.EXITFLG%type
                            ,P_MAX_STAY_DT  in  MOVEMENTS.MAX_STAY_DT%type
                            ,P_FINGERMATCH  in  MOVEMENTS.FINGERMATCH%type
                            ,P_FACEMATCH  in  MOVEMENTS.FACEMATCH%type
                            ,P_MVMNTADDR  in  MOVEMENTS.MVMNTADDR%type
                            ,P_ORIDEST  in  MOVEMENTS.ORIDEST%type
                            ,P_INS_AT  in  MOVEMENTS.INS_AT%type
                            ,P_INS_TERMINAL  in  MOVEMENTS.INS_TERMINAL%type
                            ,P_INS_BORDERPOST  in  MOVEMENTS.INS_BORDERPOST%type
                            ,P_REFUSEDFLG  in  MOVEMENTS.REFUSEDFLG%type
                            ,P_OBSERVATION  in  MOVEMENTS.OBSERVATION%type
                            ,P_TRNSPRTUNITID  in  MOVEMENTS.TRNSPRTUNITID%type
                            ,P_PERSON_TYPE  in  MOVEMENTS.PERSON_TYPE%type
                            ,P_SCANNED_FLIGHT  in  MOVEMENTS.SCANNED_FLIGHT%type
                            ,P_PS_1  in  MOVEMENTS.PS_1%type
                            ,P_PS_2  in  MOVEMENTS.PS_2%type
                            ,P_PS_3  in  MOVEMENTS.PS_3%type
                            ,P_PS_4  in  MOVEMENTS.PS_4%type
                            ,P_PS_5  in  MOVEMENTS.PS_5%type
                            ,P_PS_6  in  MOVEMENTS.PS_6%type
                            ,P_PS_7  in  MOVEMENTS.PS_7%type
                            ,P_PS_8  in  MOVEMENTS.PS_8%type
                            ,P_PS_9  in  MOVEMENTS.PS_9%type
                            ,P_PS_10  in  MOVEMENTS.PS_10%type
                            ,P_FINGERMATCH_HISTORY  in  MOVEMENTS.FINGERMATCH_HISTORY%type
                            ,P_FACEMATC_HISTORY  in  MOVEMENTS.FACEMATC_HISTORY%type
                            ,P_REASON_OFFLOAD  in  MOVEMENTS.REASON_OFFLOAD%type
                            ,P_REASON_DEPORTEE  in  MOVEMENTS.REASON_DEPORTEE%type
                            ,P_VISA_TYPE  in  MOVEMENTS.VISA_TYPE%type
                            ,P_VISA  in  MOVEMENTS.VISA%type
                            ,P_DML_AT  in  MOVEMENTS.DML_AT%type
                            ,P_DML_BY  in  MOVEMENTS.DML_BY%type
                            ,P_DML_TYPE  in  MOVEMENTS.DML_TYPE%type
                            ,P_INS_BY  in  MOVEMENTS.INS_BY%type
                            ,P_IS_FINISHED  in  MOVEMENTS.IS_FINISHED%type
                            ,P_PRIOR_MOVEMENT  in  MOVEMENTS.PRIOR_MOVEMENT%type
                            ,P_ENTRY_FORM  in  MOVEMENTS.ENTRY_FORM%type
                            ,P_FORM_NO_APPROVED  in  MOVEMENTS.FORM_NO_APPROVED%type
                            ,P_MOVEMENT_DT  in  MOVEMENTS.MOVEMENT_DT%type
                            ,P_SOURCE_SYSTEM  in  MOVEMENTS.SOURCE_SYSTEM%type
                            ,P_DATE_OF_ENTRY  in  MOVEMENTS.DATE_OF_ENTRY%type
                            ,P_MRZVISA  in  MOVEMENTS.MRZVISA%type
                            --
                            ) is
      begin
      
      insert into dl_bordercontrol.movements
      (
         BRDDOCID
        ,LANDBARCD
        ,EXITFLG
        ,MAX_STAY_DT
        ,FINGERMATCH
        ,FACEMATCH
        ,MVMNTADDR
        ,ORIDEST
        ,INS_AT
        ,INS_TERMINAL
        ,INS_BORDERPOST
        ,REFUSEDFLG
        ,OBSERVATION
        ,TRNSPRTUNITID
        ,PERSON_TYPE
        ,SCANNED_FLIGHT
        ,PS_1
        ,PS_2
        ,PS_3
        ,PS_4
        ,PS_5
        ,PS_6
        ,PS_7
        ,PS_8
        ,PS_9
        ,PS_10
        ,FINGERMATCH_HISTORY
        ,FACEMATC_HISTORY
        ,REASON_OFFLOAD
        ,REASON_DEPORTEE
        ,VISA_TYPE
        ,VISA
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,INS_BY
        ,IS_FINISHED
        ,PRIOR_MOVEMENT
        ,ENTRY_FORM
        ,FORM_NO_APPROVED
        ,MOVEMENT_DT
        ,SOURCE_SYSTEM
        ,DATE_OF_ENTRY
        ,MRZVISA
      )
      values(
       P_BRDDOCID
        ,P_LANDBARCD
        ,P_EXITFLG
        ,P_MAX_STAY_DT
        ,P_FINGERMATCH
        ,P_FACEMATCH
        ,P_MVMNTADDR
        ,P_ORIDEST
        ,P_INS_AT
        ,P_INS_TERMINAL
        ,P_INS_BORDERPOST
        ,P_REFUSEDFLG
        ,P_OBSERVATION
        ,P_TRNSPRTUNITID
        ,P_PERSON_TYPE
        ,P_SCANNED_FLIGHT
        ,P_PS_1
        ,P_PS_2
        ,P_PS_3
        ,P_PS_4
        ,P_PS_5
        ,P_PS_6
        ,P_PS_7
        ,P_PS_8
        ,P_PS_9
        ,P_PS_10
        ,P_FINGERMATCH_HISTORY
        ,P_FACEMATC_HISTORY
        ,P_REASON_OFFLOAD
        ,P_REASON_DEPORTEE
        ,P_VISA_TYPE
        ,P_VISA
        ,P_DML_AT
        ,P_DML_BY
        ,P_DML_TYPE
        ,P_INS_BY
        ,P_IS_FINISHED
        ,P_PRIOR_MOVEMENT
        ,P_ENTRY_FORM
        ,P_FORM_NO_APPROVED
        ,P_MOVEMENT_DT
        ,P_SOURCE_SYSTEM
        ,P_DATE_OF_ENTRY
        ,P_MRZVISA
      );
      
      end Create_Movement;
      
  PROCEDURE SP_CALLFNSERVICESBYLIST (
        p_request     IN blob,
        p_response   OUT CLOB
    ) AS
  v_person_id varchar2(200);
  v_familyname varchar2(500);
  v_givenname varchar2(500);
  v_middlename varchar2(500);
  v_nationality varchar2(500);
  v_birthdate varchar2(500);
  v_gender varchar2(500);
  v_docnumber varchar2(500);
  v_visa_expire_date VARCHAR2(100);
  v_passport_no VARCHAR2(100);
  v_place_of_birth VARCHAR2(100);
  v_passport_expire_date VARCHAR2(100);
  v_passport_issuing_country VARCHAR2(100);
  i_inout_seqno int;
  v_sql varchar2(5000);
  v_countcd varchar2(200);
  c_cursor SYS_REFCURSOR;
  c_cursor_overstay SYS_REFCURSOR;
  l_obj json_object_t;
  v_url VARCHAR2(5000);
  v_where VARCHAR2(5000);
  v_x_response_code VARCHAR2(5000);
  b_x_response_message CLOB;
  v_foundbwl varchar(2);
  v_found_overstay varchar2(2);
  v_found_visa_run varchar2(2);
  c_data CLOB;
  i_count_seqno int;
  v_error_msg varchar2(5000);
  v_success varchar2(10);
  v_brddocid varchar2(200);
  i_sex int;
  l_identity  identities.identity%TYPE;
  v_dept_keyvalue varchar2(200);
  v_port varchar2(20);
  i_card_type int;
  v_terminal varchar2(100);
  v_visatype_code varchar2(100);
  v_visatype_seqno varchar2(100);
  BEGIN
  v_success :='False';
--//////////////////////////////////////Get Data//////////////////////////////////////////
    SELECT a.Efamilynm,a.Efirstnm,a.Emiddlenm,a.Nationcd,a.Birthdte,a.Sex,a.Tdtno,a.Visaexpdate,a.Tdtno,a.Tdtexpdate,a.Port
          ,a.Cardtype,a.Visatypecd
    into v_familyname,v_givenname,v_middlename,v_nationality,v_birthdate,v_gender,v_docnumber,v_visa_expire_date,v_passport_no,v_passport_expire_date,v_port
        ,i_card_type,v_visatype_code
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			SUser      VARCHAR2  	PATH '$.User',
			SPassword  VARCHAR2  	PATH '$.Password',
			Efirstnm  VARCHAR2   	PATH '$.Efirstnm',
		    Emiddlenm VARCHAR2    PATH '$.Emiddlenm',
			Efamilynm  VARCHAR2  	PATH '$.Efamilynm',
			Tdtno      VARCHAR2  	PATH '$.Tdtno',
			Tdtexpdate  VARCHAR2  	PATH '$.Tdtexpdate',
            Sex   		VARCHAR2  	PATH '$.Sex',
            Birthdte   	VARCHAR2  	PATH '$.Birthdte',
			Cardtype    VARCHAR2  	PATH '$.Cardtype',
			GateID      VARCHAR2  	PATH '$.GateID',
            Port   		VARCHAR2  	PATH '$.Port',
            Nationcd   	VARCHAR2  	PATH '$.Nationcd',
            Visatypecd   	VARCHAR2  	PATH '$.Visatypecd',
            Visaexpdate   	VARCHAR2  	PATH '$.Visaexpdate',
            Rescerttypecd   	VARCHAR2  	PATH '$.RescertDto.Rescerttypecd',
            Respvcd   	VARCHAR2  	PATH '$.RescertDto.Respvcd',
            Resno   	VARCHAR2  	PATH '$.RescertDto.Resno',
            Resyear   	VARCHAR2  	PATH '$.RescertDto.Resyear',
            Tfirstnm   	VARCHAR2  	PATH '$.RescertDto.Tfirstnm',
            Tmiddlenm   	VARCHAR2  	PATH '$.RescertDto.Tmiddlenm',
            Tfamilynm   	VARCHAR2  	PATH '$.RescertDto.Tfamilynm'
        )) a;

v_familyname := upper(v_familyname);
v_givenname := upper(v_givenname);
v_middlename := upper(v_middlename);
v_passport_no := upper(v_passport_no);
v_docnumber := upper(v_docnumber);
if v_gender ='M' then i_sex :=1; end if;
if v_gender ='F' then i_sex :=2; end if;
--///////////////////////////////////////Get Dept Keyvalue/////////////////////////////////////////////
select b.KEY_VALUE
into v_dept_keyvalue
from PIBICSDM2.DEPARTMENT a
inner join DL_STAGING4PIBICS_INTF.trcd_borderpost b on a.dept_seqno =seqno
where a.DEPTCD = LPAD(v_port,5,'00');

select max(id)
into v_terminal
from dl_bordercontrol.TERMINALS a
where a.BORDER_POST =v_dept_keyvalue and a.active =1;
--///////////////////////////////////////Get COUNTCD///////////////////////////////////////////////////
SELECT COU.COUNTCD,COU.COUNT_SEQNO  
into v_countcd,i_count_seqno
FROM PIBICSDM2.COUNTRY COU 
WHERE COU.ABBCOUNT = v_nationality;

--///////////////////////////////////////Get VISATYPE///////////////////////////////////////////////////
select b.KEY_VALUE
into v_visatype_seqno
from dual aa
left join (select b.KEY_VALUE from PIBICSDM2.VISATYPE a
inner join DL_STAGING4PIBICS_INTF.trcd_visatype b on a.VISATYPE_SEQNO =seqno and  a.VISATYPECD = v_visatype_code) b on 1=1;

--//////////////////////////////////////Check Blacklist///////////////////////////////////
 select JSON_OBJECT(
                   'demographic' VALUE  ( select JSON_OBJECT(
                                          'dateOfBirth' value to_char(to_date(v_birthdate,'yyyymmdd'),'yyyy-mm-dd')||'T00:00:00.000Z',
                                          'expiryDate' value to_char(to_date(v_visa_expire_date,'yyyymmdd'),'yyyy-mm-dd'),
                                        'firstname' value v_givenname,
                                        'nationality' value v_nationality,
                                        'passportNumber' value v_passport_no,
                                        'surname' value v_familyname,
                                        'sex' value v_gender,
                                        'placeOfBirth' value '',
                                        'passportExpiryDate' value to_char(to_date(v_passport_expire_date,'yyyymmdd'),'yyyy-mm-dd'),
                                        'passportIssuingCountry' value ''
                                         )
                                         from dual
                                         ),
                    'TransactionID' value 'blackListSearch1533284278303'

                   )
into c_data
from dual;
  v_url := 'http://172.16.0.120/bpm/blacklist/search';
  l_obj := JSON_OBJECT_T(c_data);
  PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);  
  select case when c_count >0 then 'Y' else 'N' end as foundbwl
  into v_foundbwl
from (
    select sum(case when key_value is not null then 1 else 0 end) as c_count
   from  json_table(b_x_response_message  FORMAT JSON, '$'
         COLUMNS (
           NESTED                      PATH '$.candidates[*]'
             COLUMNS (
              key_value                VARCHAR2        PATH '$.key_value'
                     )
                )
             )a
    group by key_value
    ) a;
    
--//////////////////////////////////////Check Over Stay////////////////////////////////////////////////
v_sql :='';
v_where := ' and 1=1 ';
if v_familyname is not null then
v_where := v_where ||' and a.EFAMILYNM  ='''||v_familyname||'''';
end if;

if v_givenname  is not null then
v_where := v_where ||' and a.EFIRSTNM  ='''||v_givenname ||'''';
end if;

if v_middlename is not null then
v_where := v_where ||' and a.EMIDDLENM  ='''||v_middlename||'''';
end if;

if v_countcd is not null then
v_where := v_where ||' and a.NATION_SEQNO  ='||i_count_seqno||'';
end if;

if v_birthdate is not null then
v_where := v_where ||' and a.BIRTH_DATE ='''||v_birthdate||'''';
end if;

if v_gender is not null then
v_where := v_where ||' and a.SEX ='''||v_gender||'''';
end if;

if v_docnumber is not null then
v_where := v_where ||' and a.CPASSPORTNO  ='''||v_docnumber||'''';
end if;

v_sql :=v_sql||' select case when b.PRESULT=''Y'' and c.DERESULT is null then ''Y'' else (case when to_date('''||v_visa_expire_date||''',''yyyymmdd'') < SYSDATE then ''Y'' else ''N'' end)';
v_sql :=v_sql||'        end as FoundOverstay';
v_sql :=v_sql||' from dual a';
v_sql :=v_sql||' left join (SELECT ''Y'' as PRESULT ,a.*';
v_sql :=v_sql||'            FROM PIBICSDM2.PROCESSOT a';
v_sql :=v_sql||'            WHERE rownum=1 '||v_where||'';
v_sql :=v_sql||' 		   ) b on 1=1';
v_sql :=v_sql||' left join (SELECT ''Y'' as DERESULT ,a.*';
v_sql :=v_sql||'            FROM PIBICSDM2.DELPROCESSOT a';
v_sql :=v_sql||'            WHERE rownum=1 '||v_where||' ';
v_sql :=v_sql||' 		   ) c on 1=1';

open c_cursor_overstay for v_sql;
 LOOP
            FETCH c_cursor_overstay
            INTO v_found_overstay;
            EXIT WHEN c_cursor_overstay%NOTFOUND;
 END LOOP; 
 close c_cursor_overstay;

--/////////////////////////////////////Check Visa Run//////////////////////////////////////////////////
SELECT case when T.vsrpersonseqno is not null then 'Y' else 'N' end as found_visa_run
into v_found_visa_run
FROM dual  a
 left join PIBICSDM2.TMVISARUNPERSON T on T.FLAGVISARUN = 'Y'
 AND T.NATIONCD = v_countcd
AND T.PASSPORTNO = v_docnumber;
if v_foundbwl  <> 'Y' and v_found_overstay <> 'Y' and v_found_visa_run <> 'Y' then
--///////////////////////////////////////Get person id/////////////////////////////////////////////////
/*v_sql := '';
v_sql := v_sql ||' ';
v_sql := v_sql ||' SELECT max(IMM.PERSONID) as PERSONID ';
v_sql := v_sql ||' FROM  PIBICSDM2.IMMIGRATION IMM ';
v_sql := v_sql ||' WHERE 1=1 ';

if v_familyname is not null then
v_sql := v_sql ||' and IMM.EFAMILYNM ='''||v_familyname||'''';
end if;

if v_givenname  is not null then
v_sql := v_sql ||' and IMM.EFIRSTNM ='''||v_givenname ||'''';
end if;

if v_middlename is not null then
v_sql := v_sql ||' and IMM.EMIDDLENM ='''||v_middlename||'''';
end if;

if v_countcd is not null then
v_sql := v_sql ||' and IMM.NATIONCD ='''||v_countcd||'''';
end if;

if v_birthdate is not null then
v_sql := v_sql ||' and IMM.BIRTHDTE ='''||v_birthdate||'''';
end if;

if v_gender is not null then
v_sql := v_sql ||' and IMM.SEX ='''||v_gender||'''';
end if;

if v_docnumber is not null then
v_sql := v_sql ||' and IMM.TDTNO ='''||v_docnumber||'''';
end if;

open c_cursor for v_sql;
 LOOP
            FETCH c_cursor
            INTO v_person_id;
            EXIT WHEN c_cursor%NOTFOUND;
 END LOOP; 
 close c_cursor;
if v_person_id is null then
--Generate person id
SELECT 'S'||to_char(current_timestamp(5),'ddmmyyyyhh24missFF') AS PersonID into v_person_id  FROM DUAL ;
end if;
*/

--/////////////////////////////////Insert Borderdocuments///////////////////////////////////////////////////
v_sql :=' select a.BRDDOCID';
v_sql := v_sql ||' from DL_BORDERCONTROL.BORDERDOCUMENTS a ';
v_sql := v_sql ||' where a.DOCNO ='''||v_docnumber||''' ';
--v_sql := v_sql ||' and a.GIVENNAME ='''||v_givenname||''' ';
--v_sql := v_sql ||' and a.SURNAME ='''||v_familyname||''' ';

/*if v_middlename is not null then
v_sql := v_sql ||' and a.MIDDLENAME ='''||v_middlename||'''';
end if;*/
v_sql := v_sql ||' and a.NAT ='''||v_nationality||''' ';
--v_sql := v_sql ||' and a.CALC_DOB =to_date('''||v_birthdate||''',''yyyymmdd'') ';
--v_sql := v_sql ||' and a.sex ='||i_sex||' ';
v_sql := v_sql ||' and a.expirydate =to_date('''||v_passport_expire_date||''',''yyyymmdd'') ';
open c_cursor for v_sql;
 LOOP
            FETCH c_cursor
            INTO v_brddocid;
            EXIT WHEN c_cursor%NOTFOUND;
 END LOOP; 
 close c_cursor;


if v_brddocid is null then


	  v_brddocid := PKG_BORDERDOCUMENTS.Create_Document(
                    P_DOCNO               => v_docnumber,
                    P_DOCTYPE             => 'P',
                    P_ISSUECTRY           => v_nationality,
                    P_EXPIRYDATE          => to_date(v_passport_expire_date,'yyyymmdd'),
                    P_SURNAME             => v_familyname,
                    P_GIVENNAME           => v_givenname,
                    P_MIDDLENAME          => v_middlename,
                    P_SEX                 => i_sex,
                    P_DOB                 =>to_char(to_date(v_birthdate,'yyyymmdd'),'yymmdd'),
                    P_MRZDG1              => null,
                    P_INS_TERMINAL        => v_terminal,
                    P_INS_BORDERPOST      => v_dept_keyvalue,
                    P_Img_VISUAL_FACE     =>null, -- several Collections are called (more performance possible?)
                    P_Img_ICAO_FACE       => null,
                    P_Img_VISUALPAGE      => null,
                    P_Img_UVPAGE          => null,
                    P_Img_IRPAGE          => null,
                    P_Img_DG3_0           => null, 
                    P_Img_DG3_1           => null, 
                    P_MANUAL_EXPIRY_DATE  => null,
                    P_MANUAL_ISSUING_DATE =>null,
                    P_MANUAL_NATIONALITY  => v_nationality,
                    P_MANUAL_PLACEOFBIRTH => null,
                    P_DOCCLASS            => 'P',
                    X_IDENTITY            => l_identity
                  );
end if;


--/////////////////////////////////Insert Movements/////////////////////////////////////////////////////////
                 Create_Movement(
                            P_BRDDOCID	 => v_brddocid,
                            P_LANDBARCD	 => null,
                            P_EXITFLG	 => i_card_type-1,
                            P_MAX_STAY_DT	 => null,
                            P_FINGERMATCH	 => null,
                            P_FACEMATCH	 => null,
                            P_MVMNTADDR	 => null,
                            P_ORIDEST	 => null,
                            P_INS_AT	 => sysdate,
                            P_INS_TERMINAL	 => v_terminal,
                            P_INS_BORDERPOST	 => v_dept_keyvalue,
                            P_REFUSEDFLG	 => null,
                            P_OBSERVATION	 => null,
                            P_TRNSPRTUNITID	 => 1,
                            P_PERSON_TYPE	 => 1,
                            P_SCANNED_FLIGHT	 => '-',
                            P_PS_1	 => null,
                            P_PS_2	 => null,
                            P_PS_3	 => null,
                            P_PS_4	 => null,
                            P_PS_5	 => null,
                            P_PS_6	 => null,
                            P_PS_7	 => null,
                            P_PS_8	 => '99',
                            P_PS_9	 => null,
                            P_PS_10	 => null,
                            P_FINGERMATCH_HISTORY	 => null,
                            P_FACEMATC_HISTORY	 => null,
                            P_REASON_OFFLOAD	 => null,
                            P_REASON_DEPORTEE	 => null,
                            P_VISA_TYPE	 => v_visatype_seqno,
                            P_VISA	 => null,
                            P_DML_AT	 => systimestamp,
                            P_DML_BY	 => 'AUTOCHANNELSER',
                            P_DML_TYPE	 => 'I',
                            P_INS_BY	 => 'AUTOCHANNELSER',
                            P_IS_FINISHED	 => 'Y',
                            P_PRIOR_MOVEMENT	 => null,
                            P_ENTRY_FORM	 => null,
                            P_FORM_NO_APPROVED	 => 'N',
                            P_MOVEMENT_DT	 => sysdate ,
                            P_SOURCE_SYSTEM	 => 1,
                            P_DATE_OF_ENTRY	 => null,
                            P_MRZVISA	 => null
                  );
/*
--/////////////////////////////////Insert Imagration////////////////////////////////////////////////////////
MERGE INTO PIBICSDM2.IMMIGRATION  T
USING(
SELECT v_person_id as personid ,
           '' as tm6Number ,
           sysdate  as INOUTDTE,
            a.Cardtype ,
a.Tfirstnm ,
a.Tmiddlenm,
a.Tfamilynm,
Upper(a.Efirstnm) as Efirstnm ,
Upper(a.Emiddlenm) as Emiddlenm ,
Upper(a.Efamilynm) as Efamilynm,
a.Sex ,
a.Birthdte ,
c.COUNTCD  ,
null as travel_doctype ,
a.Tdtno ,
to_date(a.Visaexpdate,'yyyymmdd')  as Visaexpdate,
to_date(a.Tdtexpdate,'yyyymmdd') as  Tdtexpdate,
null as remark ,
null as imgPerson ,
a.port ,
null as imgPassport,
0 as FLAGPASS,  
'0' as STATUS,
null as PM_RE_ENTRY,
null as PM_REEXPDTE,
null as PM_EXTENSION ,
null  as PM_EXEXPDTE,
null as PM_NON_QUOTA,
null as PM_NONEXPDTE,
null as NEWPERMIT ,
null as permitcd,
null as convcd ,
null as convName2 ,
'AUTOCHANNELSER' as createUser ,
current_date as create_date ,
null as convSeqNo,
b.visatype_seqno,
 c.count_seqno  ,
null as permitSeqNo  ,
null as convName1 ,
b.Visatypecd ,
null as convProvSeqNo ,
null  as RPJSEQNO,
case when a.Nationcd ='THA' then a.Nationcd else null end as RESCERTNO ,
case when a.Nationcd ='THA' then a.Nationcd else null end  as CITIZENID,
d.dept_seqno
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			SUser      VARCHAR2  	PATH '$.User',
			SPassword  VARCHAR2  	PATH '$.Password',
			Efirstnm  VARCHAR2   	PATH '$.Efirstnm',
		    Emiddlenm VARCHAR2    PATH '$.Emiddlenm',
			Efamilynm  VARCHAR2  	PATH '$.Efamilynm',
			Tdtno      VARCHAR2  	PATH '$.Tdtno',
			Tdtexpdate  VARCHAR2  	PATH '$.Tdtexpdate',
            Sex   		VARCHAR2  	PATH '$.Sex',
            Birthdte   	VARCHAR2  	PATH '$.Birthdte',
			Cardtype    VARCHAR2  	PATH '$.Cardtype',
			GateID      VARCHAR2  	PATH '$.GateID',
            Port   		VARCHAR2  	PATH '$.Port',
            Nationcd   	VARCHAR2  	PATH '$.Nationcd',
            Visatypecd   	VARCHAR2  	PATH '$.Visatypecd',
            Visaexpdate   	VARCHAR2  	PATH '$.Visaexpdate',
            Rescerttypecd   	VARCHAR2  	PATH '$.RescertDto.Rescerttypecd',
            Respvcd   	VARCHAR2  	PATH '$.RescertDto.Respvcd',
            Resno   	VARCHAR2  	PATH '$.RescertDto.Resno',
            Resyear   	VARCHAR2  	PATH '$.RescertDto.Resyear',
            Tfirstnm   	VARCHAR2  	PATH '$.RescertDto.Tfirstnm',
            Tmiddlenm   	VARCHAR2  	PATH '$.RescertDto.Tmiddlenm',
            Tfamilynm   	VARCHAR2  	PATH '$.RescertDto.Tfamilynm'
        )) a
        left join PIBICSDM2.VISATYPE b on a.Visatypecd =b.VISATYPECD
        left join PIBICSDM2.COUNTRY c on a.Nationcd= c.ABBCOUNT 
        left join PIBICSDM2.department d on a.port =d.deptcd
) s on (t.personid=s.personid)
WHEN MATCHED THEN 
update set 
       t.BIRTHDTE = s.Birthdte ,
       t.CARDTYPE = s.Cardtype,
       t.CONV_SEQNO = s.convSeqNo ,
       t.CONVCD = s.convcd,
       t.CONVREGNO = s.convName2,
       t.COUNT_SEQNO = s.count_seqno,
       t.CREATE_BY = s.createUser ,
       t.CREATE_DATE = s.create_date ,
       t.DEPT_SEQNO =s.dept_seqno ,
       t.DEPTCD = s.port  ,
       t.DEPTCDORG = NULL,
       t.EFAMILYNM = s.Efamilynm,
       t.EFIRSTNM = s.Efirstnm,
       t.EMIDDLENM = s.Emiddlenm ,
       t.FLAGDUPPERSON = NULL,
       t.FLAGPASS = NULL,
       t.FLIGHTNUMBER = s.convName2 ,
       t.FLIGHTPREFIX = s.convName1,
       t.INOUTDTE =s.INOUTDTE,
       t.NATIONCD = s.COUNTCD ,
       t.NEWPERMIT = NULL,
       t.PASS_SEQNO = NULL,
       t.PASSPORTDTE = NULL,
       t.PASSPORTEXPDTE = s.Tdtexpdate,
       t.PASSPORTISU = '0',
       t.PD_SEQNO = 0,
       t.PERMIT_SEQNO = NULL,
       t.PERMITCD = NULL,
       t.PM_EXEXPDTE = NULL,
       t.PM_EXTENSION = '',
       t.PM_NONEXPDTE = NULL,
       t.PM_NON_QUOTA = '',
       t.PM_RE_ENTRY = '',
       t.PM_REEXPDTE = NULL,
       t.PV_SEQNO = s.convProvSeqNo ,
       t.REMARK = s.remark,
       t.RESCERTTYPE = NULL,
       t.RESNOYEAR = NULL,
       t.RESPVCD = NULL,
       t.SEQNO = NULL,
       t.SEX = s.Sex,
       t.STATUS = '0',
       t.TDTCD =s.travel_doctype,
       t.TDTNO = s.Tdtno,
       t.TFAMILYNM = s.Tfamilynm,
       t.TFIRSTNM = s.Tfirstnm,
       t.TM2INOUT_SEQNO = NULL,
       t.TM5_SEQNO = NULL,
       t.TM6NO = s.tm6Number,
       t.TMIDDLENM = s.Tmiddlenm ,
       t.UPDATE_BY = s.createUser ,
       t.UPDATE_DATE =current_timestamp,
       t.UPDDTE = sysdate,
       t.UPDTERM = null,
       t.UPDUSR = s.createUser,
       t.VERSION = 1,
       t.VISAEXPDTE = s.Visaexpdate ,
       t.VISATYPE_SEQNO =s.visatype_seqno,
       t.VISATYPECD = s.Visatypecd ,
       t.VISATYPECDORG = NULL,
       t.ZONE_SEQNO = 0,
       t.IMGINOUT =null,
       t.IMGPASS = null,
       t.RPJSEQNO = NULL,    
       t.RESCERTNO = s.RESCERTNO,          
       t.CITIZENID = s.CITIZENID 
WHEN NOT MATCHED THEN
INSERT (
                        t.PERSONID,
                         t.TM6NO,
                         t.INOUTDTE,
                         t.CARDTYPE,
                         t.TFIRSTNM,
                         t.TMIDDLENM,
                         t.TFAMILYNM,
                         t.EFIRSTNM,
                         t.EMIDDLENM,
                         t.EFAMILYNM,
                         t.SEX,
                         t.BIRTHDTE,
                         t.NATIONCD,
                         t.TDTCD,
                         t.TDTNO,
                         t.VISAEXPDTE,
                         t.PASSPORTEXPDTE,
                         t.REMARK,
                         t.IMGINOUT,
                         t.DEPTCD,
                         t.IMGPASS,
                         t.FLAGPASS,
                         t.STATUS,
                         t.PM_RE_ENTRY,
                         t.PM_REEXPDTE,
                         t.PM_EXTENSION,
                         t.PM_EXEXPDTE,
                         t.PM_NON_QUOTA,
                         t.PM_NONEXPDTE,
                         t.NEWPERMIT,
                         t.PERMITCD,
                         t.CONVCD,
                         t.CONVREGNO,
                         t.CREATE_BY,
                         t.CREATE_DATE,
                         t.CONV_SEQNO,
                         t.VISATYPE_SEQNO,
                         t.DEPT_SEQNO,
                         t.COUNT_SEQNO,
                         t.PERMIT_SEQNO,
                         t.FLIGHTPREFIX,
                         t.FLIGHTNUMBER,
                         t.VISATYPECD,
                         t.PV_SEQNO,
                         t.RPJSEQNO, 
                         t.RESCERTNO,                        
                         t.CITIZENID
)VALUES(
v_person_id ,
s.tm6Number ,
s.INOUTDTE ,
s.Cardtype ,
s.Tfirstnm ,
s.Tmiddlenm,
s.Tfamilynm,
s.Efirstnm ,
s.Emiddlenm ,
s.Efamilynm ,
s.Sex ,
s.Birthdte ,
s.COUNTCD  ,
s.travel_doctype ,
s.Tdtno ,
s.Visaexpdate ,
s.Tdtexpdate ,
s.remark ,
s.imgPerson ,
s.port ,
s.imgPassport,
s.FLAGPASS,  
s.STATUS,
s.PM_RE_ENTRY,
s.PM_REEXPDTE,
s.PM_EXTENSION ,
s.PM_EXEXPDTE,
s.PM_NON_QUOTA,
s.PM_NONEXPDTE,
s.NEWPERMIT ,
s.permitcd ,
s.convcd ,
s.convName2 ,
s.createUser ,
s.create_date ,
s.convSeqNo,
s.visatype_seqno,
s.dept_seqno ,
s.count_seqno  ,
s.permitSeqNo  ,
s.convName1 ,
s.convName2 ,
s.Visatypecd ,
s.convProvSeqNo ,
s.RPJSEQNO,
s.RESCERTNO ,
s.CITIZENID
);

--//////////////////////////Get Inout Seqno////////////////////////////////////////////
SELECT PIBICSDM2.TMINOUT_SEQ.NEXTVAL into i_inout_seqno FROM DUAL;

--/////////////////////////Insert TMINOUT/////////////////////////////////////////////
INSERT INTO PIBICSDM2.TMINOUT (SEQNO,
                     BIRTHDTE,
                     CARDTYPE,
                     CHKPOINTNO,
                     CONV_SEQNO,
                     CONVCD,
                     CONVREGNO,
                     COUNT_SEQNO,
                     CREATE_BY,
                     CREATE_DATE,
                     CREDTE,
                     CREDTERM,
                     CREUSR,
                     DEPT_SEQNO,
                     DEPTCD,
                     DEPTCDORG,
                     EFAMILYNM,
                     EFIRSTNM,
                     EFSNDXNM,
                     ELSNDXNM,
                     EMIDDLENM,
                     EMSNDXNM,
                     FLAGFINES,
                     FLAGJOINPASS,
                     FLIGHTNUMBER,
                     FLIGHTPREFIX,
                     INOUTDTE,
                     INTYPE,
                     ISPROCESS,
                     NATIONCD,
                     NEWPERMIT,
                     PASS_SEQNO,
                     PASSPORTDTE,
                     PASSPORTEXPDTE,
                     PASSPORTISU,
                     PD_SEQNO,
                     PERMIT_SEQNO,
                     PERMITCD,
                     PERSONID,
                     PM_EXEXPDTE,
                     PM_EXTENSION,
                     PM_NON_QUOTA,
                     PM_NONEXPDTE,
                     PM_RE_ENTRY,
                     PM_REEXPDTE,
                     PV_SEQNO,
                     REMARK,
                     RESCERTTYPE,
                     RESNOYEAR,
                     RESPVCD,
                     SEX,
                     STATUS,
                     TARGETNO,
                     TDTCD,
                     TDTNO,
                     TFAMILYNM,
                     TFIRSTNM,
                     TFSNDXNM,
                     TLSNDXNM,
                     TM2INOUT_SEQNO,
                     TM5_SEQNO,
                     TM6NO,
                     TMIDDLENM,
                     TMSNDXNM,
                     TRAVCD,
                     TYPEDATA,
                     UPDATE_BY,
                     UPDATE_DATE,
                     UPDDTE,
                     UPDTERM,
                     UPDUSR,
                     VERSION,
                     VISAEXPDTE,
                     VISATYPE_SEQNO,
                     VISATYPECD,
                     ZONE_SEQNO,
                     IMGINOUT,
                     RPJSEQNO,                     
                     RESCERTNO,                     
                     CITIZENID                     
                     )
select 
      i_inout_seqno as InoutPK,
        a.Birthdte,
a.Cardtype,
NULL,
null as convSeqNo,
null as convcd,
null as convName1,
c.count_seqno,
'AUTOCHANNELSER',
current_date,
current_date,
null as ip_client,
'AUTOCHANNELSER',
d.dept_seqno,
d.deptcd,
NULL,
Upper(a.Efamilynm),
Upper(a.Efirstnm),
SOUNDEX (UPPER (a.Efirstnm)),
SOUNDEX (UPPER (a.Efamilynm)),
UPPER (a.Emiddlenm),
SOUNDEX (UPPER (a.Emiddlenm)),
null as ragOverStay,
NULL  as FLAGJOINPASS ,
null as convName2,
null as convName1,
sysdate as inOutDate,
null as initType,
NULL,
c.COUNTCD ,
NULL,
NULL,
NULL,
to_date(a.Tdtexpdate,'yyyymmdd') as  Tdtexpdate,
'0',
0,
NULL,
NULL,
v_person_id,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
null as remark,
NULL,
NULL,
NULL,
a.Sex,
'0',
NULL,
null as TDT_CD,
a.Tdtno,
a.Tfamilynm,
a.Tfirstnm,
SOUNDEX (a.Tfirstnm),
SOUNDEX (a.Tfamilynm),
NULL,
NULL,
null as tm6Number,
a.Tmiddlenm,
SOUNDEX (a.Tmiddlenm),
null as TRAVCD,
'autochannel'||'-'||'CFBL',
'AUTOCHANNELSER',
current_date,
current_date,
NULL,
NULL,
0,
to_date(a.Visaexpdate,'yyyymmdd')  as Visaexpdate,
b.visatype_seqno,
b.Visatypecd ,
0,
null as ImgPerson,
NULL  ,
case when a.Nationcd ='THA' then a.Nationcd else null end as RESCERTNO,
case when a.Nationcd ='THA' then a.Nationcd else null end  as CITIZENID
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			SUser      VARCHAR2  	PATH '$.User',
			SPassword  VARCHAR2  	PATH '$.Password',
			Efirstnm  VARCHAR2   	PATH '$.Efirstnm',
		    Emiddlenm VARCHAR2    PATH '$.Emiddlenm',
			Efamilynm  VARCHAR2  	PATH '$.Efamilynm',
			Tdtno      VARCHAR2  	PATH '$.Tdtno',
			Tdtexpdate  VARCHAR2  	PATH '$.Tdtexpdate',
            Sex   		VARCHAR2  	PATH '$.Sex',
            Birthdte   	VARCHAR2  	PATH '$.Birthdte',
			Cardtype    VARCHAR2  	PATH '$.Cardtype',
			GateID      VARCHAR2  	PATH '$.GateID',
            Port   		VARCHAR2  	PATH '$.Port',
            Nationcd   	VARCHAR2  	PATH '$.Nationcd',
            Visatypecd   	VARCHAR2  	PATH '$.Visatypecd',
            Visaexpdate   	VARCHAR2  	PATH '$.Visaexpdate',
            Rescerttypecd   	VARCHAR2  	PATH '$.RescertDto.Rescerttypecd',
            Respvcd   	VARCHAR2  	PATH '$.RescertDto.Respvcd',
            Resno   	VARCHAR2  	PATH '$.RescertDto.Resno',
            Resyear   	VARCHAR2  	PATH '$.RescertDto.Resyear',
            Tfirstnm   	VARCHAR2  	PATH '$.RescertDto.Tfirstnm',
            Tmiddlenm   	VARCHAR2  	PATH '$.RescertDto.Tmiddlenm',
            Tfamilynm   	VARCHAR2  	PATH '$.RescertDto.Tfamilynm'
        )) a
        left join PIBICSDM2.VISATYPE b on a.Visatypecd =b.VISATYPECD
        left join pibicsdm2.COUNTRY c on a.Nationcd= c.ABBCOUNT 
        left join pibicsdm2.department d on a.port =d.deptcd;*/
 commit;
 v_success :='True';
 end if;
 
 --//////////////////////////////////Response///////////////////////////////////////////////////////////
 select JSON_OBJECT(
                   'Success' VALUE v_success,
                   'ErrorDesc' VALUE '',
                   'MsgDesc' VALUE '',
                   'FoundBWL' VALUE v_foundbwl,
                   'FoundOverstay' VALUE v_found_overstay,
                   'FoundVisaRun' VALUE v_found_visa_run,
                   'FoundExt' VALUE 'N',
                   'FoundReps' VALUE 'N',
                   'FoundRqs' VALUE 'N',
                   'FoundCrs' VALUE 'N',
                   'FoundEdnq' VALUE 'N',
                   'FoundChngvisa' VALUE'N',
                   'Re_personid' VALUE case when v_success='True' then v_person_id else '' end,
                   'Re_seqno' VALUE case when v_success='True' then v_brddocid else '' end,
                   'ListWlcd' VALUE ( select JSON_ARRAYAGG( 
                                                          JSON_OBJECT (
                                                                       'Wlcd' VALUE a.CASE_NUMBER
                                                                    )
                                                                            
                                                       )
                                    FROM DL_BLACKLIST.BLACKLIST_CASES a
                                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES b on a.id=b.BLACKLIST_CASE
                                        WHERE b.IDENTITY in (
                                        select key_value
                                           from  json_table(b_x_response_message  FORMAT JSON, '$'
                                                 COLUMNS (
                                                   NESTED                      PATH '$.candidates[*]'
                                                     COLUMNS (
                                                      key_value                VARCHAR2        PATH '$.key_value'
                                                             )
                                                        )
                                                     )a
                                            group by key_value
                                        )
                                   )
                  )
into p_response
from dual;
   exception when others then
    rollback;
    v_error_msg := sqlerrm;
     select JSON_OBJECT(
                   'Success' VALUE 'False',
                   'ErrorDesc' VALUE v_error_msg,
                   'MsgDesc' VALUE '',
                   'FoundBWL' VALUE v_foundbwl,
                   'FoundOverstay' VALUE v_found_overstay,
                   'FoundVisaRun' VALUE v_found_visa_run,
                   'FoundExt' VALUE 'N',
                   'FoundReps' VALUE 'N',
                   'FoundRqs' VALUE 'N',
                   'FoundCrs' VALUE 'N',
                   'FoundEdnq' VALUE 'N',
                   'FoundChngvisa' VALUE'N',
                   'Re_personid' VALUE '',
                   'Re_seqno' VALUE ''
                  )
into p_response
from dual;
  END SP_CALLFNSERVICESBYLIST;


 PROCEDURE SP_CALLSERVICESWATCHLISTPIC (
        p_request     IN blob,
        p_response   OUT clob,
         p_response_img   OUT clob
    ) AS
    b_image blob;
c_image clob;
c_data clob;
v_error_msg varchar2(5000);
v_wlcd varchar2(200);
v_seqno varchar2(200);
json_obj json := json ();
l_obj json_object_t;
l_temp_obj1 json_object_t;
l_temp_obj2 json_object_t;
l_temp_obj3 json_object_t;
RES CLOB;
      BEGIN
      
     SELECT a.Seqno,a.Wlcd
	INTO v_seqno,v_wlcd
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			Seqno      number  	PATH '$.Seqno',
			Wlcd        	VARCHAR2  	PATH '$.Wlcd'
        )) a;


--v_wlcd :='B000466';
     select JSON_OBJECT(
                   'Success' VALUE case when b.BLOB_VALUE is null then 'False' else 'True' end,
                   'ErrorDesc' VALUE '',
                   'Wlcd' VALUE v_wlcd,
                   'Seqno' VALUE v_seqno
                  -- 'wlpic' VALUE b.BLOB_VALUE
                  ),b.BLOB_VALUE
into c_data,b_image
from  dual a
left join 
(select *
from (
SELECT BC.ID AS BLACKLIST_CASE_ID, BC.CASE_NUMBER, I.ID AS IMAGE_ID, I.BLOB_VALUE 
       , ROW_NUMBER() OVER (PARTITION BY BC.CASE_NUMBER ORDER BY LAST_UPDATED_AT DESC) RN
FROM DL_BLACKLIST.BLACKLIST_CASES BC
INNER JOIN DL_BLACKLIST.BIOMETRICS B ON BC.ID = B.BLACKLIST_CASE_ID
INNER JOIN DL_BLACKLIST.FACES F ON B.ID = F.BIOMETRIC_ID
INNER JOIN DL_BLACKLIST.IMAGES I ON F.IMAGE_ID = I.ID
WHERE I.BLOB_VALUE IS NOT NULL
AND BC.CASE_NUMBER =v_wlcd
) a
where a.rn=1) b on 1=1;
 
  l_obj := JSON_OBJECT_T(c_data);
 --l_obj.put('wlpic',FN_BLOB_TO_CLOB(b_image));
  c_image := FN_BLOB_TO_CLOB(b_image);
  RES := l_obj.stringify;
p_response := RES;
p_response_img := c_image;

  exception when others then
    rollback;
    v_error_msg := sqlerrm;
     select JSON_OBJECT(
                   'Success' VALUE 'False',
                   'ErrorDesc' VALUE v_error_msg,
                   'Wlcd' VALUE v_wlcd,
                   'Seqno' VALUE v_seqno,
                   'wlpic' VALUE ''
                  )
into p_response
from dual;

p_response_img:=null;
 END SP_CALLSERVICESWATCHLISTPIC;
 
 
 PROCEDURE SP_RESENDFNIMG (
        p_request     IN blob,
        p_response   OUT clob
    ) AS
  i_check_brdocid int;
v_seqno  VARCHAR2(200);
v_tm6no VARCHAR2(200);
v_flightno varchar2(200);
v_error_msg varchar2(5000);
v_personid varchar2(5000);
REQ_DATA     JSON;
IMGINOUT_VAL CLOB;
IMGPASS_VAL CLOB;
i_size_img_pass int;
i_size_img_inout int;
v_port varchar2(50);
v_boderpost varchar2(200);
v_terminal varchar2(200);
RES clob;
  BEGIN
   SELECT a.Seqno,a.Tm6No,a.Flightno,a.Port
	INTO v_seqno,v_tm6no,v_flightno,v_port
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			Seqno      VARCHAR2  	PATH '$.Seqno',
			Tm6No        	VARCHAR2  	PATH '$.Tm6No',
			Flightno 		VARCHAR2   	PATH '$.Flightno',
            Port VARCHAR2   	PATH '$.Port'
        )) a;

--///////////////////////////////////////Get Dept Keyvalue/////////////////////////////////////////////
select b.KEY_VALUE
into v_boderpost
from PIBICSDM2.DEPARTMENT a
inner join DL_STAGING4PIBICS_INTF.trcd_borderpost b on a.dept_seqno =seqno
where a.DEPTCD = LPAD(v_port,5,'00');

select max(id)
into v_terminal
from dl_bordercontrol.TERMINALS a
where a.BORDER_POST =v_boderpost and a.active =1;

          REQ_DATA := json(p_request);
          begin 
         dbms_lob.createtemporary(IMGINOUT_VAL, true);
         REQ_DATA.get('Imgperson').get_string(IMGINOUT_VAL);
        EXCEPTION WHEN OTHERS THEN
         IMGINOUT_VAL := null;
        end;

         begin 
         dbms_lob.createtemporary(IMGPASS_VAL, true);
         REQ_DATA.get('Imgpassport').get_string(IMGPASS_VAL);
        EXCEPTION WHEN OTHERS THEN
          IMGPASS_VAL := null;
        end;
        
        if IMGPASS_VAL is not null then
        MERGE INTO dl_bordercontrol.BORDERDOCIMAGES  T
        USING(
        select v_seqno as BRDDOCID,
               2 as SEQNO,
               FN_CLOB_TO_BLOB(IMGPASS_VAL) as IMAGE,
                v_terminal as INS_TERMINAL,
               v_boderpost as INS_BORDERPOST,
               'AUTOCHANNELSER' as DML_BY,
               'AUTOCHANNELSER' as INS_BY
        from dual
        )s on (t.BRDDOCID =s.BRDDOCID and t.seqno =s.seqno)
        WHEN MATCHED THEN 
        update set 
        t.IMAGE =s.IMAGE,
        t.INS_TERMINAL =s.INS_TERMINAL,
        t.INS_BORDERPOST =s.INS_BORDERPOST,
        t.DML_AT =systimestamp ,
        t.DML_BY =s.DML_BY,
        t.DML_TYPE ='U',
        t.INS_BY =s.INS_BY
        WHEN NOT MATCHED THEN
        INSERT (
        t.BRDDOCID
        ,t.SEQNO
        ,t.IMAGE
        ,t.INS_TERMINAL
        ,t.INS_BORDERPOST
        ,t.DML_BY
        ,t.DML_TYPE
        ,t.INS_BY
        )
        values(
        s.BRDDOCID
        ,s.SEQNO
        ,s.IMAGE
        ,s.INS_TERMINAL
        ,s.INS_BORDERPOST
        ,s.DML_BY
        ,'I'
        ,s.INS_BY
        );
    end if;
    
            if IMGINOUT_VAL is not null then
        MERGE INTO dl_bordercontrol.BORDERDOCIMAGES  T
        USING(
        select v_seqno as BRDDOCID,
               0 as SEQNO,
               FN_CLOB_TO_BLOB(IMGINOUT_VAL) as IMAGE,
               v_terminal as INS_TERMINAL,
               v_boderpost as INS_BORDERPOST,
               'AUTOCHANNELSER' as DML_BY,
               'AUTOCHANNELSER' as INS_BY
        from dual
        )s on (t.BRDDOCID =s.BRDDOCID and t.seqno =s.seqno)
        WHEN MATCHED THEN 
        update set 
        t.IMAGE =s.IMAGE,
        t.INS_TERMINAL =s.INS_TERMINAL,
        t.INS_BORDERPOST =s.INS_BORDERPOST,
        t.DML_AT =systimestamp ,
        t.DML_BY =s.DML_BY,
        t.DML_TYPE ='U',
        t.INS_BY =s.INS_BY
        WHEN NOT MATCHED THEN
        INSERT (
        t.BRDDOCID
        ,t.SEQNO
        ,t.IMAGE
        ,t.INS_TERMINAL
        ,t.INS_BORDERPOST
        ,t.DML_BY
        ,t.DML_TYPE
        ,t.INS_BY
        )
        values(
        s.BRDDOCID
        ,s.SEQNO
        ,s.IMAGE
        ,s.INS_TERMINAL
        ,s.INS_BORDERPOST
        ,s.DML_BY
        ,'I'
        ,s.INS_BY
        );
    end if;
    
          select dbms_lob.getlength(image)
          into i_size_img_pass
         from dl_bordercontrol.BORDERDOCIMAGES
         where BRDDOCID =v_seqno and seqno =2;

        select dbms_lob.getlength(image)
          into i_size_img_inout
         from dl_bordercontrol.BORDERDOCIMAGES
         where BRDDOCID =v_seqno and seqno =0;
             select JSON_OBJECT(
                       'Success' VALUE 'True',
                       'ErrorDesc' VALUE '',
                       'SizeIMGPerson' VALUE i_size_img_inout,
                       'SizeIMGPass' VALUE i_size_img_pass
                      )
            into RES
            from dual;
          commit;

  p_response :=  RES;
EXCEPTION 
WHEN OTHERS THEN 
v_error_msg := sqlerrm;
     select JSON_OBJECT(
                   'Success' VALUE 'False',
                   'ErrorDesc' VALUE v_error_msg,
                   'SizeIMGPerson' VALUE '',
                   'SizeIMGPass' VALUE ''
                  )
into RES
from dual;
 p_response :=  RES;
   END SP_RESENDFNIMG;
   

 PROCEDURE SP_BORDERDOCUMENT (
        p_request     IN blob,
        p_response   OUT clob
    ) AS
v_error_msg varchar2(5000);
RES clob;
l_values         APEX_JSON.T_VALUES;
    l_source_blob    BLOB;
    l_source_clob    CLOB;
    --
    l_response       CLOB;
    l_response_message    VARCHAR2(4000 CHAR);
    l_status         INTEGER := 400;
    --
    l_borderdocument_rec    dl_bordercontrol.borderdocuments%ROWTYPE;
    l_identity              dl_bordercontrol.identities.identity%TYPE;
    --
    l_photo_scan    blob;
    l_photo_chip    blob;
    l_photo_pass    blob;
    --
    l_dstoff         INTEGER := 1;
    l_srcoff         INTEGER := 1;
    l_lngctx         INTEGER := 0;
    l_warning        INTEGER;
  BEGIN
  l_source_blob :=p_request;
  
  DBMS_LOB.CREATETEMPORARY(l_source_clob, TRUE);

    DBMS_LOB.CONVERTTOCLOB(dest_lob     => l_source_clob
                          ,src_blob     => l_source_blob
                          ,amount       => dbms_lob.lobmaxsize
                          ,dest_offset  => l_dstoff
                          ,src_offset   => l_srcoff
                          ,blob_csid    => nls_charset_id('AL32UTF8')
                          ,lang_context => l_lngctx
                          ,warning      => l_warning);

    APEX_JSON.PARSE (P_VALUES => l_values
                    ,P_SOURCE => l_source_clob);

    -- fill borderdocument-object (maybe also use get_borderdocument functionality?)
    l_borderdocument_rec.doctype              := apex_json.get_varchar2(p_values => l_values, p_path => 'documentType');
    l_borderdocument_rec.docno                := apex_json.get_varchar2(p_values => l_values, p_path => 'passportNumber');
    l_borderdocument_rec.issuectry            := apex_json.get_varchar2(p_values => l_values, p_path => 'issuingCountry');
    l_borderdocument_rec.nat                  := apex_json.get_varchar2(p_values => l_values, p_path => 'nationality');
    l_borderdocument_rec.dob                  := apex_json.get_varchar2(p_values => l_values, p_path => 'dateOfBirth');
    l_borderdocument_rec.expirydate           := apex_json.get_date(p_values => l_values, p_path => 'expiryDate');
    l_borderdocument_rec.givenname            := apex_json.get_varchar2(p_values => l_values, p_path => 'givenname');
    l_borderdocument_rec.surname              := apex_json.get_varchar2(p_values => l_values, p_path => 'surname');
    l_borderdocument_rec.middlename           := apex_json.get_varchar2(p_values => l_values, p_path => 'middlename');
    l_borderdocument_rec.optionaldata         := apex_json.get_varchar2(p_values => l_values, p_path => 'optionalData');
    l_borderdocument_rec.afisid               := apex_json.get_varchar2(p_values => l_values, p_path => 'abisId');
    l_borderdocument_rec.ins_terminal         := apex_json.get_varchar2(p_values => l_values, p_path => 'terminal');
    l_borderdocument_rec.ins_borderpost       := apex_json.get_varchar2(p_values => l_values, p_path => 'borderpost');
    l_borderdocument_rec.mrzdg1               := apex_json.get_varchar2(p_values => l_values, p_path => 'mrz');
    l_borderdocument_rec.givenname_thai       := apex_json.get_varchar2(p_values => l_values, p_path => 'givennameThai');
    l_borderdocument_rec.middlename_thai      := apex_json.get_varchar2(p_values => l_values, p_path => 'middlenameThai');
    l_borderdocument_rec.surname_thai         := apex_json.get_varchar2(p_values => l_values, p_path => 'surnameThai');
    l_borderdocument_rec.manual_expiry_date   := apex_json.get_date(p_values => l_values, p_path => 'manualExpiryDate');
    l_borderdocument_rec.manual_issuing_date  := apex_json.get_date(p_values => l_values, p_path => 'manualIssuingDate');
    l_borderdocument_rec.manual_nationality   := apex_json.get_varchar2(p_values => l_values, p_path => 'manualNationality');
    l_borderdocument_rec.manual_placeofbirth  := apex_json.get_varchar2(p_values => l_values, p_path => 'manualPlaceOfBirth');
    l_borderdocument_rec.sex                  := apex_json.get_varchar2(p_values => l_values, p_path => 'gender');
    l_borderdocument_rec.docclass             := apex_json.get_varchar2(p_values => l_values, p_path => 'documentClass');
    l_borderdocument_rec.sub_nationality      := apex_json.get_varchar2(p_values => l_values, p_path => 'subNationalities');
  --  l_borderdocument_rec.source_system        := apex_json.get_number(p_values => l_values, p_path => 'sourceSystem');
    l_photo_scan                              := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'photoScan'));
    l_photo_chip                              := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'photoChip'));
    l_photo_pass                              := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'photoPass'));

    -- check if mandatory fields exist
    IF l_borderdocument_rec.doctype         IS NULL OR
       l_borderdocument_rec.docno           IS NULL OR
       l_borderdocument_rec.issuectry       IS NULL OR
       l_borderdocument_rec.nat             IS NULL OR
       l_borderdocument_rec.dob             IS NULL OR
       l_borderdocument_rec.expirydate      IS NULL OR
       l_borderdocument_rec.surname         IS NULL OR
       l_borderdocument_rec.ins_terminal    IS NULL OR
       l_borderdocument_rec.ins_borderpost  IS NULL OR
       l_borderdocument_rec.sex             IS NULL
    THEN

      l_status := 500;
      l_response_message := '';

      CASE WHEN l_borderdocument_rec.doctype        IS NULL THEN l_response_message := l_response_message || '; documentType must not be empty';    ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.docno          IS NULL THEN l_response_message := l_response_message || '; passportNumber must not be empty';  ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.issuectry      IS NULL THEN l_response_message := l_response_message || '; issuingCountry must not be empty';  ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.nat            IS NULL THEN l_response_message := l_response_message || '; nationality must not be empty';     ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.dob            IS NULL THEN l_response_message := l_response_message || '; dateOfBirth must not be empty';     ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.expirydate     IS NULL THEN l_response_message := l_response_message || '; expiryDate must not be empty';      ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.surname        IS NULL THEN l_response_message := l_response_message || '; surname must not be empty';         ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.ins_terminal   IS NULL THEN l_response_message := l_response_message || '; terminal must not be empty';        ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.ins_borderpost IS NULL THEN l_response_message := l_response_message || '; borderpost must not be empty';      ELSE NULL; END CASE;
      CASE WHEN l_borderdocument_rec.sex            IS NULL THEN l_response_message := l_response_message || '; gender must not be empty';          ELSE NULL; END CASE;

    ELSE

        -- check if borderdocument already exists
        l_borderdocument_rec.brddocid := dl_bordercontrol.pkg_borderdocuments.get_document (p_docno      => l_borderdocument_rec.docno
                                                                                           ,p_issuectry  => l_borderdocument_rec.issuectry
                                                                                           ,p_expirydate => l_borderdocument_rec.expirydate);

        IF l_borderdocument_rec.brddocid IS NULL
        THEN
            l_borderdocument_rec.brddocid := dl_bordercontrol.pkg_borderdocuments.create_document(l_borderdocument_rec.docno
                                                                                                 ,l_borderdocument_rec.doctype
                                                                                                 ,l_borderdocument_rec.issuectry
                                                                                                 ,l_borderdocument_rec.expirydate
                                                                                                 ,l_borderdocument_rec.surname
                                                                                                 ,l_borderdocument_rec.middlename
                                                                                                 ,l_borderdocument_rec.givenname
                                                                                                 ,l_borderdocument_rec.sex
                                                                                                 ,l_borderdocument_rec.dob
                                                                                                 ,l_borderdocument_rec.mrzdg1
                                                                                                 ,l_borderdocument_rec.ins_terminal
                                                                                                 ,l_borderdocument_rec.ins_borderpost
                                                                                                 ,l_photo_scan
                                                                                                 ,l_photo_chip
                                                                                                 ,l_photo_pass
                                                                                                 ,null
                                                                                                 ,null
                                                                                                 ,null
                                                                                                 ,null
                                                                                                 ,l_borderdocument_rec.manual_expiry_date
                                                                                                 ,l_borderdocument_rec.manual_issuing_date
                                                                                                 ,l_borderdocument_rec.manual_nationality
                                                                                                 ,l_borderdocument_rec.manual_placeofbirth
                                                                                                 ,l_borderdocument_rec.docclass
                                                                                                 ,l_identity);


            update dl_bordercontrol.borderdocuments 
            set nat             = l_borderdocument_rec.nat
               ,optionaldata    = l_borderdocument_rec.optionaldata
               ,afisid          = l_borderdocument_rec.afisid
               ,givenname_thai  = l_borderdocument_rec.givenname_thai
               ,middlename_thai = l_borderdocument_rec.middlename_thai
               ,surname_thai    = l_borderdocument_rec.surname_thai
               ,sub_nationality = l_borderdocument_rec.sub_nationality
              -- ,source_system   = l_borderdocument_rec.source_system
            where brddocid = l_borderdocument_rec.brddocid;

        END IF;
    END IF;

    IF l_borderdocument_rec.brddocid IS NOT NULL
    THEN
      l_status := 200;
      l_response_message := 'The borderdocument was successfully created.';
     
    END IF;

    select JSON_OBJECT(
                   'response_status_code' VALUE l_status,
                   'response_status_message' VALUE l_response_message,
                   'response_pk' VALUE l_borderdocument_rec.brddocid,
                   'response' VALUE l_response,
                    'status' VALUE l_status
                  )
   into RES
   from dual;
 commit;
  p_response :=  RES;
EXCEPTION 
WHEN OTHERS THEN 
v_error_msg := sqlerrm;
     select JSON_OBJECT(
                   'response_status_code' VALUE 500,
                   'response_status_message' VALUE v_error_msg,
                   'response_pk' VALUE null,
                   'response' VALUE '',
                    'status' VALUE null
                  )
into RES
from dual;
 p_response :=  RES;
   END SP_BORDERDOCUMENT;
   
  PROCEDURE SP_MOVEMENT (
        p_request     IN blob,
        p_response   OUT clob
    ) AS
v_error_msg varchar2(5000);
RES clob;
 l_values         APEX_JSON.T_VALUES;
    l_source_blob    BLOB;
    l_source_clob    CLOB;
    --
    l_response       CLOB;
    l_response_message    VARCHAR2(4000 CHAR);
    l_status         INTEGER := 400;
    --
    l_movement_rec      dl_bordercontrol.movements%ROWTYPE;
    l_movement_blob_rec dl_bordercontrol.movements_blob%ROWTYPE;
    l_entry_forms_rec   dl_bordercontrol.entry_forms%ROWTYPE;
    --
    l_dstoff         INTEGER := 1;
    l_srcoff         INTEGER := 1;
    l_lngctx         INTEGER := 0;
    l_warning        INTEGER;
    
    v_visaNumber     VISAS.VISA_NUMBER%type;
    v_ISSUING_DATE     varchar2(20);
    v_ISSUING_PLACE     VISAS.ISSUING_PLACE%type;
    v_PERMIT_TYPE     VISAS.PERMIT_TYPE%type;
    v_PERMIT_EXPIRY_DATE     varchar2(20);
    v_EXPIRY_DATE_VISA     varchar2(20);
    i_count_visatype int;
    
    l_INCIDENTS_rec dl_bordercontrol.INCIDENTS%ROWTYPE;
    l_PERSON_rec dl_bordercontrol.PERSON%ROWTYPE;
    l_FELLOW_PASSENGER_rec dl_bordercontrol.FELLOW_PASSENGER%ROWTYPE;
    
    l_count     PLS_INTEGER;
  BEGIN
   l_source_blob :=p_request;  
DBMS_LOB.CREATETEMPORARY(l_source_clob, TRUE);

    DBMS_LOB.CONVERTTOCLOB(dest_lob     => l_source_clob
                          ,src_blob     => l_source_blob
                          ,amount       => dbms_lob.lobmaxsize
                          ,dest_offset  => l_dstoff
                          ,src_offset   => l_srcoff
                          ,blob_csid    => nls_charset_id('AL32UTF8')
                          ,lang_context => l_lngctx
                          ,warning      => l_warning);

    APEX_JSON.PARSE (P_VALUES => l_values
                    ,P_SOURCE => l_source_clob);

    -- fill borderdocument-object (maybe also use get_borderdocument functionality?)
    l_movement_rec.brddocid         := apex_json.get_varchar2(p_values => l_values, p_path => 'borderdocumentId');
    l_movement_rec.exitflg          := apex_json.get_varchar2(p_values => l_values, p_path => 'exitFlag');
    l_movement_rec.max_stay_dt      := apex_json.get_date(p_values => l_values, p_path => 'maxStayDate');
    l_movement_rec.ins_terminal     := apex_json.get_varchar2(p_values => l_values, p_path => 'terminal');
    l_movement_rec.ins_borderpost   := apex_json.get_varchar2(p_values => l_values, p_path => 'borderpost');
    l_movement_rec.trnsprtunitid    := apex_json.get_varchar2(p_values => l_values, p_path => 'transportUnit');
    l_movement_rec.person_type      := apex_json.get_varchar2(p_values => l_values, p_path => 'personType');
    l_movement_rec.scanned_flight   := apex_json.get_varchar2(p_values => l_values, p_path => 'scannedFlight');
    l_movement_rec.visa_type        := apex_json.get_varchar2(p_values => l_values, p_path => 'visaType');
    l_movement_rec.visa             := apex_json.get_varchar2(p_values => l_values, p_path => 'visaId');
    l_movement_rec.is_finished      := apex_json.get_varchar2(p_values => l_values, p_path => 'isFinished');
    l_movement_rec.prior_movement   := apex_json.get_varchar2(p_values => l_values, p_path => 'priorMovementId');
    l_movement_rec.movement_dt      := apex_json.get_date(p_values => l_values, p_path => 'movementDate');
    l_movement_rec.date_of_entry    := apex_json.get_date(p_values => l_values, p_path => 'dateOfEntry');
    l_movement_rec.mrzvisa          := apex_json.get_varchar2(p_values => l_values, p_path => 'mrzVisa');
    l_movement_rec.source_system    := apex_json.get_varchar2(p_values => l_values, p_path => 'source_system');
    -- Movement Images
    l_movement_blob_rec.live_photo  := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'livePhoto'));
    l_movement_blob_rec.wsq_ll := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerLL'));
    l_movement_blob_rec.wsq_li := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerLI'));
    l_movement_blob_rec.wsq_lm := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerLM'));
    l_movement_blob_rec.wsq_lr := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerLR'));
    l_movement_blob_rec.wsq_lt := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerLT'));
    l_movement_blob_rec.wsq_rl := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerRL'));
    l_movement_blob_rec.wsq_ri := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerRI'));
    l_movement_blob_rec.wsq_rm := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerRM'));
    l_movement_blob_rec.wsq_rr := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerRR'));
    l_movement_blob_rec.wsq_rt := dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'fingerRT'));
    -- Entry Form
    l_entry_forms_rec.form_no        := apex_json.get_varchar2(p_values => l_values, p_path => 'formNo');
    l_entry_forms_rec.province       := apex_json.get_varchar2(p_values => l_values, p_path => 'province');
    l_entry_forms_rec.district       := apex_json.get_varchar2(p_values => l_values, p_path => 'district');
    l_entry_forms_rec.subdistrict    := apex_json.get_varchar2(p_values => l_values, p_path => 'subdistrict');
    l_entry_forms_rec.address        := apex_json.get_varchar2(p_values => l_values, p_path => 'address');
    l_entry_forms_rec.note           := apex_json.get_varchar2(p_values => l_values, p_path => 'note');
    
    if l_movement_rec.source_system is null 
    then
        l_movement_rec.source_system := 4;
    end if;

    --Visas
    v_visaNumber    := apex_json.get_varchar2(p_values => l_values, p_path => 'visaNumber');
    v_ISSUING_DATE    := apex_json.get_varchar2(p_values => l_values, p_path => 'issuingDate');
    v_ISSUING_PLACE    := apex_json.get_varchar2(p_values => l_values, p_path => 'issuingPlace');
    v_PERMIT_TYPE   := apex_json.get_varchar2(p_values => l_values, p_path => 'permitType');  
    v_PERMIT_EXPIRY_DATE := apex_json.get_varchar2(p_values => l_values, p_path => 'permitExpiryDate'); 
    v_EXPIRY_DATE_VISA   := apex_json.get_varchar2(p_values => l_values, p_path => 'expiryDate'); 
    
    --Blacklist
    l_INCIDENTS_rec.DOCNO    := apex_json.get_varchar2(p_values => l_values, p_path => 'docno');
    l_INCIDENTS_rec.CLIENT_IP    := apex_json.get_varchar2(p_values => l_values, p_path => 'clientip');
    l_INCIDENTS_rec.OFFICER    := apex_json.get_varchar2(p_values => l_values, p_path => 'officer');
    l_INCIDENTS_rec.BL_ACTION    := apex_json.get_varchar2(p_values => l_values, p_path => 'action');
    l_INCIDENTS_rec.BL_REMARKS    := apex_json.get_varchar2(p_values => l_values, p_path => 'reason');
    l_INCIDENTS_rec.LASTNAME    := apex_json.get_varchar2(p_values => l_values, p_path => 'bl_surName');
    l_INCIDENTS_rec.GIVENNAME    := apex_json.get_varchar2(p_values => l_values, p_path => 'bl_givenName');
    l_INCIDENTS_rec.ISSUINGCOUNTRY   := apex_json.get_varchar2(p_values => l_values, p_path => 'bl_passportIssuingCountry');  
    l_INCIDENTS_rec.GENDER := apex_json.get_varchar2(p_values => l_values, p_path => 'bl_sex'); 
    l_INCIDENTS_rec.DOB   := apex_json.get_varchar2(p_values => l_values, p_path => 'bl_dateOfBirth'); 
    
    
    
    
    -- check if mandatory fields exist
    IF l_movement_rec.exitflg         IS NULL OR
       l_movement_rec.ins_terminal    IS NULL OR
       l_movement_rec.ins_borderpost  IS NULL OR
       l_movement_rec.is_finished     IS NULL OR
       l_movement_rec.movement_dt     IS NULL OR
       l_movement_rec.source_system   IS NULL
    THEN

      l_status := 500;
      l_response_message := '';

      CASE WHEN l_movement_rec.exitflg        IS NULL THEN l_response_message := l_response_message || '; exitFlag must not be empty';      ELSE NULL; END CASE;
      CASE WHEN l_movement_rec.ins_terminal   IS NULL THEN l_response_message := l_response_message || '; terminal must not be empty';      ELSE NULL; END CASE;
      CASE WHEN l_movement_rec.ins_borderpost IS NULL THEN l_response_message := l_response_message || '; borderpost must not be empty';    ELSE NULL; END CASE;
      CASE WHEN l_movement_rec.is_finished    IS NULL THEN l_response_message := l_response_message || '; isFinished must not be empty';    ELSE NULL; END CASE;
      CASE WHEN l_movement_rec.movement_dt    IS NULL THEN l_response_message := l_response_message || '; movementDate must not be empty';  ELSE NULL; END CASE;
      CASE WHEN l_movement_rec.source_system  IS NULL THEN l_response_message := l_response_message || '; sourceSystem must not be empty';  ELSE NULL; END CASE;

    ELSE

        if l_movement_rec.visa_type is not null then
           i_count_visatype := 0;
            select count(1)
           into i_count_visatype
                   from DL_COMMON.VISA_TYPES t
                  where t.KEY_VALUE = l_movement_rec.visa_type
                    and t.IS_ACTIVE = 'Y';
                    
         if i_count_visatype >0 then
         
         insert into DL_BORDERCONTROL.VISAS i
          (VISA_TYPE
          ,INS_TERMINAL
          ,INS_BORDERPOST
          ,VISA_NUMBER
          ,ISSUING_DATE
          ,ISSUING_PLACE
          ,BORDERDOCUMENT
          ,PERMIT_TYPE
          ,PERMIT_EXPIRY_DATE
          ,EXPIRY_DATE
           --
           )
        values
          (l_movement_rec.visa_type
          ,l_movement_rec.ins_terminal
          ,l_movement_rec.ins_borderpost
          ,v_visaNumber
          ,to_date(v_ISSUING_DATE,'yyyy-mm-dd')
          ,v_ISSUING_PLACE
          ,l_movement_rec.brddocid
          ,v_PERMIT_TYPE
          ,to_date(v_PERMIT_EXPIRY_DATE,'yyyy-mm-dd')
          ,to_date(v_EXPIRY_DATE_VISA,'yyyy-mm-dd')
           )
        returning i.KEY_VALUE into l_movement_rec.visa  ;
         end if;
        end if;
        
        INSERT INTO dl_bordercontrol.movements(brddocid
                                              ,exitflg
                                              ,max_stay_dt
                                              ,ins_terminal
                                              ,ins_borderpost
                                              ,trnsprtunitid
                                              ,person_type
                                              ,scanned_flight
                                              ,visa_type
                                              ,visa
                                              ,is_finished
                                              ,prior_movement
                                              ,movement_dt
                                              ,date_of_entry
                                              ,mrzvisa
                                              ,source_system)
        VALUES (l_movement_rec.brddocid
               ,l_movement_rec.exitflg
               ,l_movement_rec.max_stay_dt
               ,l_movement_rec.ins_terminal
               ,l_movement_rec.ins_borderpost
               ,l_movement_rec.trnsprtunitid
               ,l_movement_rec.person_type
               ,l_movement_rec.scanned_flight
               ,l_movement_rec.visa_type
               ,l_movement_rec.visa
               ,l_movement_rec.is_finished
               ,l_movement_rec.prior_movement
               ,l_movement_rec.movement_dt
               ,l_movement_rec.date_of_entry
               ,l_movement_rec.mrzvisa
               ,l_movement_rec.source_system)
        RETURNING mvmntid INTO l_movement_rec.mvmntid;

        -- insert movement_blobs if they are not null
        if l_movement_blob_rec.live_photo is not null or
           l_movement_blob_rec.wsq_ll is not null or
           l_movement_blob_rec.wsq_li is not null or
           l_movement_blob_rec.wsq_lm is not null or
           l_movement_blob_rec.wsq_lr is not null or
           l_movement_blob_rec.wsq_lt is not null or
           l_movement_blob_rec.wsq_rl is not null or
           l_movement_blob_rec.wsq_ri is not null or
           l_movement_blob_rec.wsq_rm is not null or
           l_movement_blob_rec.wsq_rr is not null or
           l_movement_blob_rec.wsq_rt is not null
        then
            insert into dl_bordercontrol.movements_blob (mvmnt_id
                                                        ,live_photo
                                                        ,wsq_ll
                                                        ,wsq_li
                                                        ,wsq_lm
                                                        ,wsq_lr
                                                        ,wsq_lt
                                                        ,wsq_rl
                                                        ,wsq_ri
                                                        ,wsq_rm
                                                        ,wsq_rr
                                                        ,wsq_rt
                                                        ,ins_terminal
                                                        ,ins_borderpost)

            values (l_movement_rec.mvmntid
                   ,l_movement_blob_rec.live_photo 
                   ,l_movement_blob_rec.wsq_ll
                   ,l_movement_blob_rec.wsq_li
                   ,l_movement_blob_rec.wsq_lm
                   ,l_movement_blob_rec.wsq_lr
                   ,l_movement_blob_rec.wsq_lt
                   ,l_movement_blob_rec.wsq_rl
                   ,l_movement_blob_rec.wsq_ri
                   ,l_movement_blob_rec.wsq_rm
                   ,l_movement_blob_rec.wsq_rr
                   ,l_movement_blob_rec.wsq_rt
                   ,l_movement_rec.ins_terminal
                   ,l_movement_rec.ins_borderpost);
        end if;

        -- insert entry_form
        if l_entry_forms_rec.form_no is not null
        then
            insert into dl_bordercontrol.entry_forms (form_no
                                                     ,province
                                                     ,district
                                                     ,subdistrict
                                                     ,address
                                                     ,note
                                                     ,ins_terminal
                                                     ,ins_borderpost)
            values (l_entry_forms_rec.form_no
                   ,l_entry_forms_rec.province
                   ,l_entry_forms_rec.district
                   ,l_entry_forms_rec.subdistrict
                   ,l_entry_forms_rec.address
                   ,l_entry_forms_rec.note
                   ,l_movement_rec.ins_terminal
                   ,l_movement_rec.ins_borderpost)
            returning key_value into l_movement_rec.entry_form;

            -- insert entry_form id into movements
            update dl_bordercontrol.movements set entry_form = l_movement_rec.entry_form
            where mvmntid = l_movement_rec.mvmntid;

        end if;
    END IF;

    IF l_movement_rec.mvmntid IS NOT NULL        
    THEN
    
        IF l_INCIDENTS_rec.BL_ACTION is not null        
            THEN
                    INSERT INTO incidents (
                    docno,
                    client_ip,
                    officer,
                    dob,
                    lastname,
                    gender,
                    issuingcountry,
                    givenname,
                    type,
                    ins_terminal,
                    ins_borderpost,
                    brddocid,
                    mvmntid,
                    bl_status,
                    bl_number_of_hits,
                    bl_action,
                    bl_remarks
                   
                ) VALUES (
                    l_INCIDENTS_rec.DOCNO,
                    l_INCIDENTS_rec.CLIENT_IP,
                    l_INCIDENTS_rec.OFFICER,
                    l_INCIDENTS_rec.DOB,
                    l_INCIDENTS_rec.LASTNAME,
                    l_INCIDENTS_rec.GENDER,
                    l_INCIDENTS_rec.ISSUINGCOUNTRY,
                    l_INCIDENTS_rec.GIVENNAME,
                    '10',
                    l_movement_rec.ins_terminal,
                    l_movement_rec.ins_borderpost,
                    l_movement_rec.brddocid,
                    l_movement_rec.mvmntid,
                    'A',
                    '',
                    l_INCIDENTS_rec.BL_ACTION,
                    l_INCIDENTS_rec.BL_REMARKS);
            END IF;
            
              l_count := APEX_JSON.get_count(p_values => l_values,p_path => 'collectivePassport');
              FOR i IN 0 .. l_count LOOP
                   l_FELLOW_PASSENGER_rec.relation := APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_relation', p0 => i);
                   l_FELLOW_PASSENGER_rec.nationality :=     APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_passportIssuingCountry', p0 => i);
                   l_FELLOW_PASSENGER_rec.tm6_no :=     APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_tm6', p0 => i);
                   l_FELLOW_PASSENGER_rec.first_name :=     APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_givenName', p0 => i);
                   l_FELLOW_PASSENGER_rec.last_name :=     APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_surName', p0 => i);
                   l_FELLOW_PASSENGER_rec.sex :=     APEX_JSON.get_varchar2(p_values => l_values,p_path => 'collectivePassport[%d].col_sex', p0 => i);
                   l_FELLOW_PASSENGER_rec.date_of_birth :=     APEX_JSON.get_date(p_values => l_values,p_path => 'collectivePassport[%d].col_dateOfBirth', p0 => i);
                   l_FELLOW_PASSENGER_rec.image :=     dl_common.pkg_util.decode_base64(apex_json.get_clob(p_values => l_values, p_path => 'collectivePassport[%d].col_photo'));
                   
                        INSERT INTO dl_bordercontrol.person(FIRST_NAME) 
                        values (null)
                        returning key_value into l_PERSON_rec.KEY_VALUE;
                        
                        INSERT INTO dl_bordercontrol.fellow_passenger (
                        person,
                        relation,
                        nationality,
                        tm6_no,
                        first_name,
                        last_name,
                        sex,
                        date_of_birth,
                        image,
                        mvmntid
                       ) 
                        VALUES (
                        l_PERSON_rec.KEY_VALUE,
                        l_FELLOW_PASSENGER_rec.relation,
                        l_FELLOW_PASSENGER_rec.nationality,
                        l_FELLOW_PASSENGER_rec.tm6_no,
                        l_FELLOW_PASSENGER_rec.first_name,
                        l_FELLOW_PASSENGER_rec.last_name,
                        l_FELLOW_PASSENGER_rec.sex,
                        l_FELLOW_PASSENGER_rec.date_of_birth,
                        l_FELLOW_PASSENGER_rec.image,
                        l_movement_rec.mvmntid   
                        );
              END LOOP;
            
      l_status := 200;
      l_response_message := 'The movement was successfully created.';
     
    END IF;

     commit;
      select JSON_OBJECT(
                   'response_status_code' VALUE l_status,
                   'response_status_message' VALUE l_response_message,
                   'response_pk' VALUE l_movement_rec.mvmntid,
                   'response' VALUE l_response,
                    'status' VALUE l_status
                  )
   into RES
   from dual;
  p_response :=  RES;
EXCEPTION 
WHEN OTHERS THEN 
v_error_msg := sqlerrm;
     select JSON_OBJECT(
                   'response_status_code' VALUE 500,
                   'response_status_message' VALUE v_error_msg,
                   'response_pk' VALUE null,
                   'response' VALUE '',
                    'status' VALUE null
                  )
into RES
from dual;
 p_response :=  RES;
   END SP_MOVEMENT;
END PKG_AUTO_CHANNEL;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_AUTO_CHANNEL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_AUTO_CHANNEL" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_AUTO_CHANNEL" TO "BIOSAADM";
