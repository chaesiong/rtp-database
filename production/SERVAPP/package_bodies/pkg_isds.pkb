CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_ISDS" AS

  PROCEDURE VOA_TO_PIBICS (
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
    i_voal_seqno NUMBER;
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
  select  a.VOA_SEQNO as bioPk,
       a.dept_seqno as deptSeqNo,
       'naphaschaya.j' as saveUser,
       to_char(sysdate,'yyyymmddhh24miss') as saveDate,
       '172.22.6.13' as saveIpClient,
       to_char(a.in_date,'yyyymmddhh24miss') as inDate,
       a.fromCountry,
       a.CONV_SEQNO as convSeqNo,
       case when  length(a.CONVNO) >2 then substr(a.CONVNO,0,2) else a.CONVNO end as convName1,
       case when  length(a.CONVNO) >2 then substr(a.CONVNO,3,length(a.CONVNO)-1) else a.CONVNO end as convName2,
       a.PV_SEQNO as pvSeqNo,
       a.AMP_SEQNO as ampSeqNo,
       a.TMB_SEQNO as tmbSeqNo,
       a.PERADD,
       a.thaiRef,
       a.addr,
       a.road,
       a.postCode,
       a.tel,
       'Y' as initType,
       b.PASSPORTNO as docNumber,
       to_char(b.PASSPORT_EXPDATE,'yyyymmdd') as docExpireDate,
       to_char(b.PASSPORT_ISSUEDATE,'yyyymmdd') as docIssueDate,
       b.PASSPORT_PLACE as docPlace,
      '' as binaryImgPassport,
      a.VISATYPE_SEQNO as visaType,
      to_char(a.VOA15_DATE,'yyyymmdd') as voaDate,
      to_char(a.PERMIT_DATE,'yyyymmdd') as permitDate,
      a.APPROVE,
      a.PROVE_ID as proveID,
      a.prove_by as proveBy,
      a.REASON as reson,
      a.del_Remark as delRemark,
      a.PAY_STS as payStatus,
      c.PRINTFLAG as printSlip,
      b.IMGPASS
from MSCS_VOA_VOA15 a
inner join mscs_voa_voa15list b on a.voa_seqno = b.voa_seqno
left join mscs_fs_fees c on b.FEES_SEQNO =c.FEES_SEQNO
where a.VOA_SEQNO=p_id  and
      b.sts in ('A','M') )
      
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '115',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'naphaschaya.j',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'VOA',
                                               'ipClient' VALUE '172.22.6.13'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'saveUser' VALUE saveUser,
                                               'saveDate' VALUE saveDate,
                                               'saveIpClient' VALUE saveIpClient
                                               )
                                        from obj_data
                                       ),
                    'travelEventInfo' value(
                                        select JSON_OBJECT (
                                               'inDate' VALUE inDate,
                                               'fromCountry' VALUE fromCountry,
                                               'conveyanceInfo' VALUE (
                                                                       select JSON_OBJECT (
                                                                       'convSeqNo' VALUE convSeqNo,
                                                                       'convName1' VALUE convName1,
                                                                       'convName2' VALUE convName2
                                                                       )
                                                                         from obj_data
                                                                       ) ,
                                              'contractInfo' VALUE (
                                                                     select JSON_OBJECT (
                                                                       'pvSeqNo' VALUE pvSeqNo,
                                                                       'ampSeqNo' VALUE ampSeqNo,
                                                                       'tmbSeqNo' VALUE tmbSeqNo,
                                                                       'perAdd' VALUE perAdd,
                                                                       'thaiRef' VALUE thaiRef,
                                                                       'addr' VALUE addr,
                                                                       'road' VALUE road,
                                                                       'postCode' VALUE postCode,
                                                                       'tel' VALUE tel
                                                                       )
                                                                         from obj_data
                                                                   ),
                                                 'initType' value 'Y'
                                               )
                                        from obj_data
                                       ),
                    'documentData' value (
                                         select JSON_OBJECT (
                                               'docNumber' VALUE docNumber,
                                               'docExpireDate' VALUE docExpireDate,
                                               'docIssueDate' VALUE docIssueDate,
                                               'docPlace' VALUE saveDate,
                                               'imgPass' VALUE (
                                                                  select JSON_OBJECT (
                                                                       'fileNameImgPassport' VALUE '',
                                                                       'binaryImgPassport' VALUE binaryImgPassport,
                                                                       'fileSizeImgPassport' VALUE ''
                                                                       )
                                                                         from obj_data
                                                                )
                                               )
                                         from obj_data
                                          ),
                    'personData' value (
                                          WITH obj_data AS(
                                            select a.TM6NO as tm6Number,
                                                   b.ABBCOUNT as nationality,
                                                   a.EFAMILYNM as familyName,
                                                   a.EFIRSTNM as  givenName,
                                                   a.EMIDDLENM as middleName,
                                                   a.SUFFIX_SEQNO as suffixName,
                                                   to_char(a.BIRTH_DATE,'dd/mm/yyyy') as birthDate,
                                                   a.SEX as gender,
                                                   a.sts,
                                                   a.CHILD_RELATIONSHIP as relationPassJoin,
                                                   a.IMGINOUT as binaryImgPerson ,
                                                   a.VISANO,
                                                   c.FEESNO as feeNo,
                                                   c.FEESLIPNO,
                                                   c.feeSlipBookNo,
                                                   d.PRATE_SEQNO as prateSeqNo,
                                                   d.FEESLIPAMOUNT,
                                                   a.OCC_SEQNO as occSeqNo,
                                                   a.voal_seqno
                                            from mscs_voa_voa15list a
                                            left join PIBICSDM2.COUNTRY b on a.NATION_SEQNO =b.COUNT_SEQNO
                                            left join mscs_fs_fees c on a.FEES_SEQNO=c.FEES_SEQNO
                                            left join (select FEES_SEQNO,PRATE_SEQNO,sum(FEESLIPAMOUNT) as FEESLIPAMOUNT from mscs_fs_feesdetail group by FEES_SEQNO,PRATE_SEQNO) d on c.FEES_SEQNO=d.FEES_SEQNO
                                            where a.VOA_SEQNO=p_id)
                                            
                                            SELECT JSON_ARRAYAGG(
                                                      JSON_OBJECT('tm6Number' VALUE tm6Number,
                                                                  'nationality' VALUE nationality,
                                                                  'familyName' VALUE familyName,
                                                                  'givenName' VALUE givenName,
                                                                  'middleName' VALUE middleName,
                                                                  'suffixName' VALUE suffixName,
                                                                  'birthDate' VALUE birthDate,
                                                                  'gender' VALUE gender,
                                                                  'sts' VALUE sts,
                                                                  'relationPassJoin' VALUE relationPassJoin,
                                                                  'imgPerson' VALUE ( 
                                                                                      select JSON_OBJECT(
                                                                                                         'fileNameImgPerson' VALUE '',
                                                                                                          'binaryImgPerson' VALUE b.voal_seqno,
                                                                                                          'fileSizeImgPerson' VALUE ''
                                                                                                        )
                                                                                      from obj_data b
                                                                                      where b.voal_seqno =obj_data.voal_seqno
                                                                                    ),
                                                                  'visaNo' VALUE visaNo,
                                                                  'fee' VALUE (
                                                                                 select JSON_OBJECT(
                                                                                                         'feeNo' VALUE b.feeNo,
                                                                                                          'feeSlipNo' VALUE b.feeSlipNo,
                                                                                                          'feeSlipBookNo' VALUE b.feeSlipBookNo,
                                                                                                          'prateSeqNo' VALUE b.prateSeqNo,
                                                                                                          'feeSlipAmount' VALUE b.feeSlipAmount
                                                                                                        )
                                                                                      from obj_data b
                                                                                      where b.voal_seqno =obj_data.voal_seqno
                                                                              ),
                                                                 'occSeqNo' VALUE occSeqNo
                                                                  )) 
                                            from obj_data
                                        ),
                    'permitInfo' value ( select JSON_OBJECT(
                                                 'visaType' VALUE visaType,
                                                 'voaDate' VALUE voaDate,
                                                 'permitDate' VALUE permitDate,
                                                 'approve' VALUE approve,
                                                 'proveID' VALUE proveID,
                                                 'proveBy' VALUE proveBy,
                                                  'reson' VALUE reson,
                                                 'delRemark' VALUE delRemark,
                                                  'payStatus' VALUE payStatus,
                                                 'printSlip' VALUE nvl(printSlip,'N')
                                                 )
                                         from obj_data
                                        )
                   ),IMGPASS
into c_data,b_img_pass
from obj_data
;

else

WITH obj_data AS (
  select  a.VOA_SEQNO as bioPk,
       a.dept_seqno as deptSeqNo,
       'naphaschaya.j' as saveUser,
       to_char(sysdate,'yyyymmddhh24miss') as saveDate,
       '172.22.6.13' as saveIpClient,
       to_char(a.in_date,'yyyymmddhh24miss') as inDate,
       a.fromCountry,
       a.CONV_SEQNO as convSeqNo,
       case when  length(a.CONVNO) >2 then substr(a.CONVNO,0,2) else a.CONVNO end as convName1,
       case when  length(a.CONVNO) >2 then substr(a.CONVNO,3,length(a.CONVNO)-1) else a.CONVNO end as convName2,
       a.PV_SEQNO as pvSeqNo,
       a.AMP_SEQNO as ampSeqNo,
       a.TMB_SEQNO as tmbSeqNo,
       a.PERADD,
       a.thaiRef,
       a.addr,
       a.road,
       a.postCode,
       a.tel,
       'Y' as initType,
       b.PASSPORTNO as docNumber,
       to_char(b.PASSPORT_EXPDATE,'yyyymmdd') as docExpireDate,
       to_char(b.PASSPORT_ISSUEDATE,'yyyymmdd') as docIssueDate,
       b.PASSPORT_PLACE as docPlace,
      '' as binaryImgPassport,
      a.VISATYPE_SEQNO as visaType,
      to_char(a.VOA15_DATE,'yyyymmdd') as voaDate,
      to_char(a.PERMIT_DATE,'yyyymmdd') as permitDate,
      a.APPROVE,
      a.PROVE_ID as proveID,
      a.prove_by as proveBy,
      a.REASON as reson,
      a.del_Remark as delRemark,
      a.PAY_STS as payStatus,
      c.PRINTFLAG as printSlip,
      b.IMGPASS
from MSCS_VOA_VOA15 a
inner join mscs_voa_voa15list b on a.voa_seqno = b.voa_seqno
left join mscs_fs_fees c on b.FEES_SEQNO =c.FEES_SEQNO
where a.VOA_SEQNO=p_id  and
      b.sts in ('A','M') )
      
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '115',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'naphaschaya.j',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'VOA',
                                               'ipClient' VALUE '172.22.6.13'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'saveUser' VALUE saveUser,
                                               'saveDate' VALUE saveDate,
                                               'saveIpClient' VALUE saveIpClient
                                               )
                                        from obj_data
                                       ),
                    'permitInfo' value ( select JSON_OBJECT(
                                                 'visaType' VALUE visaType,
                                                 'voaDate' VALUE voaDate,
                                                 'permitDate' VALUE permitDate,
                                                 'approve' VALUE approve,
                                                 'proveID' VALUE proveID,
                                                 'proveBy' VALUE proveBy,
                                                  'reson' VALUE reson,
                                                 'delRemark' VALUE delRemark,
                                                  'payStatus' VALUE payStatus,
                                                 'printSlip' VALUE nvl(printSlip,'N')
                                                 )
                                         from obj_data
                                        )
                   ),IMGPASS
