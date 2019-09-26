CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_ISDR" AS

  PROCEDURE CHECK_OVER_STAY (
        p_data     IN BLOB,
        p_error_code OUT VARCHAR2,
        p_error_desc OUT CLOB,
        p_message   OUT CLOB
    ) AS
REQ BLOB;
i_id int;
v_mode varchar2(20);

v_message varchar2(5000);
v_dateTime varchar2(100);
v_docNumber varchar2(200);
v_nationality varchar2(100);
v_familyName varchar2(500);
v_givenName varchar2(500);
v_middleName varchar2(500);
v_birthDate varchar2(50);
v_gender varchar2(20);
v_visatype_seqno varchar2(20);
v_visatype_desc varchar2(500);
d_visa_expire date;
d_permit_expire date;
d_expire date;
i_over_day int;
c_res clob;
c_res_address clob;
i_count int;
d_rate decimal(15,2);
d_total_amt decimal (15,2);
d_limit decimal (15,2);
v_visa_expire_date varchar2(20);
  BEGIN
  p_error_code := '00';
    REQ := p_data;
    select  a.dateTime,
            a.docNumber,
            a.nationality,
            a.familyName,
            a.givenName,
            a.middleName,
            a.birthDate,
            a.gender,
            a.visa_expire
        into v_dateTime,
            v_docNumber,
            v_nationality,
            v_familyName,
            v_givenName,
            v_middleName,
            v_birthDate,
            v_gender,
            v_visa_expire_date
          FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
				dateTime      varchar2  PATH '$.dateTime',
                ipClient      varchar2  PATH '$.ipClient',
                docNumber      varchar2  PATH '$.docNumber',
                nationality      varchar2  PATH '$.nationality',
                familyName      varchar2  PATH '$.familyName',
                givenName      varchar2  PATH '$.givenName',
                middleName      varchar2  PATH '$.middleName',
                birthDate      varchar2  PATH '$.birthDate',
                gender      varchar2  PATH '$.gender',
                visa_expire varchar2  PATH '$.vasa_expire'
                )) a;

WITH t_overstay AS(
select a.*
        , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extovs_seqno DESC) RN
from dl_bordercontrol.v_processot a
where  approve_sts = 'A'
     and TRUNC(CAST(extovs_date AS DATE)) <= TRUNC(SYSDATE)
     and a.CPASSPORTNO =v_docNumber
     and a.efamilynm = v_familyName
     and a.efirstnm =v_givenName
     and a.emiddlenm = nvl(v_middleName,a.emiddlenm)
     and a.birth_date =v_birthDate
     and a.sex =upper(v_gender)
     AND nation_seqno = 
                        (
                            SELECT pib.count_seqno
                            FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                            WHERE icao.key_value = v_nationality
                            AND icao.is_active = 'Y'
                            AND icao.notice$dlc = pib.countcd 
                        )
    AND NOT EXISTS 
                (
                    SELECT 1 
                    FROM dl_bordercontrol.v_delprocessot
                    WHERE extovs_seqno = a.extovs_seqno
                )
                )
select count(1)
into i_count
from t_overstay
where rn=1;      

if  i_count >0 then
WITH t_overstay AS(
select a.*
        , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extovs_seqno DESC) RN
from dl_bordercontrol.v_processot a
where  approve_sts = 'A'
     and TRUNC(CAST(extovs_date AS DATE)) <= TRUNC(SYSDATE)
     and a.CPASSPORTNO =v_docNumber
     and a.efamilynm = v_familyName
     and a.efirstnm =v_givenName
     and a.emiddlenm = nvl(v_middleName,a.emiddlenm)
     and a.birth_date =v_birthDate
     and a.sex =upper(v_gender)
     AND nation_seqno = 
                        (
                            SELECT pib.count_seqno
                            FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                            WHERE icao.key_value = v_nationality
                            AND icao.is_active = 'Y'
                            AND icao.notice$dlc = pib.countcd 
                        )
    AND NOT EXISTS 
                (
                    SELECT 1 
                    FROM dl_bordercontrol.v_delprocessot
                    WHERE extovs_seqno = a.extovs_seqno
                )
                )
