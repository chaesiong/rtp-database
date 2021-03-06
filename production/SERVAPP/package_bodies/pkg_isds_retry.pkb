CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_ISDS_RETRY" AS

    PROCEDURE ISDS_RETRY (
        p_sender     IN varchar2,
        p_start_date     IN varchar2,
        p_end_date    IN varchar2
    ) AS
    json_obj json := json ();
    l_obj json_object_t;
    cur_data SYS_REFCURSOR;
    v_x_response_code VARCHAR2(5000);
    b_x_response_message CLOB;
    v_url VARCHAR2(5000);
      v_url2 VARCHAR2(5000);
   v_sender_object  VARCHAR2(5000);
     v_sender_object_post  VARCHAR2(5000);
   i_sender_object_id int;
   v_mode varchar2(200);
    v_method varchar2(200);
   c_data clob;
  BEGIN
  
  if p_sender ='TM2' then
  v_url :='http://172.155.0.10:6080/ords/servapp/external/tm2_to_pibics';
  else
  select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='isdsretry'; 
  end if;
open cur_data for select a.sender_object
                   ,a.sender_object_id
                   ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                    from (
                    select a.* ,
                            ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                        from MSCS_LOG_SYNC_WEBSERVICES a
                                        where a.SENDER =p_sender
                                        and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                      
                    ) a
                    where a.rn =1
                    and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%' )
                  
/*union all
    --///////////////////////////////Extenstay
   select 'ExtensionToPibics' as  sender_object,
           to_char(a.EXTLIST_SEQNO) as sender_object_id
                   ,'A' as dml_type
                                        from MSCS_EXT_EXTENSIONLIST a
                                        where 'EXT' =p_sender
                                        and a.update_date between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                        and a.PIBICSPK is null
                                        and a.actflag <> 'C'
                                        and not EXISTS (
                                       select 1 from ( select a.sender_object
                                       ,a.sender_object_id
                                       ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                                        from (
                                        select a.* ,
                                                ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                                            from MSCS_LOG_SYNC_WEBSERVICES a
                                                            where a.SENDER =p_sender
                                                            and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                                            and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                                          
                                        ) a
                                        where a.rn =1
                                        and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%'  ))
                                        b where a.EXTLIST_SEQNO =b.sender_object_id 
                                        )
 
 union all
    --///////////////////////////////Re-Entry
   select 'ReentryToPibics' as  sender_object,
           to_char(a.TM8_SEQNO) as sender_object_id
                   ,'A' as dml_type
                                        from MSCS_REPS_TM8 a
                                        where 'REPS' =p_sender
                                        and a.update_date between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                        and a.PIBICSPK is null
                                        and a.appvsts <> 'C'
                                        and not EXISTS (
                                           select 1 from ( select a.sender_object
                                                           ,a.sender_object_id
                                                           ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                                                            from (
                                                            select a.* ,
                                                                    ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                                                                from MSCS_LOG_SYNC_WEBSERVICES a
                                                                                where a.SENDER =p_sender
                                                                                and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                                                                and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                                                              
                                                            ) a
                                                            where a.rn =1
                                                            and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%'  ))
                                        b where a.TM8_SEQNO =b.sender_object_id 
                                        )  
 union all
     --///////////////////////////////Deportee
   select 'DeporteeToPibics' as  sender_object,
           to_char(a.DPT_SEQNO) as sender_object_id
                   ,'A' as dml_type
                                        from MSCS_DEPORTEE a
                                        where 'RETH' =p_sender
                                        and a.update_date between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                        and a.PIBICSPK is null
                                        and a.actflag <> 'C'
                                        and not EXISTS (
                                       select 1 from ( select a.sender_object
                                       ,a.sender_object_id
                                       ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                                        from (
                                        select a.* ,
                                                ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                                            from MSCS_LOG_SYNC_WEBSERVICES a
                                                            where a.SENDER =p_sender
                                                            and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                                            and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                                          
                                        ) a
                                        where a.rn =1
                                        and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%'  ))
                                        b where a.DPT_SEQNO =b.sender_object_id 
                                        )                                                   
  
  union all
     --///////////////////////////////VOA
   select 'VoaToPibics' as  sender_object,
           to_char(a.VOA_SEQNO) as sender_object_id
                   ,'A' as dml_type
                                        from MSCS_VOA_VOA15 a
                                        where 'VOA' =p_sender
                                        and a.update_date between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                        and a.PIBICSPK is null
                                        and a.APPROVE <> 'C'
                                        and not EXISTS (
                                       select 1 from ( select a.sender_object
                                       ,a.sender_object_id
                                       ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                                        from (
                                        select a.* ,
                                                ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                                            from MSCS_LOG_SYNC_WEBSERVICES a
                                                            where a.SENDER =p_sender
                                                            and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                                            and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                                          
                                        ) a
                                        where a.rn =1
                                        and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%'  ))
                                        b where a.VOA_SEQNO =b.sender_object_id 
                                        )       
                                        
  union all
     --///////////////////////////////PROHIBIT
   select  case a.method when '1' then  'addProhibitOutToPibics' when '2' then 'addProhibitInToPibics' else '' end as  sender_object,
           to_char(a.PHB_SEQNO) as sender_object_id
                   ,'A' as dml_type
                                        from MSCS_PROHIBIT a
                                        where 'PHB' =p_sender
                                        and a.update_date between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                        and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                        and a.PIBICSPK is null
                                        and a.ACTFLAG <> 'C'
                                        and not EXISTS (
                                       select 1 from ( select a.sender_object
                                       ,a.sender_object_id
                                       ,case  a.dml_type when 'I' then 'A' when 'U' then 'E' else 'D' end as dml_type
                                        from (
                                        select a.* ,
                                                ROW_NUMBER() OVER (PARTITION BY a.SENDER_OBJECT_ID,a.dml_type ORDER BY a.DML_AT DESC) RN
                                                            from MSCS_LOG_SYNC_WEBSERVICES a
                                                            where a.SENDER =p_sender
                                                            and a.DML_AT between to_date(p_start_date,'dd/mm/yyyy hh24:mi:ss')
                                                            and to_date(p_end_date,'dd/mm/yyyy hh24:mi:ss') 
                                                          
                                        ) a
                                        where a.rn =1
                                        and (a.receiver_response like 'Can not%' or a.receiver_response like 'Work offline%'  ))
                                        b where a.PHB_SEQNO =b.sender_object_id 
                                        )    */
                                        ;