into c_data,b_img_pass
from obj_data
;
end if;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
  
 if p_mode <> 'D' then
  --Set Image Pass
  l_temp_obj1 :=l_obj.get_object('documentData'); 
  l_temp_obj2 :=l_temp_obj1.get_object('imgPass'); 
  l_temp_obj2.put('binaryImgPassport',FN_BLOB_TO_CLOB(b_img_pass));
  
  l_person_arr := l_obj.get_array('personData');
  
  FOR i IN 0 .. l_person_arr.get_size - 1 LOOP
       IF l_person_arr.get(i).is_object THEN
  --Set Image Inout
      l_temp_obj1 := TREAT(l_person_arr.get(i) AS JSON_OBJECT_T);
      l_temp_obj2 :=l_temp_obj1.get_object('imgPerson'); 
      i_voal_seqno :=l_temp_obj2.get_number('binaryImgPerson');
      select IMGINOUT
      into b_img_person
      from mscs_voa_voa15list
      where voal_seqno =i_voal_seqno;
      l_temp_obj2.put('binaryImgPerson',FN_BLOB_TO_CLOB(b_img_person));
      END IF;
   END LOOP;
 
 end if;
 
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
      v_service_name := 'editVoaToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delVoaToPibics';
      
     l_temp_obj1 :=l_obj.get_object('permitInfo'); 
      l_temp_obj1.remove('printSlip');
     end if;
    select RECEIVER_RESPONSE_ID
    into i_pibicspk
     from
     dual a
     left join (
      select * from
     (
      SELECT TL.* , 
            ROW_NUMBER () OVER (PARTITION BY  TL.SENDER_OBJECT_ID
            ORDER BY TL.DML_AT DESC
            ) RN_MAX_ISSUE_DT 
            FROM  MSCS_LOG_SYNC_WEBSERVICES TL  
            where sender ='VOA' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else
     v_service_name := 'addVoaToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/voa/'||v_service_name;
  
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
    'VOA',
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
   
    exception when others then
    p_message :=sqlerrm;
  END VOA_TO_PIBICS;


   PROCEDURE PROHIBIT_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_inout     IN number,
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
    b_img BLOB;
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
    v_update_by VARCHAR2(200);
    v_update_date VARCHAR2(20);
  BEGIN
  
  
    d_start_date := sysdate;
--//////////////////////////////////////////////////////////////////////////////////////////////////
if p_mode <> 'D' then
WITH obj_data AS (
 select   
          a.PHB_SEQNO as bioPk
          ,a.dept_seqno as deptSeqNo
          ,a.CREATE_BY as createBy
          ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
           ,a.update_by as updateBy
          ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
         ,a.DEPTDPT_SEQNO as deptDptSeqNo
          ,a.phbno
        ,to_char(a.phbDte,'yyyymmdd') as phbdte
        ,a.phbUsrId
        ,a.deptDocNo
        ,to_char(a.deptDocDte,'yyyymmdd') as deptDocDte
        ,a.deptFwdNote
        ,'P' as initType
        ,a.docId
        ,a.docNo
        ,a.efirstNm
        ,a.emiddleNm
        ,a.efamilyNm
        ,a.sex
        ,a.birthDte
        ,a.nationCd
        ,to_char(a.issDte,'yyyymmdd') as issDte
        ,a.issPlace
        ,to_char(a.expDte,'yyyymmdd') as expDte
        ,a.anu_SeqNo as anuSeqNo
        ,a.anuNote
        ,a.deptPer
        ,a.behavior
        ,a.actFlag
        ,to_char(a.ioDte,'yyyymmddhh24miss') as ioDte
        ,a.convRegNo
        ,a.tm6No
        ,a.CONV_SEQNO as convSeqNo
        ,a.DETENRECORD_IDCNO as detenRecordIdcNo
        ,a.checkIo
        ,a.imgPhb
        ,b.insPerson
        ,b.insDept
        ,b.addr
        ,b.telNo
        ,b.authorise
        ,b.note
        ,b.TMB_SEQNO as tmbSeqNo
        ,b.AMP_SEQNO as ampSeqNo
        ,b.PV_SEQNO as pvSeqNo
from mscs_prohibit a
left join mscs_inspro b on a.PHB_SEQNO =b.PHB_SEQNO
where a.METHOD =p_inout and
      a.PHB_SEQNO =p_id)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'PHB',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'createBy' VALUE createBy,
                                               'createDate' VALUE createDate,
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from obj_data
                                       ),
                    'receiveData' value(
                                        select JSON_OBJECT (
                                               'deptDptSeqNo' VALUE deptDptSeqNo,
                                               'phbNo' VALUE phbNo,
                                               'phbDte' VALUE phbDte,
                                               'phbUsrId' VALUE phbUsrId,
                                               'deptDocNo' VALUE deptDocNo,
                                               'deptDocDte' VALUE deptDocDte,
                                               'deptFwdNote' VALUE deptFwdNote
                                               )
                                        from obj_data
                                       ),
                    'prohibitData' value (
                                         select JSON_OBJECT (
                                               'initType' VALUE initType,
                                               'docId' VALUE docId,
                                               'docNo' VALUE docNo,
                                               'efirstNm' VALUE efirstNm,
                                                'emiddleNm' VALUE emiddleNm,
                                               'efamilyNm' VALUE efamilyNm,
                                               'efirstNm' VALUE efirstNm,
                                                'sex' VALUE sex,
                                               'birthDte' VALUE birthDte,
                                               'nationCd' VALUE nationCd,
                                                'issDte' VALUE issDte,
                                               'issPlace' VALUE issPlace,
                                                'expDte' VALUE expDte,
                                               'anuSeqNo' VALUE anuSeqNo,
                                                'anuNote' VALUE anuNote,
                                               'deptPer' VALUE deptPer,
                                               'behavior' VALUE behavior,
                                               'actFlag' VALUE actFlag,
                                               'ioDte' VALUE ioDte,
                                               'convRegNo' VALUE convRegNo,
                                               'tm6No' VALUE tm6No,
                                               'convSeqNo' VALUE convSeqNo,
                                               'detenRecordIdcNo' VALUE detenRecordIdcNo,
                                               'checkIo' VALUE checkIo,
                                               'imgPhb' VALUE (
                                                                  select JSON_OBJECT (
                                                                       'fileNameImgPerson' VALUE '',
                                                                       'binaryImgPerson' VALUE '',
                                                                       'fileSizeImgPerson' VALUE ''
                                                                       )
                                                                         from obj_data
                                                                )
                                               )
                                         from obj_data
                                          ),
                    'insuranceData' value ( select JSON_OBJECT(
                                                 'insPerson' VALUE insPerson,
                                                 'insDept' VALUE insDept,
                                                 'addr' VALUE addr,
                                                 'telNo' VALUE telNo,
                                                 'authorise' VALUE authorise,
                                                 'note' VALUE note,
                                                  'tmbSeqNo' VALUE tmbSeqNo,
                                                 'ampSeqNo' VALUE ampSeqNo,
                                                  'pvSeqNo' VALUE pvSeqNo
                                                 )
                                         from obj_data
                                        )
                   ),imgPhb,updateBy,updateDate
into c_data,b_img,v_update_by,v_update_date
from obj_data
;

else

WITH obj_data AS (select   
          a.PHB_SEQNO as bioPk
           ,a.update_by as updateBy
          ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
from mscs_prohibit a
where a.METHOD =p_inout and
      a.PHB_SEQNO =p_id)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'PHB',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deleteBy' VALUE updateBy,
                                               'deleteDate' VALUE updateDate
                                               )
                                        from obj_data
                                       )
                   )
into c_data
from obj_data
;

end if;

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
  
 if p_mode <> 'D' then
  --Set Image Pass
  l_temp_obj1 :=l_obj.get_object('prohibitData'); 
  l_temp_obj2 :=l_temp_obj1.get_object('imgPhb'); 
  l_temp_obj2.put('binaryImgPerson',FN_BLOB_TO_CLOB(b_img));
  
 end if;
 
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
     if p_inout =2 then
      v_service_name := 'editProhibitInToPibics';
      end if;
     if p_inout =1 then
      v_service_name := 'editProhibitOutToPibics';
      l_obj.remove('insuranceData');
      end if;
       l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('updateBy',v_update_by);
     l_temp_obj1.put('updateDate',v_update_date);
     l_temp_obj1.remove('createBy');
     l_temp_obj1.remove('createDate');
     
      l_temp_obj2 :=l_obj.get_object('prohibitData'); 
      l_temp_obj2.remove('imgPhb');
     else
     v_dml_type :='D';
      if p_inout =2 then
      v_service_name := 'delProhibitInToPibics';
      end if;
       if p_inout =1 then
      v_service_name := 'delProhibitOutToPibics';
      end if;
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
            where sender ='PHB' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
            ) b on 1=1 ;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);

    else
     if p_inout =2 then
     v_service_name := 'addProhibitInToPibics';
     end if;
     if p_inout =1 then
     v_service_name := 'addProhibitOutToPibics';
      l_obj.remove('insuranceData');
     end if;
   end if;
     v_url :=v_url ||'/rest/isds/trns/'||v_service_name;
  
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
    'PHB',
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
   
    exception when others then
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END PROHIBIT_TO_PIBICS;
  
  
    PROCEDURE FEES_TO_PIBICS (
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
if p_mode = 'E' then

WITH obj_data AS (
select a.fees_seqno as bioPk
       ,a.FEESNO as refNo
       ,a.FEESLIPNO as slipNo
       ,a.FEESLIPBOOKNO as slipBookNo
       ,to_char(a.FEESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FEESLIPTOTAL as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,to_char(a.birthDte,'dd/mm/yyyy') as birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
        ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
       ,a.APPROVE_BY as approveBy
       ,a.printFlag
       ,a.FEESREMARK as feesRemark
       ,a.feesStatus
from mscs_fs_fees a
where a.fees_seqno = p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'editFeesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'refNo' VALUE refNo,
                                               'slipTotal' VALUE slipTotal,
                                               'efirstNM' VALUE efirstNM,
                                               'emiddleNM' VALUE emiddleNM,
                                                'efamilyNM' VALUE efamilyNM,
                                               'updateDate' VALUE updateDate,
                                               'version' VALUE '1',
                                                'sex' VALUE sex,
                                               'slipNo' VALUE slipNo,
                                               'slipBookNo' VALUE slipBookNo,
                                                'birthDte' VALUE birthDte,
                                               'printFlag' VALUE printFlag,
                                                'slipType' VALUE slipType,
                                               'slipDate' VALUE slipDate,
                                                'inDte' VALUE inDte,
                                               'feesStatus' VALUE feesStatus,
                                               'deptSeqno' VALUE deptSeqno,
                                               'passportNo' VALUE passportNo,
                                               'tm6No' VALUE tm6No,
                                               'nationSeqno' VALUE nationSeqno,
                                               'convSeqno' VALUE convSeqno,
                                               'convRegno' VALUE convRegno,
                                               'feesRemark' VALUE feesRemark,
                                               'suffixSeqno' VALUE suffixSeqno,
                                               'approveBy'  VALUE approveBy
                                               )
                                         from obj_data
                                          ),
                    'editFeesToPibicsReqDt' value ( select JSON_ARRAYAGG (
                                                 JSON_OBJECT (          'feesDetailSeqno' VALUE b.feesDetail_Seqno 
                                                                       ,'prateSeqno' VALUE b.prate_seqno 
                                                                        , 'feesSlipAmount' VALUE b.FEESLIPAMOUNT 
                                                                         , 'versionDt' VALUE '1' 
                                                                     )
                                                      )
                                                from MSCS_FS_FEESDETAIL b
                                                where b.FEES_SEQNO =obj_data.bioPk
                                        )
                   )
