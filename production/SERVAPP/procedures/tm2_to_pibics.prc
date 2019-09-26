CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."TM2_TO_PIBICS" (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    ) AS
    json_obj json := json ();
    l_obj json_object_t;
    l_temp_obj1 json_object_t;
    l_temp_obj2 json_object_t;
    l_temp_obj3 json_object_t;
    l_person_arr json_array_t;
    l_obj_response json_object_t;
    c_data CLOB;
    c_data_person CLOB;
    b_img_pass BLOB;
    b_img_person BLOB;
    v_x_response_code VARCHAR2(5000);
    b_x_response_message CLOB;
    d_start_date DATE;
    v_url VARCHAR2(5000);
    v_receive_id VARCHAR2(5000);
    v_recevice_message clob;
    i_pibicspk number;
    v_service_name varchar2(5000);
    v_dml_type varchar2(10);
  BEGIN
  
  
d_start_date := sysdate;
--//////////////////////////////////////////////////////////////////////////////////////////////////
if p_mode <> 'D' then

WITH obj_data AS (
select a.tm2_seqno as bioPk
       ,b.DEPT_SEQNO as deptSeqNo
       ,a.ZONE_SEQNO as zoneSeqNo
       ,a.SHIFT_SEQNO as shiftSeqNo
       ,a.CREATE_BY as saveUser
       ,to_char(a.create_date,'yyyymmddhh24miss') as saveDate
       ,a.CREATE_IP as saveIpClient
       ,a.CONV_SEQNO as convSeqNo
       ,a.CONVREGNO as convRegNo
       ,a.CONVNATIONCD as convNationCode
       ,a.CONVNM as convName
       ,a.CONVOWNER as convOwner
       ,a.FLIGHTNO as flightNo
       ,a.CONVCODE as convCode
       ,a.NOTE
       ,a.CARDTYPE
       ,a.TM5_SEQNO as tm5SeqNo
       ,a.TM2NO
       ,to_char(a.TM2DTE,'yyyymmdd') as tm2Date
       ,a.IOPORTNM as ioPortName
       ,a.IOCOUNTCD as ioCountryCode
       ,a.IODEPTTH as ioDeptTh
       ,a.IODEPT 
       ,to_char(sysdate,'yyyymmddhh24miss') as inOutDate
       ,a.IONOTE
       ,nvl(a.AMOUNT_CRW,0) as amtCrew
       ,nvl(a.AMOUNT_IO,0) as amtInOut
       ,nvl(a.AMOUNT_T,0) as amtT
       ,nvl(a.AMOUNT_S,0) as amtS
       ,nvl(a.AMOUNT_PSG,0) as amtPassenger
from mscs_tm2 a
left join mscs_tm2main b on a.tm2_seqno =b.tm2_seqno
where a.tm2_seqno =p_id
)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1101',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'TM2',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               ,'deptSeqNo' value deptSeqNo
                                               ,'zoneSeqNo' value zoneSeqNo
                                               ,'shiftSeqNo' value shiftSeqNo
                                               ,'saveUser' value saveUser
                                               ,'saveDate' value saveDate
                                               ,'saveIpClient' value '172.22.6.42'
                                               )
                                        from obj_data
                                       ),
                  'tm2Info' value (
                                           select JSON_OBJECT (
                                                                     'conveyanceInfo' value (
                                                                                          select JSON_OBJECT (
                                                                                                   'convSeqNo' VALUE convSeqNo
                                                                                                   ,'convRegNo' value convRegNo
                                                                                                   ,'convNationCode' value convNationCode
                                                                                                   ,'convName' value convName
                                                                                                   ,'convOwner' value convOwner
                                                                                                   ,'flightNo' value flightNo
                                                                                                    ,'convCode' value convCode
                                                                                                   ,'note' value note
                                                                                                   )
                                                                                            from obj_data
                                                                                           )
                                                                        ,
                                                                      'cardType'	  value  cardType
                                                                      ,'tm5SeqNo'	  value  tm5SeqNo
                                                                      ,'tm2No'	  value  tm2No
                                                                      ,'tm2Date'	  value  tm2Date
                                                                      ,'ioPortName'	  value  ioPortName
                                                                      ,'ioCountryCode'	  value  ioCountryCode
                                                                      ,'ioDeptTh'	  value  ioDeptTh
                                                                      ,'ioDept'	  value  ioDept
                                                                      ,'inOutDate'	  value  inOutDate
                                                                      ,'ioNote'	  value  ioNote
                                                                      ,'amtCrew'	  value  amtCrew
                                                                      ,'amtInOut'	  value  amtInOut
                                                                      ,'amtT'	  value  amtT
                                                                      ,'amtS'	  value  amtS
                                                                      ,'amtPassenger'	  value  amtPassenger
                                                                       )
                                                                from obj_data
                                          )
                       
                )