LOOP
            FETCH cur_data
            INTO v_sender_object,i_sender_object_id,v_mode;
            EXIT WHEN cur_data%NOTFOUND;
              DBMS_OUTPUT.put_line('test');
              begin
              if p_sender ='EXT' then
              v_sender_object_post := 'ExtensionToPibics';
              end if;
              
              if p_sender ='REPS' then
              v_sender_object_post := 'ReentryToPibics';
              end if;
              
               if p_sender ='PHB' then
              v_sender_object_post := 'PhohibitToPibics';
              end if;
              
               if p_sender ='RETH' then
              v_sender_object_post := 'DeporteeToPibics';
              end if;
              
                if p_sender ='VOA' then
              v_sender_object_post := 'VoaToPibics';
              end if;
              v_url2 := v_url||'/'||v_sender_object_post;
              
              if p_sender ='TM2' then
                v_url :='http://172.155.0.10:6080/ords/servapp/external/tm2_to_pibics';
             end if;
              if p_sender ='PHB' then
                  if v_sender_object in ('addProhibitOutToPibics','editProhibitOutToPibics','delProhibitOutToPibics')   then
                  v_method :='1';
                  end if;
                  
                   if v_sender_object in ('addProhibitInToPibics','editProhibitInToPibics','delProhibitInToPibics')   then
                  v_method :='2';
                  end if;
              end if;
              
            
              select JSON_OBJECT (
                               'requestData' VALUE (select JSON_OBJECT (
                                                           'seqno' VALUE i_sender_object_id,
                                                           'mode' VALUE v_mode,
                                                           'method' VALUE v_method
                                                           )
                                                    from dual)
                                                    
                                )         
                into c_data
               from dual;
              l_obj := JSON_OBJECT_T(c_data);
              
                PKG_UTILS.POST(l_obj.stringify,v_url2,v_x_response_code,b_x_response_message);
               -- DBMS_OUTPUT.put_line(b_x_response_message);
             exception when others then
             null;
              --DBMS_OUTPUT.put_line(sqlerrm);
            END;
 END LOOP ;
CLOSE cur_data;  
    exception when others then
    null;
    DBMS_OUTPUT.put_line(sqlerrm);
  END ISDS_RETRY;

END PKG_ISDS_RETRY;
/
  GRANT EXECUTE ON "SERVAPP"."PKG_ISDS_RETRY" TO "BIOSAADM";