into c_data
from obj_data
;

else
WITH obj_data AS (
select a.fees_seqno as bioPk
       ,a.FEESNO as refNo
       ,a.FEESLIPNO as slipNo
       ,a.FEESLIPBOOKNO as slipBookNo
       ,to_char(a.FEESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FEESLIPTOTAL as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,to_char(a.birthDte,'dd/mm/yyyy') as birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
       ,a.APPROVE_BY as approveBy
       ,a.printFlag
       ,a.FEESREMARK as remark
from mscs_fs_fees a
where a.fees_seqno = p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'addFeesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'refNo' VALUE refNo,
                                               'slipNo' VALUE slipNo,
                                               'slipBookNo' VALUE slipBookNo,
                                               'slipDate' VALUE slipDate,
                                                'slipTotal' VALUE slipTotal,
                                               'deptSeqno' VALUE deptSeqno,
                                               'passportNo' VALUE passportNo,
                                                'tm6No' VALUE tm6No,
                                               'efirstNM' VALUE efirstNM,
                                               'emiddleNM' VALUE emiddleNM,
                                                'efamilyNM' VALUE efamilyNM,
                                               'sex' VALUE sex,
                                                'birthDte' VALUE birthDte,
                                               'nationSeqno' VALUE nationSeqno,
                                                'convSeqno' VALUE convSeqno,
                                               'convRegno' VALUE convRegno,
                                               'inDte' VALUE inDte,
                                               'visaTypeSeqno' VALUE visaTypeSeqno,
                                               'slipType' VALUE slipType,
                                               'suffixSeqno' VALUE suffixSeqno,
                                               'createDate' VALUE createDate,
                                               'approveBy' VALUE approveBy,
                                               'printFlag' VALUE printFlag,
                                               'remark' VALUE remark
                                               )
                                         from obj_data
                                          ),
                    'addFeesToPibicsReqDt' value ( select JSON_ARRAYAGG (
                                                 JSON_OBJECT ('prateSeqno' VALUE b.prate_seqno 
                                                                        , 'feesSlipAmount' VALUE b.FEESLIPAMOUNT 
                                                                     )
                                                      )
                                                from MSCS_FS_FEESDETAIL b
                                                where b.FEES_SEQNO =obj_data.bioPk
                                        )
                   )
into c_data
from obj_data
;

end if;
else

WITH obj_data AS (
select a.fees_seqno as bioPk
       ,a.FEESNO as refNo
       ,a.FEESLIPNO as slipNo
       ,a.FEESLIPBOOKNO as slipBookNo
       ,to_char(a.FEESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FEESLIPTOTAL as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,to_char(a.birthDte,'dd/mm/yyyy') as birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
        ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
       ,a.APPROVE_BY as approveBy
       ,a.printFlag
       ,a.FEESREMARK as feesRemark
from mscs_fs_fees a
where a.fees_seqno = p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'delFeesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'deleteDate' VALUE updateDate,
                                               'version' VALUE '1'
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
  
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
      v_service_name := 'editFeesToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delFeesToPibics';
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
            where sender ='F2F' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else

     v_service_name := 'addFeesToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/f2f/'||v_service_name;
  
        
   PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
   v_receive_id := '';
   v_recevice_message:= null;
   if v_x_response_code =200 then
   l_obj_response :=JSON_OBJECT_T(b_x_response_message);
  
   v_recevice_message := l_obj_response.get_string('msgDesc');
    if l_obj_response.get_string('msgCode') = '0000' then
    v_receive_id :=l_obj_response.get_string('pibicsPk'); 
   end if;
   end if;
   
   p_message :=v_recevice_message;
    PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   v_dml_type,
    'ADMIN',
    'F2F',
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
   
    exception when others then
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END FEES_TO_PIBICS;



    PROCEDURE FINES_TO_PIBICS (
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
if p_mode = 'E' then

 WITH obj_data AS (
select a.FINES_SEQNO as bioPk
       ,a.FINESNO as refNo
       ,a.FINESLIPNO as slipNo
       ,a.FINESLIPBOOKNO as slipBookNo
       ,to_char(a.FINESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FINESLIPAMOUNT as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,a.birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
       ,a.printFlag
       ,a.FINESREMARK 
       ,a.chargeDOf
       ,a.chargeNo
       ,a.staff_Seqno as staffSeqno
       ,a.tfirstNM
       ,a.tfamilyNM
       ,to_char(a.permit_Date,'yyyymmdd') as permitDate
       ,a.permit_Seqno as permitSeqno
       ,to_char(a.outDte,'yyyymmdd') as outDte
       ,to_char(a.VISAEXPDTE,'yyyymmdd') as visaExpire
       ,a.flag_System as flagSystem
       ,a.fineStatus as fineStatus
from mscs_fs_fines a
where a.FINES_SEQNO = p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'editFinesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'refNo' VALUE refNo,
                                               'slipTotal' VALUE slipTotal,
                                               'efirstNM' VALUE efirstNM,
                                               'emiddleNM' VALUE emiddleNM,
                                                'efamilyNM' VALUE efamilyNM,
                                                'updateDate' VALUE updateDate,
                                                'version' VALUE '1',
                                               'sex' VALUE sex,
                                               'slipBookNo' VALUE slipBookNo,
                                                'slipNo' VALUE slipNo,
                                               'birthDte' VALUE birthDte,
                                               'printFlag' VALUE printFlag,
                                                'slipType' VALUE slipType,
                                               'slipDate' VALUE slipDate,
                                                'chargeDOf' VALUE chargeDOf,
                                               'chargeNo' VALUE chargeNo,
                                                'deptSeqno' VALUE deptSeqno,
                                               'passportNo' VALUE passportNo,
                                               'tm6No' VALUE tm6No,
                                               'nationSeqno' VALUE nationSeqno,
                                               'convSeqno' VALUE convSeqno,
                                               'convRegno' VALUE convRegno,
                                               'inDte' VALUE inDte,
                                               'outDte' VALUE outDte,
                                               'visaExpire' VALUE visaExpire,
                                               'permitDate' VALUE permitDate,
                                                'fineStatus' VALUE fineStatus,
                                                'visaTypeSeqno' VALUE visaTypeSeqno,
                                               'finesRemark' VALUE finesRemark,
                                               'flagSystem' VALUE flagSystem,
                                               'permitSeqno' VALUE permitSeqno,
                                               'suffixSeqno' VALUE suffixSeqno,
                                                'tfamilyNM' VALUE tfamilyNM,
                                                 'tfirstNM' VALUE tfirstNM,
                                                  'staffSeqno' VALUE staffSeqno
                                               )
                                         from obj_data
                                          ),
                    'editFinesToPibicsReqDt' value ( select JSON_ARRAYAGG (
                                                 JSON_OBJECT (          'finesDetailSeqno' VALUE b.finesDetail_Seqno
                                                                        ,'prateSeqno' VALUE b.prate_seqno 
                                                                        , 'fineSlipAmount' VALUE b.FINESLIPAMOUNT 
                                                                         , 'overStayDay' VALUE b.overStayDay 
                                                                         , 'versionDt' VALUE '2'
                                                                     )
                                                      )
                                                from MSCS_FS_FINESDETAIL b
                                                where b.FINES_SEQNO =obj_data.bioPk
                                        )
                   )
into c_data
from obj_data
;
else
WITH obj_data AS (
select a.FINES_SEQNO as bioPk
       ,a.FINESNO as refNo
       ,a.FINESLIPNO as slipNo
       ,a.FINESLIPBOOKNO as slipBookNo
       ,to_char(a.FINESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FINESLIPAMOUNT as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,a.birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
       ,a.printFlag
       ,a.FINESREMARK as remark
       ,a.chargeDOf
       ,a.chargeNo
       ,a.staff_Seqno as staffSeqno
       ,a.tfirstNM
       ,a.tfamilyNM
       ,to_char(a.permit_Date,'yyyymmdd') as permitDate
       ,a.permit_Seqno as permitSeqno
       ,to_char(a.outDte,'yyyymmdd') as outDte
       ,to_char(a.VISAEXPDTE,'yyyymmdd') as visaExpire
from mscs_fs_fines a
where a.FINES_SEQNO = p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'addFinesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'refNo' VALUE refNo,
                                               'slipNo' VALUE slipNo,
                                               'slipBookNo' VALUE slipBookNo,
                                               'slipDate' VALUE slipDate,
                                                'slipTotal' VALUE slipTotal,
                                                'chargeDOf' VALUE chargeDOf,
                                                'chargeNo' VALUE chargeNo,
                                               'deptSeqno' VALUE deptSeqno,
                                               'passportNo' VALUE passportNo,
                                                'tm6No' VALUE tm6No,
                                               'efirstNM' VALUE efirstNM,
                                               'emiddleNM' VALUE emiddleNM,
                                                'efamilyNM' VALUE efamilyNM,
                                               'sex' VALUE sex,
                                                'birthDte' VALUE birthDte,
                                               'nationSeqno' VALUE nationSeqno,
                                                'convSeqno' VALUE convSeqno,
                                               'convRegno' VALUE convRegno,
                                               'inDte' VALUE inDte,
                                               'visaTypeSeqno' VALUE visaTypeSeqno,
                                               'visaExpire' VALUE visaExpire,
                                               'outDte' VALUE outDte,
                                               'permitSeqno' VALUE permitSeqno,
                                               'permitDate' VALUE permitDate,
                                               'slipType' VALUE slipType,
                                               'suffixSeqno' VALUE suffixSeqno,
                                                'tfamilyNM' VALUE tfamilyNM,
                                                 'tfirstNM' VALUE tfirstNM,
                                               'createDate' VALUE createDate,
                                               'staffSeqno' VALUE staffSeqno,
                                               'printFlag' VALUE printFlag,
                                               'remark' VALUE remark
                                               )
                                         from obj_data
                                          ),
                    'addFinesToPibicsReqDt' value ( select JSON_ARRAYAGG (
                                                 JSON_OBJECT ('prateSeqno' VALUE b.prate_seqno 
                                                                        , 'finesSlipAmount' VALUE b.FINESLIPAMOUNT 
                                                                         , 'overStayDay' VALUE b.overStayDay 
                                                                     )
                                                      )
                                                from MSCS_FS_FINESDETAIL b
                                                where b.FINES_SEQNO =obj_data.bioPk
                                        )
                   )
into c_data
from obj_data
;

end if;
else

WITH obj_data AS (
select a.FINES_SEQNO as bioPk
       ,a.FINESNO as refNo
       ,a.FINESLIPNO as slipNo
       ,a.FINESLIPBOOKNO as slipBookNo
       ,to_char(a.FINESLIPDATE,'YYYYMMDDHH24MISS') as slipDate
       ,a.FINESLIPAMOUNT as slipTotal
       ,a.DEPT_SEQNO as deptSeqno
       ,a.passportNo
       ,a.tm6No
       ,a.efirstNM
       ,a.emiddleNM
       ,a.efamilyNM
       ,a.sex
       ,a.birthDte
       ,a.nation_seqno as nationSeqno
       ,a.conv_seqno as convSeqno
       ,a.convRegno
       ,to_char(a.inDte,'yyyymmdd') as inDte
       ,a.VISATYPE_SEQNO as visaTypeSeqno
       ,a.slipType
       ,a.suffix_seqno as suffixSeqno
       ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
       ,a.printFlag
       ,a.FINESREMARK 
       ,a.chargeDOf
       ,a.chargeNo
       ,a.staff_Seqno as staffSeqno
       ,a.tfirstNM
       ,a.tfamilyNM
       ,to_char(a.permit_Date,'yyyymmdd') as permitDate
       ,a.permit_Seqno as permitSeqno
       ,to_char(a.outDte,'yyyymmdd') as outDte
       ,to_char(a.VISAEXPDTE,'yyyymmdd') as visaExpire
       ,a.flag_System as flagSystem
       ,a.fineStatus as fineStatus
from mscs_fs_fines a
where a.FINES_SEQNO = 81 )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'F2F',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               )
                                        from obj_data
                                       ),
                    'delFinesToPibicsReqHd' value (
                                         select JSON_OBJECT (
                                               'deleteDate' VALUE updateDate,
                                               'version' VALUE '1'
                                               )
                                         from obj_data
                                          )
                   )