select t_overstay.visa_expdate,
       t_overstay.permit_date,
       t_overstay.visatype_seqno,
       b.visatypetnm
into d_visa_expire,
     d_permit_expire,
     v_visatype_seqno,
     v_visatype_desc
from t_overstay 
inner join PIBICSDM2.VISATYPE b on t_overstay.visatype_seqno =b.visatype_seqno
where rn=1;   

v_message :='';
i_over_day := 0;
if d_visa_expire is not null and trunc(d_visa_expire) < trunc(sysdate) then
    if d_permit_expire is null then
        v_message :='visa is expired';
        i_over_day := trunc(sysdate) -trunc(d_visa_expire);
        d_expire := d_visa_expire;
    else
        if trunc(d_permit_expire) < trunc(sysdate) then
         v_message :='permit is expired';
         i_over_day := trunc(sysdate) -trunc(d_permit_expire);
          d_expire := d_permit_expire;
        end if;
    end if;

end if;
else
i_over_day := trunc(sysdate) -trunc(to_date(v_visa_expire_date,'dd/mm/yyyy'));
end if;

 if i_over_day  >0  then
    select prateamount,nvl(limitamount,0)
    into d_rate,d_limit
    from pibicsdm2.PAYMENTRATE
    where prate_seqno =15;
    d_total_amt := d_rate*i_over_day;
    if d_total_amt >d_limit and d_limit >0 then
    d_total_amt := d_limit;
    end if;
     c_res :='{"isOver":"true","overDay":'||i_over_day||'';
     c_res := c_res||',"fineAmt":'||d_total_amt||',"fineRate":'||d_rate||',"visaTypeCode":"'||v_visatype_seqno||'"';
     c_res := c_res||',"visaTypeDesc":"'||v_visatype_desc||'","expireDate":"'||to_char(d_expire,'dd/mm/yyyy')||'"';
     c_res := c_res||',"errorDesc":"'||v_message||'"}';


    p_message := c_res; 
    else
    p_message := '{"isOver":"false"}'; 
    end if;
    
   
    
  EXCEPTION 
  WHEN OTHERS THEN ROLLBACK;
   p_error_code := '99';
   p_error_desc := SQLERRM;
  END CHECK_OVER_STAY;

  PROCEDURE CHECK_ADDRESS (
        p_data     IN BLOB,
        p_error_code OUT VARCHAR2,
        p_error_desc OUT CLOB,
        p_message   OUT CLOB
    ) AS
  REQ blob;
  c_data CLOB;
  v_url varchar2(200);
  v_url_config varchar2(200);
  v_service_name varchar2(200);
  v_x_response_code VARCHAR2(5000);
  b_x_response_message CLOB;
  b_x_response_message_online CLOB;
  v_recevice_message clob;
  d_start_date DATE;
  v_msg_code_address varchar2(20);
  i_rowcount_address int;
   v_msg_code_address_online varchar2(20);
  i_rowcount_address_online int;
  d_max_address date;
  d_max_address_online date;
  d_in date;
  i_over_day int;
  d_rate decimal(15,2);
  d_total_amt decimal (15,2);
  d_limit decimal (15,2);
  v_zone varchar2(50);
  BEGIN
  REQ := p_data;
  p_error_code := '00';
  d_start_date := sysdate;


  select  to_date(a.inDate,'dd/mm/yyyy')
        into d_in
          FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
				inDate      varchar2  PATH '$.inDate'
                )) a;

    i_over_day := (trunc(sysdate) -  trunc(d_in))-90;   

    if i_over_day >0 then
    select CONFIG_VALUE
    into v_url_config
    from mscs_sys_config
    where CONFIG_NAME ='isdr';

    --///////////////////////////////Search Address///////////////////////////////////////////////////////////////
    select JSON_OBJECT (
               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
               'ipClient' VALUE '172.22.6.13',
               'deptSeqNoLvOne' VALUE '',
               'deptSeqNoLvTwo' VALUE '',
               'deptSeqNoLvThree' VALUE '',
               'firstName' VALUE a.givenName,
               'middleName' VALUE a.middleName,
               'lastName' VALUE a.familyName,
               'birthDate' VALUE birthDate,
               'gender' VALUE a.gender,
               'nationality' VALUE a.nationality,
               'docNumber' VALUE a.docNumber,
               'inDate' VALUE '',
               'informDateFrom' VALUE '',
               'informDateTo' VALUE ''
             )
      into c_data
       FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
				dateTime      varchar2  PATH '$.dateTime',
                ipClient      varchar2  PATH '$.ipClient',
                docNumber      varchar2  PATH '$.docNumber',
                nationality      varchar2  PATH '$.nationality',
                familyName      varchar2  PATH '$.familyName',
                givenName      varchar2  PATH '$.givenName',
                middleName      varchar2  PATH '$.middleName',
                 birthDate      varchar2  PATH '$.birthDate',
                  gender      varchar2  PATH '$.gender'
                )) a;


   v_service_name := 'searchFnAddressPibics';             
   v_url :=v_url_config ||'/rest/isdr/fn/'||v_service_name;
   PKG_UTILS.POST(c_data,v_url,v_x_response_code,b_x_response_message);

   PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   'S',
    'ADMIN',
    'EXT_SEARCH',
    v_service_name,
    'S',
    c_data,
    v_x_response_code,
    b_x_response_message,
    '',
    v_recevice_message,
    (sysdate-d_start_date)*24*60*60 ,
    v_url
   );
   --//////////////////////////////////Search Online/////////////////////////////////////////////////////////
   select JSON_OBJECT (
               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
               'ipClient' VALUE '172.22.6.13',
               'deptSeqNo' VALUE a.deptSeqNo,
               'zoneSeqNo' VALUE a.zoneSeqNo,
               'informDateFrom' VALUE '',
               'informDateTo' VALUE '',
               'barcode' VALUE '',
               'docNumber' VALUE a.docNumber,
               'nationality' VALUE a.nationality,
               'approveStatus' VALUE ''
             )
      into c_data
       FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
				dateTime      varchar2  PATH '$.dateTime',
                ipClient      varchar2  PATH '$.ipClient',
                deptSeqNo      varchar2  PATH '$.default_dept_seqno',
                zoneSeqNo      varchar2  PATH '$.zoneSeqNo',
                docNumber      varchar2  PATH '$.docNumber',
                nationality      varchar2  PATH '$.nationality'
                )) a;


   v_service_name := 'searchFnAddressOnlinePibics';             
   v_url :=v_url_config ||'/rest/isdr/fn90/'||v_service_name;
   PKG_UTILS.POST(c_data,v_url,v_x_response_code,b_x_response_message_online);

   PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   'S',
    'ADMIN',
    'EXT_SEARCH_ONLINE',
    v_service_name,
    'S',
    c_data,
    v_x_response_code,
    b_x_response_message_online,
    '',
    v_recevice_message,
    (sysdate-d_start_date)*24*60*60 ,
    v_url
   );
   --//////////////////////////////////Check Address////////////////////////////////////////////////////////
   if b_x_response_message is not null or b_x_response_message_online is not null then
       select *
       into i_rowcount_address,v_msg_code_address
       FROM json_table(b_x_response_message  FORMAT JSON, '$'
             COLUMNS (
                    rowCount      number  PATH '$.rowCount',
                    msgCode       varchar2 PATH '$.msgCode'
                    )) a;

       select *
       into i_rowcount_address_online,v_msg_code_address_online
       FROM json_table(b_x_response_message_online  FORMAT JSON, '$'
             COLUMNS (
                    rowCount      number  PATH '$.rowCount',
                    msgCode       varchar2 PATH '$.msgCode'
                    )) a;

       if i_rowcount_address >0 or i_rowcount_address_online >0 then

        if i_rowcount_address >0 then
         select max(to_date(substr(a.docdate,0,10),'yyyy-mm-dd')) as docdate 
         into d_max_address
         FROM json_table(b_x_response_message  FORMAT JSON, '$'
         COLUMNS (
         NESTED                      PATH '$.fnAddressInfo[*]'
                         COLUMNS (
                docDate	                 VARCHAR2        PATH '$.docDate'
            ))) a;
         end if;   

         if i_rowcount_address_online >0 then
         select max(to_date(substr(a.createDate,0,8),'yyyy-mm-dd')) as docdate 
         into d_max_address_online
         FROM json_table(b_x_response_message_online  FORMAT JSON, '$'
         COLUMNS (
         NESTED                      PATH '$.fnAddressOnlineInfo[*]'
                         COLUMNS (
                createDate	                 VARCHAR2        PATH '$.createDate'
            ))) a;
         end if; 

         if d_max_address is null or d_max_address < d_max_address_online then
            d_max_address := d_max_address_online;
         end if;
         if d_max_address < d_in or d_max_address is null  then 
         i_over_day := (trunc(sysdate) -  trunc(d_in))-90;   
         else  
         i_over_day := 0;--(trunc(d_max_address) -  trunc(d_in))-90;   
         end if;

         if i_over_day > 0 then
          select prateamount,nvl(limitamount,0)
            into d_rate,d_limit
            from pibicsdm2.PAYMENTRATE
            where prate_seqno =30;

            d_total_amt := d_rate*i_over_day;
            if d_total_amt >d_limit and d_limit >0 then
            d_total_amt := d_limit;
            end if;
         p_message :='{"isOver":"true","overDay":'||i_over_day||'';
         p_message := p_message||',"fineAmt":'||d_total_amt||',"fineRate":'||d_rate||'';
         p_message := p_message||',"lastDate":"'||to_char(d_max_address,'dd/mm/yyyy')||'","expireDate":"'||to_char((d_in+90),'dd/mm/yyyy')||'"}';
         else 
          p_message :='{"isOver":"false","msg":"Input Address less than 90","lastDate":"'||to_char(d_max_address,'dd/mm/yyyy')||'"}';
         end if;
       else

        select prateamount,nvl(limitamount,0)
            into d_rate,d_limit
            from pibicsdm2.PAYMENTRATE
            where prate_seqno =30;

            d_total_amt := d_rate*i_over_day;
            if d_total_amt >d_limit and d_limit >0 then
            d_total_amt := d_limit;
            end if;
         p_message :='{"isOver":"true","overDay":'||i_over_day||'';
          p_message := p_message||',"fineAmt":'||d_total_amt||',"fineRate":'||d_rate||'';
          p_message := p_message||',"lastDate":"","msg":"Service Response RowCount 0","expireDate":"'||to_char((d_in+90),'dd/mm/yyyy')||'"}';
       end if;
  else

      select prateamount,nvl(limitamount,0)
            into d_rate,d_limit
            from pibicsdm2.PAYMENTRATE
            where prate_seqno =30;

            d_total_amt := d_rate*i_over_day;
            if d_total_amt >d_limit and d_limit >0 then
            d_total_amt := d_limit;
            end if;
     p_message :='{"isOver":"true","overDay":'||i_over_day||'';
     p_message := p_message||',"fineAmt":'||d_total_amt||',"fineRate":'||d_rate||'';
     p_message := p_message||',"lastDate":"","msg":"Service Response null","expireDate":"'||to_char((d_in+90),'dd/mm/yyyy')||'"}';
  end if;  
   --///////////////////////////////////////////////////////////////////////////////////////////////////////

  else 
      p_message :='{"isOver":"false","msg":"Not Over 90"}';
  end if;
    
    EXCEPTION 
  WHEN OTHERS THEN ROLLBACK;
   p_error_code := '99';
   p_error_desc := SQLERRM;
  END CHECK_ADDRESS;

END PKG_ISDR;
/