into c_data
from obj_data;

else
WITH obj_data AS (
select a.tm2_seqno as bioPk
       ,b.DEPT_SEQNO as deptSeqNo
       ,a.ZONE_SEQNO as zoneSeqNo
       ,a.SHIFT_SEQNO as shiftSeqNo
       ,a.CREATE_BY as saveUser
       ,to_char(a.create_date,'yyyymmddhh24miss') as saveDate
       ,a.CREATE_IP as saveIpClient
       ,a.CONV_SEQNO as convSeqNo
       ,a.CONVREGNO as convRegNo
       ,a.CONVNATIONCD as convNationCode
       ,a.CONVNM as convName
       ,a.CONVOWNER as convOwner
       ,a.FLIGHTNO as flightNo
       ,a.CONVCODE as convCode
       ,a.NOTE
       ,a.CARDTYPE
       ,a.TM5_SEQNO as tm5SeqNo
       ,a.TM2NO
       ,to_char(a.TM2DTE,'yyyymmdd') as tm2Date
       ,a.IOPORTNM as ioPortName
       ,a.IOCOUNTCD as ioCountryCode
       ,a.IODEPTTH as ioDeptTh
       ,a.IODEPT 
       ,to_char(sysdate,'yyyymmddhh24miss') as inOutDate
       ,a.IONOTE
       ,nvl(a.AMOUNT_CRW,0) as amtCrew
       ,nvl(a.AMOUNT_IO,0) as amtInOut
       ,nvl(a.AMOUNT_T,0) as amtT
       ,nvl(a.AMOUNT_S,0) as amtS
       ,nvl(a.AMOUNT_PSG,0) as amtPassenger
from mscs_tm2 a
left join mscs_tm2main b on a.tm2_seqno =b.tm2_seqno
where a.tm2_seqno =p_id
)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1101',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'TM2',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               ,'deptSeqNo' value deptSeqNo
                                               ,'zoneSeqNo' value zoneSeqNo
                                               ,'shiftSeqNo' value shiftSeqNo
                                               ,'saveUser' value saveUser
                                               ,'saveDate' value saveDate
                                               ,'saveIpClient' value '172.22.6.42'
                                               )
                                        from obj_data
                                       )
                )
into c_data
from obj_data;

end if;

  
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
  v_url := 'http://172.22.6.12:8080/bioservice_uat';
   /* select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';*/
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
      v_dml_type :='U';
      v_service_name := 'editTm2ToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delTm2ToPibics';
     end if;
     
    select RECEIVER_RESPONSE_ID
    into i_pibicspk
     from
     dual a
     left join (
     select * from (
      SELECT TL.* , 
            ROW_NUMBER () OVER (PARTITION BY  TL.SENDER_OBJECT_ID
            ORDER BY TL.DML_AT DESC
            ) RN_MAX_ISSUE_DT 
            FROM  MSCS_LOG_SYNC_WEBSERVICES TL  
            where sender ='TM2' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else

     v_service_name := 'addTm2ToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/tm2/'||v_service_name;
     
   PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
   v_receive_id := '';
   v_recevice_message:= null;
   if v_x_response_code =200 then
   l_obj_response :=JSON_OBJECT_T(b_x_response_message);
  
   v_receive_id :=l_obj_response.get_string('pibicsPk'); 
  
   l_temp_obj1 :=l_obj_response.get_object('msgRes'); 
   v_recevice_message := l_temp_obj1.get_string('msgDesc');
   

   end if;
   
   p_message :=v_recevice_message;
    PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   v_dml_type,
    'ADMIN',
    'TM2',
    v_service_name,
    p_id,
    l_obj.stringify,
    v_x_response_code,
    b_x_response_message,
    v_receive_id,
    v_recevice_message,
    (sysdate-d_start_date)*24*60*60 ,
    v_url
   );
   
    if v_receive_id is not null then
   update mscs_tm2
   set PIBICSPK =v_receive_id
   where TM2_SEQNO =p_id;
   commit;
   
   end if;
    exception when others then
    rollback;
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END TM2_TO_PIBICS;
/