into c_data
from obj_data
;
end if;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
      v_service_name := 'editFinesToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delFinesToPibics';
     end if;
    select RECEIVER_RESPONSE_ID
    into i_pibicspk
     from dual a
     left join (
     select * from (
      SELECT TL.* , 
            ROW_NUMBER () OVER (PARTITION BY  TL.SENDER_OBJECT_ID
            ORDER BY TL.DML_AT DESC
            ) RN_MAX_ISSUE_DT 
            FROM  MSCS_LOG_SYNC_WEBSERVICES TL  
            where sender ='F2F' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else

     v_service_name := 'addFinesToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/f2f/'||v_service_name;
  
        
   PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
   v_receive_id := '';
   v_recevice_message:= null;
   if v_x_response_code =200 then
   l_obj_response :=JSON_OBJECT_T(b_x_response_message);
  
   v_recevice_message := l_obj_response.get_string('msgDesc');
    if l_obj_response.get_string('msgCode') = '0000' then
    v_receive_id :=l_obj_response.get_string('pibicsPk'); 
   end if;
   end if;
   
   p_message :=v_recevice_message;
    PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   v_dml_type,
    'ADMIN',
    'F2F',
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
   
    exception when others then
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END FINES_TO_PIBICS;
  
    PROCEDURE DEPORTEE_TO_PIBICS (
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
    v_update_by varchar2(200);
    v_update_date varchar2(50);
  BEGIN
  
  
d_start_date := sysdate;
--//////////////////////////////////////////////////////////////////////////////////////////////////
if p_mode <> 'D' then
WITH obj_data AS (
select a.dpt_seqno as bioPk
      ,a.create_by as createBy
      ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
       ,a.update_by as updateBy
      ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
      ,a.deptDpt_SeqNo as deptDptSeqNo
      ,a.deptFwdNote
      ,a.deptDocNo
      ,to_char(a.deptDocDte,'yyyymmdd') as deptDocDte
      ,a.dept_SeqNo as deptSeqNo
      ,a.dptUsrId
      ,a.dptNo
      ,'N' as initType
      ,a.tm6No
      ,to_char(a.inDte,'yyyymmdd') as inDte
      ,a.conv_SeqNo as convSeqNo
      ,a.docId
      ,a.nationCd
      ,a.docNo
      ,a.efirstNm
      ,a.emiddleNm
      ,a.efamilyNm
      ,a.tfirstNm
      ,a.tmiddleNm
      ,a.tfamilyNm
      ,a.sex
      ,a.birthDte
      ,a.visaType_SeqNo as visaTypeSeqNo
      ,to_char(a.visaExpDte,'yyyymmdd') as visaExpDte
      ,a.permit_SeqNo as permitSeqNo
      ,to_char(a.permitDte,'yyyymmdd') as permitDte
      ,a.countCd
      ,to_char(a.issDte,'yyyymmdd') as issDte
      ,a.issPlace
      ,to_char(a.expDte,'yyyymmdd') as expDte
      ,a.reasonDpt_SeqNo as reasonDptSeqNo
      ,a.dptReasonNote
      ,a.behavior
      ,a.method
      ,a.deptPer
      ,a.CONVREGNO
      ,to_char(a.dptDte,'yyyymmdd') as dptDte
      ,a.imgDpt
      ,a.imgPass
      ,to_char(b.proDte,'yyyymmdd') as proDte
      ,b.proUsrId
      ,b.note
      ,b.authorise
      ,to_char(c.proDte,'yyyymmdd') as rproDte
      ,c.proUsrId as rproUsrId
      ,c.case1
      ,c.reason
      ,c.dept_SeqNo as rdeptSeqNo
      ,to_char(c.dueDte,'yyyymmdd') as dueDte
      ,to_char(d.proDte,'yyyymmdd') as aproDte
       ,d.proUsrId as aproUsrId
       ,d.charge
       ,d.evidence
       ,d.deptNm
from mscs_deportee a
left join mscs_inpro b on a.DPT_SEQNO =b.DPT_SEQNO
left join MSCS_REPORTPRO c on a.DPT_SEQNO =c.DPT_SEQNO
left join MSCS_ARRESTPRO d on a.DPT_SEQNO =d.DPT_SEQNO
where a.dpt_seqno =p_id
)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'RETH',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'createBy' VALUE createBy,
                                               'createDate' VALUE createDate,
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from obj_data
                                       ),
                    'receiveData' value(
                                        select JSON_OBJECT (
                                               'deptDptSeqNo' VALUE deptDptSeqNo,
                                               'deptFwdNote' VALUE deptFwdNote,
                                               'deptDocNo' VALUE deptDocNo,
                                               'deptDocDte' VALUE deptDocDte,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'dptUsrId' VALUE dptUsrId,
                                               'dptNo' VALUE dptNo
                                               )
                                        from obj_data
                                       ),
                    'deporteeData' value (
                                         select JSON_OBJECT (
                                               'initType' VALUE initType,
                                               'tm6No' VALUE tm6No,
                                               'inDte' VALUE inDte,
                                               'convSeqNo' VALUE convSeqNo,
                                                'convRegNo' VALUE convRegNo,
                                               'docId' VALUE docId,
                                               'nationCd' VALUE nationCd,
                                                'docNo' VALUE docNo,
                                               'efirstNm' VALUE efirstNm,
                                               'emiddleNm' VALUE emiddleNm,
                                                'efamilyNm' VALUE efamilyNm,
                                               'tfirstNm' VALUE tfirstNm,
                                                'tmiddleNm' VALUE tmiddleNm,
                                               'tfamilyNm' VALUE tfamilyNm,
                                                'sex' VALUE sex,
                                               'birthDte' VALUE birthDte,
                                               'visaTypeSeqNo' VALUE visaTypeSeqNo,
                                               'visaExpDte' VALUE visaExpDte,
                                               'permitSeqNo' VALUE permitSeqNo,
                                               'permitDte' VALUE permitDte,
                                               'countCd' VALUE countCd,
                                               'issDte' VALUE issDte,
                                               'issPlace' VALUE issPlace,
                                               'expDte' VALUE expDte,
                                               'reasonDptSeqNo' VALUE reasonDptSeqNo,
                                               'dptReasonNote' VALUE dptReasonNote,
                                               'behavior' VALUE behavior,
                                               'method' VALUE method,
                                               'deptPer' VALUE deptPer,
                                               'dptDte' VALUE dptDte,
                                               'imgDpt' VALUE (
                                                                  select JSON_OBJECT (
                                                                       'fileNameImgPerson' VALUE '',
                                                                       'binaryImgPerson' VALUE '',
                                                                       'fileSizeImgPerson' VALUE ''
                                                                       )
                                                                         from obj_data
                                                                ),
                                                'imgPass' VALUE (
                                                                  select JSON_OBJECT (
                                                                       'fileNameImgPassport' VALUE '',
                                                                       'binaryImgPassport' VALUE '',
                                                                       'fileSizeImgPassport' VALUE ''
                                                                       )
                                                                         from obj_data
                                                                )
                                               )
                                         from obj_data
                                          ),
                    'inProData' value ( select JSON_OBJECT(
                                                 'proDte' VALUE proDte,
                                                 'proUsrId' VALUE proUsrId,
                                                 'note' VALUE note,
                                                 'authorise' VALUE authorise
                                                 )
                                         from obj_data
                                        ),
                    'reportProData' value ( select JSON_OBJECT(
                                                 'proDte' VALUE rproDte,
                                                 'proUsrId' VALUE rproUsrId,
                                                 'case1' VALUE case1,
                                                 'reason' VALUE reason,
                                                  'deptSeqNo' VALUE deptSeqNo,
                                                   'dueDte' VALUE dueDte
                                                 )
                                         from obj_data
                                        ),
                     'arrestProData' value ( select JSON_OBJECT(
                                                 'proDte' VALUE aproDte,
                                                 'proUsrId' VALUE aproUsrId,
                                                 'charge' VALUE charge,
                                                 'evidence' VALUE evidence,
                                                  'deptNm' VALUE deptNm
                                                 )
                                         from obj_data
                                        )  ,
                     'foreignProData' value ''                                      
                   ),imgDpt,imgPass,updateby,updatedate
into c_data,b_img_person,b_img_pass,v_update_by,v_update_date
from obj_data
;
else

WITH obj_data AS (
select a.dpt_seqno as bioPk
      ,a.create_by as createBy
      ,to_char(a.create_date,'yyyymmddhh24miss') as createDate
       ,a.update_by as updateBy
      ,to_char(a.update_date,'yyyymmddhh24miss') as updateDate
      ,a.deptDpt_SeqNo as deptDptSeqNo
      ,a.deptFwdNote
      ,a.deptDocNo
      ,to_char(a.deptDocDte,'yyyymmdd') as deptDocDte
      ,a.dept_SeqNo as deptSeqNo
      ,a.dptUsrId
      ,a.dptNo
      ,'N' as initType
      ,a.tm6No
      ,to_char(a.inDte,'yyyymmdd') as inDte
      ,a.conv_SeqNo as convSeqNo
      ,a.docId
      ,a.nationCd
      ,a.docNo
      ,a.efirstNm
      ,a.emiddleNm
      ,a.efamilyNm
      ,a.tfirstNm
      ,a.tmiddleNm
      ,a.tfamilyNm
      ,a.sex
      ,a.birthDte
      ,a.visaType_SeqNo as visaTypeSeqNo
      ,to_char(a.visaExpDte,'yyyymmdd') as visaExpDte
      ,a.permit_SeqNo as permitSeqNo
      ,to_char(a.permitDte,'yyyymmdd') as permitDte
      ,a.countCd
      ,to_char(a.issDte,'yyyymmdd') as issDte
      ,a.issPlace
      ,to_char(a.expDte,'yyyymmdd') as expDte
      ,a.reasonDpt_SeqNo as reasonDptSeqNo
      ,a.dptReasonNote
      ,a.behavior
      ,a.method
      ,a.deptPer
      ,a.CONVREGNO
      ,to_char(a.dptDte,'yyyymmdd') as dptDte
      ,a.imgDpt
      ,a.imgPass
      ,to_char(b.proDte,'yyyymmdd') as proDte
      ,b.proUsrId
      ,b.note
      ,b.authorise
      ,to_char(c.proDte,'yyyymmdd') as rproDte
      ,c.proUsrId as rproUsrId
      ,c.case1
      ,c.reason
      ,c.dept_SeqNo as rdeptSeqNo
      ,to_char(c.dueDte,'yyyymmdd') as dueDte
      ,to_char(d.proDte,'yyyymmdd') as aproDte
       ,d.proUsrId as aproUsrId
       ,d.charge
       ,d.evidence
       ,d.deptNm
from mscs_deportee a
left join mscs_inpro b on a.DPT_SEQNO =b.DPT_SEQNO
left join MSCS_REPORTPRO c on a.DPT_SEQNO =c.DPT_SEQNO
left join MSCS_ARRESTPRO d on a.DPT_SEQNO =d.DPT_SEQNO
where a.dpt_seqno =p_id
)
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1234',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'RETH',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deleteBy' VALUE updateBy,
                                               'deleteDate' VALUE updateDate
                                               )
                                        from obj_data
                                       )                                   
                   )
