CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROC_TEST_JSON" (
P_OUT OUT CLOB
) AS 
 json_obj json := json();
 l_obj JSON_OBJECT_T;
 l_temp_obj1     JSON_OBJECT_T;
 l_temp_obj2     JSON_OBJECT_T;
 l_temp_obj3     JSON_OBJECT_T;
 l_person_arr     JSON_ARRAY_T;
c_data CLOB;
c_data_person CLOB;
b_img_pass BLOB;
b_img_person BLOB;
i_voal_seqno number;
v_x_response_code VARCHAR2(5000);
b_x_response_message clob;
 d_start_date date;
v_url VARCHAR2(5000);
  PROCEDURE display (p_obj IN JSON_OBJECT_T) IS
  BEGIN
    DBMS_OUTPUT.put_line(p_obj.stringify);
  END;
BEGIN
   d_start_date := sysdate;
--//////////////////////////////////////////////////////////////////////////////////////////////////
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
where a.VOA_SEQNO=471  and
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
                                            where a.VOA_SEQNO=471)
                                            
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
                                                 'printSlip' VALUE printSlip
                                                 )
                                         from obj_data
                                        )
                   ),IMGPASS
into c_data,b_img_pass
from obj_data
;

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 -- Create a new object.
  l_obj := JSON_OBJECT_T(c_data);
  

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
   display(l_obj);
   
   v_url :='http://172.22.6.12:8080/bioservice_uat/rest/isds/voa/addVoaToPibics';
   PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
   
    PKG_UTILS.LOG_SERVICE(
   'ADMIN',
   'I',
    'ADMIN',
    'SERVAPP',
    'ADDVOATOPIBICS',
    '1',
    l_obj.stringify,
    v_x_response_code,
    b_x_response_message,
    '',
    '',
    (sysdate-d_start_date)*24*60*60 ,
    v_url
   );
 --json_obj.pretty_print ;
-- DBMS_OUTPUT.PUT_LINE(json_obj);
--P_OUT :=  c_data;     
END PROC_TEST_JSON;
/