into c_data
from obj_data
;
end if;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
      v_service_name := 'editDeporteeToPibics';
    l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('updateBy',v_update_by);
     l_temp_obj1.put('updateDate',v_update_date);
     l_temp_obj1.remove('createBy');
     l_temp_obj1.remove('createDate');
     else
     v_dml_type :='D';
      v_service_name := 'delDeporteeToPibics';
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
            where sender ='RETH' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1)
     b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else

     v_service_name := 'addDeporteeToPibics';
     l_temp_obj1 :=l_obj.get_object('deporteeData'); 
     l_temp_obj2 :=l_temp_obj1.get_object('imgDpt'); 
     l_temp_obj2.put('binaryImgPerson',FN_BLOB_TO_CLOB(b_img_person));
     l_temp_obj3 :=l_temp_obj1.get_object('imgPass'); 
     l_temp_obj3.put('binaryImgPassport',FN_BLOB_TO_CLOB(b_img_pass));
   end if;
     v_url :=v_url ||'/rest/isds/reth/'||v_service_name;
  
        
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
    'F2F',
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
   
    exception when others then
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END DEPORTEE_TO_PIBICS;
  
  
    PROCEDURE REPS_TO_PIBICS (
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

WITH obj_data AS (select 
       a.tm8_seqno as bioPk
       ,a.DEPT_SEQNO as deptSeqNo
       ,to_char(sysdate,'yyyymmddhh24miss') as saveDate
      ,a.MANUALTM8
      ,a.tm8No
      ,a.year
      ,a.FAMILYNM as familyName
      ,a.FIRSTNM as firstName
      ,a.MIDDLENM as middleName
      ,a.NATIONAL_SEQNO
      ,b.ABBCOUNT as nationality
      ,a.BIRTH_DATE as birthDate
      ,a.sex
      ,a.age
      ,a.OCC_SEQNO as occupationSeqNo
      ,a.BIRTH_PLACE as birthPlace
      ,a.BIRTHCOUNT_SEQNO as birthCountrySeqNo
      ,a.PASSPORTNO as passportNo
      ,to_char(a.PASSPORT_DATE,'yyyymmdd') as passportIssueDate
      ,to_char(a.PASSPORTEXP_DATE,'yyyymmdd') as passportExpireDate
      ,a.PASSPORTISSUEBY as passportIssueBy
      ,a.ADDR as address
      ,a.ROAD
      ,a.TMB_SEQNO as tumbonSeqNo
      ,a.AMP_SEQNO as aumpurSeqNo
      ,a.PV_SEQNO as provinceSeqNo
      ,a.VISANO as visaNo
      ,a.TDT_SEQNO as tdtSeqNo
      ,a.VISAISSUE
      ,to_char(a.VISA_DATE,'yyyymmdd') as visaDate
      ,a.OPERMIT_SEQNO as oldPermitSeqNo
      ,to_char(a.ARRIVE_DATE,'yyyymmdd') as arrivalDate
      ,to_char(a.OPERMIT_DATE,'yyyymmdd') as oldPermitDate
      ,a.DOCTYPE
      ,a.PURPOSECOUNT_SEQNO as purposeCountrySeqNo
      ,a.CONV_SEQNO as conveyanceSeqNo
      ,to_char(a.LEAVE_DATE,'yyyymmdd') as leaveDate
      ,to_char(a.RETURN_DATE) as returnDate
      ,a.PURPOSE
      ,a.APPVSTS as approveStatus
      ,to_char(a.DOC_DATE,'yyyymmdd') as docDate
      ,a.PERMIT_STATUS as permitStatus
      ,to_char(a.NEWPERMIT_DATE,'yyyymmdd') as newPermitDate
      ,to_char(a.ENDPERMIT_DATE,'yyyymmdd') as endPermitDate
      ,a.REASON_SEQNO as reasonSeqNo
      ,a.REASONDESC
      ,a.OVISATYPE_SEQNO as visaTypeSeqNo
      ,to_char(a.TODAY_DATE,'yyyymmdd') as todayDate
      ,a.TM6NO
      ,to_char(a.APPVSTSBYDATE,'yyyymmdd') as approveStatusByDate
      ,a.APPVSTSBYDEPT_SEQNO as approveByDeptSeqNo
      ,a.ZONE_SEQNO as zoneSeqNo
      ,a.SUFFIX_SEQNO as suffixSeqNo
      ,a.EXTLIST_SEQNO as extListSeqNo
      ,a.TELEPHONE as telephone
      ,'' as fileSizeImgPerson
      ,'image' as fileNameImgPerson
      ,a.FLAG_QUEONLINE as flagQueOnline
      ,c.OPASSPORTNO as oldPassportNo
      ,to_char(c.OPASSPORT_DATE,'yyyymmdd') as oldPassportIssueDate
      ,to_char(c.OPASSPORTEXP_DATE,'yyyymmdd') as oldPassportExpireDate
      ,c.PERMIT_SEQNO as permitSeqNo
      ,to_char(c.PERMIT_DATE,'yyyymmdd') as permitDate
      ,c.STATUSENTRY
      ,to_char(c.STATUSENTRYDTE,'yyyymmdd') as statusEntryDate
      ,to_char(c.VISAEND_DATE,'yyyymmdd') as visaEndDate
      ,d.FEESNO as feeNo
      ,d.FEESLIPNO as feeSlipNo
      ,d.FEESLIPBOOKNO as feeSlipBookNo
      ,e.PRATE_SEQNO as prateSeqNo
      ,e.FEESLIPAMOUNT as feeSlipAmount
      ,d.PRINTFLAG as printSlip
      ,a.img_person
from MSCS_REPS_TM8 a
left join PIBICSDM2.COUNTRY b on a.NATIONAL_SEQNO =b.COUNT_SEQNO
left join MSCS_REPS_PERSON c on a.TM8_SEQNO =c.TM8_SEQNO
left join MSCS_FS_FEES d on a.FEES_SEQNO =d.FEES_SEQNO
left join MSCS_FS_FEESDETAIL e on d.FEES_SEQNO =e.FEES_SEQNO
where a.tm8_seqno =p_id and c.personflag in ('A','M'))
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1101',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'REPS',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               ,'deptSeqNo' value deptSeqNo
                                               ,'saveUser' value 'anothai.s'
                                               ,'saveDate' value saveDate
                                               ,'saveIpClient' value '172.22.6.42'
                                               )
                                        from obj_data
                                       ),
                  'reEntryTM8Info' value (
                                           select JSON_OBJECT (
                                                                      'manualTM8'	  value  manualTM8
                                                                    ,'tm8No'	  value  tm8No
                                                                    ,'year'	  value  year
                                                                    ,'familyName'	  value  familyName
                                                                    ,'firstName'	  value  firstName
                                                                    ,'middleName'	  value  middleName
                                                                    ,'nationality'	  value  nationality
                                                                    ,'birthDate'	  value  birthDate
                                                                    ,'sex'	  value  sex
                                                                    ,'age'	  value  age
                                                                    ,'occupationSeqNo'	  value  occupationSeqNo
                                                                    ,'birthPlace'	  value  birthPlace
                                                                    ,'birthCountrySeqNo'	  value  birthCountrySeqNo
                                                                    ,'passportNo'	  value  passportNo
                                                                    ,'passportIssueDate'	  value  passportIssueDate
                                                                    ,'passportExpireDate'	  value  passportExpireDate
                                                                    ,'passportIssueBy'	  value  passportIssueBy
                                                                    ,'address'	  value  address
                                                                    ,'road'	  value  road
                                                                    ,'tumbonSeqNo'	  value  tumbonSeqNo
                                                                    ,'aumpurSeqNo'	  value  aumpurSeqNo
                                                                    ,'provinceSeqNo'	  value  provinceSeqNo
                                                                    ,'visaNo'	  value  visaNo
                                                                    ,'tdtSeqNo'	  value  tdtSeqNo
                                                                    ,'visaIssue'	  value  visaIssue
                                                                    ,'visaDate'	  value  visaDate
                                                                    ,'oldPermitSeqNo'	  value  oldPermitSeqNo
                                                                    ,'arrivalDate'	  value  arrivalDate
                                                                    ,'oldPermitDate'	  value  oldPermitDate
                                                                    ,'docType'	  value  docType
                                                                    ,'purposeCountrySeqNo'	  value  purposeCountrySeqNo
                                                                    ,'conveyanceSeqNo'	  value  conveyanceSeqNo
                                                                    ,'leaveDate'	  value  leaveDate
                                                                    ,'returnDate'	  value  returnDate
                                                                    ,'purpose'	  value  purpose
                                                                    ,'approveStatus'	  value  approveStatus
                                                                    ,'docDate'	  value  docDate
                                                                    ,'permitStatus'	  value  permitStatus
                                                                    ,'newPermitDate'	  value  newPermitDate
                                                                    ,'endPermitDate'	  value  endPermitDate
                                                                    ,'reasonSeqNo'	  value  reasonSeqNo
                                                                    ,'reasonDesc'	  value  reasonDesc
                                                                    ,'visaTypeSeqNo'	  value  visaTypeSeqNo
                                                                    ,'todayDate'	  value  todayDate
                                                                    ,'tm6No'	  value  tm6No
                                                                    ,'approveStatusByDate'	  value  approveStatusByDate
                                                                    ,'approveByDeptSeqNo'	  value  approveByDeptSeqNo
                                                                    ,'zoneSeqNo'	  value  zoneSeqNo
                                                                    ,'suffixSeqNo'	  value  suffixSeqNo
                                                                    ,'extListSeqNo'	  value  extListSeqNo
                                                                    ,'telephone'	  value  telephone
                                                                    ,'fileSizeImgPerson'	  value  fileSizeImgPerson
                                                                    ,'fileNameImgPerson'	  value  fileNameImgPerson
                                                                    ,'flagQueOnline'	  value  flagQueOnline
                                                                    ,'oldPassportNo'	  value  oldPassportNo
                                                                    ,'oldPassportIssueDate'	  value  oldPassportIssueDate
                                                                    ,'oldPassportExpireDate'	  value  oldPassportExpireDate
                                                                    ,'permitSeqNo'	  value  permitSeqNo
                                                                    ,'permitDate'	  value  permitDate
                                                                    ,'statusEntry'	  value  statusEntry
                                                                    ,'statusEntryDate'	  value  statusEntryDate
                                                                    ,'visaEndDate'	  value  visaEndDate
                                                                    ,  'feeInfo' value (
                                                                                          select JSON_OBJECT (
                                                                                                   'feeNo' VALUE feeNo
                                                                                                   ,'feeSlipNo' value feeSlipNo
                                                                                                   ,'feeSlipBookNo' value feeSlipBookNo
                                                                                                   ,'prateSeqNo' value prateSeqNo
                                                                                                   ,'feeSlipAmount' value feeSlipAmount
                                                                                                   ,'printSlip' value printSlip
                                                                                                   )
                                                                                            from obj_data
                                                                                           )
                                                                       )
                                                                from obj_data
                                          )
                       
                ),img_person
into c_data,b_img_person
from obj_data;

else
WITH obj_data AS (select 
       a.tm8_seqno as bioPk
       ,a.DEPT_SEQNO as deptSeqNo
       ,to_char(sysdate,'yyyymmddhh24miss') as saveDate
      ,a.REASON_SEQNO as reasonSeqNo
      ,a.REASONDESC
      ,a.APPVSTS as approveStatus
      ,to_char(a.APPVSTSBYDATE,'yyyymmdd') as approveStatusByDate
      ,a.APPVSTSBYDEPT_SEQNO as approveByDeptSeqNo
from MSCS_REPS_TM8 a
left join MSCS_REPS_PERSON c on a.TM8_SEQNO =c.TM8_SEQNO
where a.tm8_seqno =p_id  and c.personflag in ('A','M'))
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '1101',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'mananya.c',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'REPS',
                                               'ipClient' VALUE '172.22.6.42'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk
                                               ,'deptSeqNo' value deptSeqNo
                                               ,'saveUser' value 'anothai.s'
                                               ,'saveDate' value saveDate
                                               ,'saveIpClient' value '172.22.6.42'
                                               )
                                        from obj_data
                                       ),
                  'reEntryTM8Info' value (
                                           select JSON_OBJECT (
                                                                    
                                                                    'reasonSeqNo'	  value  reasonSeqNo
                                                                    ,'reasonDesc'	  value  reasonDesc
                                                                    ,'approveStatus' value approveStatus
                                                                    ,'approveStatusByDate' value approveStatusByDate
                                                                    ,'approveByDeptSeqNo' value approveByDeptSeqNo
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
  
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
      v_dml_type :='U';
      v_service_name := 'editReEntryToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delReEntryToPibics';
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
            where sender ='REPS' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
            
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
     l_temp_obj1.put('pibicsPk',i_pibicspk);
    
    
     else

    l_temp_obj1 :=l_obj.get_object('reEntryTM8Info'); 
    l_temp_obj1.put('binaryImgPerson',FN_BLOB_TO_CLOB(b_img_person));
     v_service_name := 'addReEntryToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/reps/'||v_service_name;
  
        
   PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
   v_receive_id := '';
   v_recevice_message:= null;
   if v_x_response_code =200 then
   l_obj_response :=JSON_OBJECT_T(b_x_response_message);
  
   v_recevice_message := l_obj_response.get_string('msgDesc');
    if l_obj_response.get_string('msgCode') = '0000' then
    v_receive_id :=l_obj_response.get_string('pibicsPk'); 
   end if;
   end if;
   
   p_message :=v_recevice_message;
    PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   v_dml_type,
    'ADMIN',
    'REPS',
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
   
    exception when others then
      DBMS_OUTPUT.put_line(sqlerrm);
    p_message :=sqlerrm;
  END REPS_TO_PIBICS;
  
      PROCEDURE TM2_TO_PIBICS (
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
       ,a.flightno as convRegNo
       ,a.CONVNATIONCD as convNationCode
       ,a.CONVNM as convName
       ,a.CONVOWNER as convOwner
       ,a.CONVREGNO as flightNo
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
       ,to_char(a.IODTE,'yyyymmddhh24mi') as inOutDate
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
                                               'userID' VALUE lower(saveUser),
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
       ,a.FLIGHTNO as convRegNo
       ,a.CONVNATIONCD as convNationCode
       ,a.CONVNM as convName
       ,a.CONVOWNER as convOwner
       ,a.CONVREGNO as flightNo
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
       ,to_char(sysdate,'yyyymmddhh24mi') as inOutDate
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
                                               'userID' VALUE lower(saveUser),
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
  
    select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';
  
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
  
  PROCEDURE EXT_TO_PIBICS (
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
    i_voal_seqno NUMBER;
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
if p_mode = 'A' then
WITH obj_data AS (
select 'naphaschaya.j' as saveUser,
       to_char(sysdate,'yyyymmddhh24miss') as saveDate,
       '172.22.6.13' as saveIpClient,
       b.EXTLIST_SEQNO as bioPk
      ,b.DEPT_SEQNO as deptSeqNo
      ,'N' as fineSts1 --b.fine_sts1 as fineSts1
      ,'N' as fineSts2--b.fine_sts2 as fineSts2
      ,b.FEE_STS as feeSts
      ,b.PERSON_STS as personSts
      ,case when b.PERSON_STS='C' then a.docno else '' end as docNoMaster
      ,b.DOC_NO as docNo
      ,to_char(b.EXT_DATE,'yyyymmdd') as extDate
      ,b.EXT_DAY as extDay
      ,b.REASON_SEQNO as reasonSeqNo
      ,b.REF_PERSON as refPerson
      ,b.REF_TEL as refTel
      ,c.TM6NO as tm6No
      ,c.SUFFIX_SEQNO as suffixSeqNo
      ,c.EFIRSTNM as efirstName
      ,c.EMIDDLENM as emiddleName
      ,c.EFAMILYNM as efamilyName
      ,c.SEX as sex
      ,c.BIRTH_DATE as birthDate
      ,c.BIRTH_PLACE as birthPlace
      ,d.ABBCOUNT as nationality
      ,b.OCC_SEQNO as occSeqNo
      ,b.ITEMNO as itemNo
      ,b.EXTIMG as personPic
      ,c.CPASSPORTNO as curPassportNo
      ,to_char(c.CPASSPORT_DATE,'yyyymmdd') as curPassportDate
      ,to_char(c.CPASSPORT_EXPDATE,'yyyymmdd') as curPassportExpDate
      ,c.CPASSPORT_PLACE as curPassportPlace
      ,c.OPASSPORTNO as oldPassportNo 
      ,c.OPASSPORT_PLACE as oldPassportPlace
      ,to_char(c.OPASSPORT_DATE,'yyyymmdd') as oldPassportDate
      ,to_char(c.OPASSPORT_EXPDATE,'yyyymmdd') as oldPassportExpDate
      ,b.RELATIONSHIP as relationship
      ,c.PASSPORT_PIC 
      ,to_char(c.IN_DATE,'yyyymmdd') as inDate
      ,c.CONV_SEQNO as convSeqNo
      ,c.CONVREGNO as convRegNo
      ,c.FROMCOUNT as fromCountSeqNo
      ,c.VISATYPE_SEQNO as visaTypeSeqNo
      ,to_char(b.VISA_DATE,'yyyymmdd') as visaDate
      ,to_char(b.VISA_EXPDATE,'yyyymmdd') as visaExpDate
      ,nvl(b.REASON_VISA,' ') as reasonVisa
      ,b.BUILDING as building
      ,b.ADDR as addr
      ,b.ROAD as road
      ,b.PV_SEQNO as provSeqNo
      ,b.AMP_SEQNO as ampSeqNo
      ,b.TMB_SEQNO as tmbSeqNo
      ,b.POSTCODE as postCode
      ,b.TEL as tel
      ,b.APPROVE_STS as approveSts
      ,case b.APPROVE_STS when 'A' then to_char(b.PERMIT_DATE,'yyyymmdd')
                          when 'D' then to_char(b.no_date,'yyyymmdd')
                          when 'N' then to_char(b.no_date,'yyyymmdd')
                          when 'W' then to_char(b.wait_date,'yyyymmdd')
                          else '' end  as permitDate
      ,to_char(b.OLD_PERMIT_DATE,'yyyymmdd') as oldPermitDate
      ,b.WAITCOMMENT_SEQNO as waitCommentSeqNo
      ,b.WAITCOMMENT_OTH as waitCommentOth
      ,b.COMMAND_SEQNO as commandSeqNo
      ,b.COMMAND_OTH as commandOth
      ,b.PROVE_BY as proveBy
      ,b.PROVE_ID as proveId
      ,b.APPROVE_REM as approveRemark
      ,c.STATUSEXT as statusExt
      ,to_char(c.STATUSEXTDTE,'yyyymmdd') as statusExtDte
      ,'MMC' as counterNm
      ,e.FEESLIPBOOKNO as feeSlipBookNo
      ,e.FEESLIPNO as feeSlipNo
      ,e.FEESLIPTOTAL as feeSlipAmount
      ,e.FEESREMARK as feeSlipRemark
      ,f.PRATE_SEQNO as feePRateSeqNo
      ,e.SLIPTYPE as slipType
      ,e.PRINTFLAG as feePrintFlag
from MSCS_EXT_EXTENSION a 
inner join MSCS_EXT_EXTENSIONLIST b on a.ext_seqno =b.ext_seqno
inner join MSCS_EXT_PERSON c on b.EXTPERSON_SEQNO =c.EXTPERSON_SEQNO
left join PIBICSDM2.COUNTRY d on c.NATION_SEQNO = d.COUNT_SEQNO
left join MSCS_FS_FEES e on b.FEESLIP_SEQNO =e.FEES_SEQNO
left join (select ff.FEES_SEQNO,ff.PRATE_SEQNO 
           from MSCS_FS_FEESDETAIL ff 
           group by ff.FEES_SEQNO,ff.PRATE_SEQNO ) f on f.FEES_SEQNO =e.FEES_SEQNO
left join MSCS_FS_FINES g on b.FINE_SEQNO1 =g.FINES_SEQNO
left join (select ff.FEES_SEQNO,ff.PRATE_SEQNO 
           from MSCS_FS_FEESDETAIL ff 
           group by ff.FEES_SEQNO,ff.PRATE_SEQNO ) f on f.FEES_SEQNO =e.FEES_SEQNO
where b.EXTLIST_SEQNO =p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '115',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'naphaschaya.j',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'EXT',
                                               'ipClient' VALUE '172.22.6.13'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'saveUser' VALUE saveUser,
                                               'saveDate' VALUE saveDate,
                                               'saveIpClient' VALUE saveIpClient
                                               )
                                        from obj_data
                                       ),
                    'flagInfo' value(
                                        select JSON_OBJECT (
                                               'fineSts1' VALUE fineSts1,
                                               'fineSts2' VALUE fineSts2,
                                               'feeSts' VALUE feeSts
                                               )
                                        from obj_data
                                       ),
                    'extensionListInfo' value (
                                         select JSON_OBJECT (
                                               'personSts' VALUE personSts,
                                               'docNoMaster' VALUE docNoMaster,
                                               'docNo' VALUE docNo,
                                               'extDate' VALUE extDate,
                                               'extDay' VALUE extDay,
                                               'reasonSeqNo' VALUE reasonSeqNo,
                                               'refPerson' VALUE refPerson,
                                               'refTel' VALUE refTel
                                               )
                                         from obj_data
                                          ),
                    'personInfo' value (
                                          select JSON_OBJECT (
                                               'tm6No' VALUE tm6No,
                                               'suffixSeqNo' VALUE suffixSeqNo,
                                               'efirstName' VALUE efirstName,
                                               'emiddleName' VALUE emiddleName,
                                               'efamilyName' VALUE efamilyName,
                                               'sex' VALUE sex,
                                               'birthDate' VALUE birthDate,
                                               'birthPlace' VALUE birthPlace,
                                               'nationality' VALUE nationality,
                                               'occSeqNo' VALUE occSeqNo,
                                               'itemNo' VALUE itemNo,
                                               'personPic' VALUE (
                                                                   select JSON_OBJECT (
                                                                           'fileNameImgExtImg' VALUE 'image1',
                                                                           'binaryImgExtImg' VALUE '',
                                                                           'fileSizeImgExtImg' VALUE '4'
                                                                           )
                                                                     from dual
                                                                  )
                                               )
                                         from obj_data
                                        ),
                    'passportInfo' value ( select JSON_OBJECT(
                                                 'curPassportNo' VALUE curPassportNo,
                                                 'curPassportDate' VALUE curPassportDate,
                                                 'curPassportExpDate' VALUE curPassportExpDate,
                                                 'curPassportPlace' VALUE curPassportPlace,
                                                 'oldPassportNo' VALUE oldPassportNo,
                                                 'oldPassportPlace' VALUE oldPassportPlace,
                                                  'oldPassportDate' VALUE oldPassportDate,
                                                 'oldPassportExpDate' VALUE oldPassportExpDate,
                                                  'relationship' VALUE relationship,
                                                 'passportPic' VALUE (
                                                   select JSON_OBJECT (
                                                                           'fileNameImgPassportPic' VALUE 'image1',
                                                                           'binaryImgPassportPic' VALUE '',
                                                                           'fileSizeImgPassportPic' VALUE '4'
                                                                           )
                                                                     from dual
                                                                     )
                                                 )
                                         from obj_data
                                        ),
                  'travelInfo' value ( select JSON_OBJECT(
                                                 'inDate' VALUE inDate,
                                                 'convSeqNo' VALUE convSeqNo,
                                                 'convRegNo' VALUE convRegNo,
                                                 'fromCountSeqNo' VALUE fromCountSeqNo,
                                                 'deptSeqNo' VALUE deptSeqNo,
                                                 'visaTypeSeqNo' VALUE visaTypeSeqNo,
                                                  'visaDate' VALUE visaDate,
                                                 'visaExpDate' VALUE visaExpDate,
                                                  'reasonVisa' VALUE reasonVisa
                                                 )
                                         from obj_data
                                        ),
                   'accomInfo' value ( select JSON_OBJECT(
                                                 'building' VALUE building,
                                                 'addr' VALUE addr,
                                                 'road' VALUE road,
                                                 'provSeqNo' VALUE provSeqNo,
                                                 'ampSeqNo' VALUE ampSeqNo,
                                                 'tmbSeqNo' VALUE tmbSeqNo,
                                                  'postCode' VALUE postCode,
                                                 'tel' VALUE tel
                                                 )
                                         from obj_data
                                        ),
                    'approveInfo' value ( select JSON_OBJECT(
                                                 'approveSts' VALUE approveSts,
                                                 'permitDate' VALUE permitDate,
                                                 'oldPermitDate' VALUE oldPermitDate,
                                                 'waitCommentSeqNo' VALUE waitCommentSeqNo,
                                                 'waitCommentOth' VALUE waitCommentOth,
                                                 'commandSeqNo' VALUE commandSeqNo,
                                                  'commandOth' VALUE commandOth,
                                                 'proveBy' VALUE proveBy,
                                                  'proveId' VALUE proveId,
                                                  'approveRemark' VALUE approveRemark,
                                                 'statusExt' VALUE statusExt,
                                                  'statusExtDte' VALUE statusExtDte
                                                 )
                                         from obj_data
                                        ),
                    'feeInfo' value ( select JSON_OBJECT(
                                                 'counterNm' VALUE counterNm,
                                                 'feeSlipBookNo' VALUE feeSlipBookNo,
                                                 'feeSlipNo' VALUE feeSlipNo,
                                                 'feeSlipAmount' VALUE feeSlipAmount,
                                                 'feeSlipRemark' VALUE feeSlipRemark,
                                                 'feePRateSeqNo' VALUE feePRateSeqNo,
                                                  'slipType' VALUE slipType,
                                                 'feePrintFlag' VALUE nvl(feePrintFlag,'N')
                                                 )
                                         from obj_data
                                        ),
                    'fineInfo' value ( select JSON_OBJECT(
                                                 'fineDate' VALUE '',
                                                 'fineNumber' VALUE '',
                                                 'fineRemark' VALUE '',
                                                 'fineDetailEXT' VALUE (
                                                                            select JSON_OBJECT(
                                                                           'fineDay' VALUE '',
                                                                            'fineAmount' VALUE '',
                                                                             'finePRateSeqNo' VALUE ''
                                                                           )
                                                                           from dual
                                                                        ),
                                                 'fineDetailFN' VALUE (
                                                                            select JSON_OBJECT(
                                                                           'fineDay' VALUE '',
                                                                            'fineAmount' VALUE '',
                                                                             'finePRateSeqNo' VALUE ''
                                                                           )
                                                                           from dual
                                                                        ),
                                                 'fineSlipType' VALUE '',
                                                 'finePrintFlag' VALUE ''
                                                 )
                                         from obj_data
                                        )
                                    
                   ),personPic,PASSPORT_PIC
into c_data,b_img_person,b_img_pass
from obj_data
;

end if;

if p_mode = 'E' then
WITH obj_data AS (
select 'naphaschaya.j' as saveUser,
       to_char(sysdate,'yyyymmddhh24miss') as saveDate,
       '172.22.6.13' as saveIpClient,
       b.EXTLIST_SEQNO as bioPk
      ,b.DEPT_SEQNO as deptSeqNo
      ,'N' as fineSts1 --b.fine_sts1 as fineSts1
      ,'N' as fineSts2--b.fine_sts2 as fineSts2
      ,b.FEE_STS as feeSts
      ,b.PERSON_STS as personSts
      ,case when b.PERSON_STS='C' then a.docno else '' end as docNoMaster
      ,b.DOC_NO as docNo
      ,to_char(b.EXT_DATE,'yyyymmdd') as extDate
      ,b.EXT_DAY as extDay
      ,b.REASON_SEQNO as reasonSeqNo
      ,b.REF_PERSON as refPerson
      ,b.REF_TEL as refTel
      ,c.TM6NO as tm6No
      ,c.SUFFIX_SEQNO as suffixSeqNo
      ,c.EFIRSTNM as efirstName
      ,c.EMIDDLENM as emiddleName
      ,c.EFAMILYNM as efamilyName
      ,c.SEX as sex
      ,c.BIRTH_DATE as birthDate
      ,c.BIRTH_PLACE as birthPlace
      ,d.ABBCOUNT as nationality
      ,b.OCC_SEQNO as occSeqNo
      ,b.ITEMNO as itemNo
      ,b.EXTIMG as personPic
      ,c.CPASSPORTNO as curPassportNo
      ,to_char(c.CPASSPORT_DATE,'yyyymmdd') as curPassportDate
      ,to_char(c.CPASSPORT_EXPDATE,'yyyymmdd') as curPassportExpDate
      ,c.CPASSPORT_PLACE as curPassportPlace
      ,c.OPASSPORTNO as oldPassportNo 
      ,c.OPASSPORT_PLACE as oldPassportPlace
      ,to_char(c.OPASSPORT_DATE,'yyyymmdd') as oldPassportDate
      ,to_char(c.OPASSPORT_EXPDATE,'yyyymmdd') as oldPassportExpDate
      ,b.RELATIONSHIP as relationship
      ,c.PASSPORT_PIC 
      ,to_char(c.IN_DATE,'yyyymmdd') as inDate
      ,c.CONV_SEQNO as convSeqNo
      ,c.CONVREGNO as convRegNo
      ,c.FROMCOUNT as fromCountSeqNo
      ,c.VISATYPE_SEQNO as visaTypeSeqNo
      ,to_char(b.VISA_DATE,'yyyymmdd') as visaDate
      ,to_char(b.VISA_EXPDATE,'yyyymmdd') as visaExpDate
      ,nvl(b.REASON_VISA,' ') as reasonVisa
      ,b.BUILDING as building
      ,b.ADDR as addr
      ,b.ROAD as road
      ,b.PV_SEQNO as provSeqNo
      ,b.AMP_SEQNO as ampSeqNo
      ,b.TMB_SEQNO as tmbSeqNo
      ,b.POSTCODE as postCode
      ,b.TEL as tel
      ,b.APPROVE_STS as approveSts
      ,case b.APPROVE_STS when 'A' then to_char(b.PERMIT_DATE,'yyyymmdd')
                          when 'D' then to_char(b.no_date,'yyyymmdd')
                          when 'N' then to_char(b.no_date,'yyyymmdd')
                          when 'W' then to_char(b.wait_date,'yyyymmdd')
                          else '' end  as permitDate
      ,to_char(b.OLD_PERMIT_DATE,'yyyymmdd') as oldPermitDate
      ,b.WAITCOMMENT_SEQNO as waitCommentSeqNo
      ,b.WAITCOMMENT_OTH as waitCommentOth
      ,b.COMMAND_SEQNO as commandSeqNo
      ,b.COMMAND_OTH as commandOth
      ,b.PROVE_BY as proveBy
      ,b.PROVE_ID as proveId
      ,b.APPROVE_REM as approveRemark
      ,c.STATUSEXT as statusExt
      ,to_char(c.STATUSEXTDTE,'yyyymmdd') as statusExtDte
      ,'MMC' as counterNm
      ,e.FEESLIPBOOKNO as feeSlipBookNo
      ,e.FEESLIPNO as feeSlipNo
      ,e.FEESLIPTOTAL as feeSlipAmount
      ,e.FEESREMARK as feeSlipRemark
      ,f.PRATE_SEQNO as feePRateSeqNo
      ,e.SLIPTYPE as slipType
      ,e.PRINTFLAG as feePrintFlag
from MSCS_EXT_EXTENSION a 
inner join MSCS_EXT_EXTENSIONLIST b on a.ext_seqno =b.ext_seqno
inner join MSCS_EXT_PERSON c on b.EXTPERSON_SEQNO =c.EXTPERSON_SEQNO
left join PIBICSDM2.COUNTRY d on c.NATION_SEQNO = d.COUNT_SEQNO
left join MSCS_FS_FEES e on b.FEESLIP_SEQNO =e.FEES_SEQNO
left join (select ff.FEES_SEQNO,ff.PRATE_SEQNO 
           from MSCS_FS_FEESDETAIL ff 
           group by ff.FEES_SEQNO,ff.PRATE_SEQNO ) f on f.FEES_SEQNO =e.FEES_SEQNO
left join MSCS_FS_FINES g on b.FINE_SEQNO1 =g.FINES_SEQNO
left join (select ff.FEES_SEQNO,ff.PRATE_SEQNO 
           from MSCS_FS_FEESDETAIL ff 
           group by ff.FEES_SEQNO,ff.PRATE_SEQNO ) f on f.FEES_SEQNO =e.FEES_SEQNO
where b.EXTLIST_SEQNO =p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '115',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'naphaschaya.j',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'EXT',
                                               'ipClient' VALUE '172.22.6.13'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'bioPk' VALUE bioPk,
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'saveUser' VALUE saveUser,
                                               'saveDate' VALUE saveDate,
                                               'saveIpClient' VALUE saveIpClient
                                               )
                                        from obj_data
                                       ),
                    'extensionListInfo' value (
                                         select JSON_OBJECT (
                                               'personSts' VALUE personSts,
                                               'docNoMaster' VALUE docNoMaster,
                                               'docNo' VALUE docNo,
                                               'extDate' VALUE extDate,
                                               'extDay' VALUE extDay,
                                               'reasonSeqNo' VALUE reasonSeqNo,
                                               'refPerson' VALUE refPerson,
                                               'refTel' VALUE refTel
                                               )
                                         from obj_data
                                          ),
                    'personInfo' value (
                                          select JSON_OBJECT (
                                               'tm6No' VALUE tm6No,
                                               'suffixSeqNo' VALUE suffixSeqNo,
                                               'efirstName' VALUE efirstName,
                                               'emiddleName' VALUE emiddleName,
                                               'efamilyName' VALUE efamilyName,
                                               'sex' VALUE sex,
                                               'birthDate' VALUE birthDate,
                                               'birthPlace' VALUE birthPlace,
                                               'nationality' VALUE nationality,
                                               'occSeqNo' VALUE occSeqNo,
                                               'itemNo' VALUE itemNo,
                                               'personPic' VALUE (
                                                                   select JSON_OBJECT (
                                                                           'fileNameImgExtImg' VALUE 'image1',
                                                                           'binaryImgExtImg' VALUE '',
                                                                           'fileSizeImgExtImg' VALUE '4'
                                                                           )
                                                                     from dual
                                                                  )
                                               )
                                         from obj_data
                                        ),
                    'passportInfo' value ( select JSON_OBJECT(
                                                 'curPassportNo' VALUE curPassportNo,
                                                 'curPassportDate' VALUE curPassportDate,
                                                 'curPassportExpDate' VALUE curPassportExpDate,
                                                 'curPassportPlace' VALUE curPassportPlace,
                                                 'oldPassportNo' VALUE oldPassportNo,
                                                 'oldPassportPlace' VALUE oldPassportPlace,
                                                  'oldPassportDate' VALUE oldPassportDate,
                                                 'oldPassportExpDate' VALUE oldPassportExpDate,
                                                  'relationship' VALUE relationship,
                                                 'passportPic' VALUE (
                                                   select JSON_OBJECT (
                                                                           'fileNameImgPassportPic' VALUE 'image1',
                                                                           'binaryImgPassportPic' VALUE '',
                                                                           'fileSizeImgPassportPic' VALUE '4'
                                                                           )
                                                                     from dual
                                                                     )
                                                 )
                                         from obj_data
                                        ),
                  'travelInfo' value ( select JSON_OBJECT(
                                                 'inDate' VALUE inDate,
                                                 'convSeqNo' VALUE convSeqNo,
                                                 'convRegNo' VALUE convRegNo,
                                                 'fromCountSeqNo' VALUE fromCountSeqNo,
                                                 'deptSeqNo' VALUE deptSeqNo,
                                                 'visaTypeSeqNo' VALUE visaTypeSeqNo,
                                                  'visaDate' VALUE visaDate,
                                                 'visaExpDate' VALUE visaExpDate,
                                                  'reasonVisa' VALUE reasonVisa
                                                 )
                                         from obj_data
                                        ),
                   'accomInfo' value ( select JSON_OBJECT(
                                                 'building' VALUE building,
                                                 'addr' VALUE addr,
                                                 'road' VALUE road,
                                                 'provSeqNo' VALUE provSeqNo,
                                                 'ampSeqNo' VALUE ampSeqNo,
                                                 'tmbSeqNo' VALUE tmbSeqNo,
                                                  'postCode' VALUE postCode,
                                                 'tel' VALUE tel
                                                 )
                                         from obj_data
                                        ),
                    'approveInfo' value ( select JSON_OBJECT(
                                                 'approveSts' VALUE approveSts,
                                                 'permitDate' VALUE permitDate,
                                                 'oldPermitDate' VALUE oldPermitDate,
                                                 'waitCommentSeqNo' VALUE waitCommentSeqNo,
                                                 'waitCommentOth' VALUE waitCommentOth,
                                                 'commandSeqNo' VALUE commandSeqNo,
                                                  'commandOth' VALUE commandOth,
                                                 'proveBy' VALUE proveBy,
                                                  'proveId' VALUE proveId,
                                                  'approveRemark' VALUE approveRemark,
                                                 'statusExt' VALUE statusExt,
                                                  'statusExtDte' VALUE statusExtDte
                                                 )
                                         from obj_data
                                        )
                                    
                   ),personPic,PASSPORT_PIC
into c_data,b_img_person,b_img_pass
from obj_data;
end if;

if P_MODE ='D' then
WITH obj_data AS (
select 'naphaschaya.j' as saveUser,
       to_char(sysdate,'yyyymmddhh24miss') as saveDate,
       '172.22.6.13' as saveIpClient,
       b.EXTLIST_SEQNO as bioPk
      ,b.DEPT_SEQNO as deptSeqNo
      ,b.CANCEL_REM as cancelRemark
from MSCS_EXT_EXTENSION a 
inner join MSCS_EXT_EXTENSIONLIST b on a.ext_seqno =b.ext_seqno
where b.EXTLIST_SEQNO =p_id )
select JSON_OBJECT (
                   'headerInfo' VALUE (select JSON_OBJECT (
                                               'refNo' VALUE '115',
                                               'dateTime' VALUE to_char(sysdate,'yyyy-mm-dd')||'T'||to_char(sysdate,'hh24:mi:ss')||'+07:00',
                                               'userID' VALUE 'naphaschaya.j',
                                               'systemCode' VALUE 'BIO',
                                               'module' VALUE 'EXT',
                                               'ipClient' VALUE '172.22.6.13'
                                               )
                                        from dual),
                   'recordInfo' value (
                                      select JSON_OBJECT (
                                               'deptSeqNo' VALUE deptSeqNo,
                                               'saveUser' VALUE saveUser,
                                               'saveDate' VALUE saveDate,
                                               'saveIpClient' VALUE saveIpClient
                                               )
                                        from obj_data
                                       ),
                     'cancelInfo' value (
                                      select JSON_ARRAYAGG (
                                               JSON_OBJECT(
                                               'pibicsPk' VALUE (select RECEIVER_RESPONSE_ID
                                                                     from
                                                                     dual a
                                                                     left join (
                                                                      select * from
                                                                     (
                                                                      SELECT TL.* , 
                                                                            ROW_NUMBER () OVER (PARTITION BY  TL.SENDER_OBJECT_ID
                                                                            ORDER BY TL.DML_AT DESC
                                                                            ) RN_MAX_ISSUE_DT 
                                                                            FROM  MSCS_LOG_SYNC_WEBSERVICES TL  
                                                                            where sender ='EXT' and
                                                                                 RECEIVER_RESPONSE_ID is not null and
                                                                                 SENDER_OBJECT_ID =p_id
                                                                            ) tb_max_process 
                                                                            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
                                                                    ) b on 1=1),
                                                'bioPk' VALUE bioPk
                                               )
                                               )
                                        from obj_data
                                       ),
                    'cancelRemark' value nvl(cancelRemark,' ')
                   )
into c_data
from obj_data;
end if;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  
  
 if p_mode <> 'D' then
  --Set Image Pass
  l_temp_obj1 :=l_obj.get_object('personInfo'); 
  l_temp_obj2 :=l_temp_obj1.get_object('personPic'); 
  l_temp_obj2.put('binaryImgExtImg',FN_BLOB_TO_CLOB(b_img_person));
  
  l_temp_obj1 :=l_obj.get_object('passportInfo'); 
  l_temp_obj2 :=l_temp_obj1.get_object('passportPic'); 
  l_temp_obj2.put('binaryImgPassportPic',FN_BLOB_TO_CLOB(b_img_person));

 end if;
 
  /*  select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bioservice';*/
  
  v_url :='http://172.22.6.12:8080/bioservice_uat';
   v_dml_type :='I';
    if p_mode  in ('E','D') then
     if p_mode ='E' then
     v_dml_type :='U';
      v_service_name := 'editExtensionToPibics';
     else
     v_dml_type :='D';
      v_service_name := 'delExtensionToPibics';
     end if;
    select RECEIVER_RESPONSE_ID
    into i_pibicspk
     from
     dual a
     left join (
      select * from
     (
      SELECT TL.* , 
            ROW_NUMBER () OVER (PARTITION BY  TL.SENDER_OBJECT_ID
            ORDER BY TL.DML_AT DESC
            ) RN_MAX_ISSUE_DT 
            FROM  MSCS_LOG_SYNC_WEBSERVICES TL  
            where sender ='EXT' and
                 RECEIVER_RESPONSE_ID is not null and
                 SENDER_OBJECT_ID =p_id
            ) tb_max_process 
            WHERE tb_max_process.RN_MAX_ISSUE_DT = 1
    ) b on 1=1;
     if p_mode ='E' then       
     l_temp_obj1 :=l_obj.get_object('recordInfo'); 
      l_temp_obj1.put('pibicsPk',i_pibicspk);
     end if;
     else
     v_service_name := 'addExtensionToPibics';
   end if;
     v_url :=v_url ||'/rest/isds/ext/'||v_service_name;
  
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
    'EXT',
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
   
    exception when others then
    p_message :=sqlerrm;
  END EXT_TO_PIBICS;
  
  

END PKG_ISDS;
/
