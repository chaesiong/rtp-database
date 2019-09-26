CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROC_RUN_MANNUAL_TO_PIBICS" AS 
 json_obj json := json ();
    l_obj json_object_t;
    cur_data SYS_REFCURSOR;
    v_x_response_code VARCHAR2(5000);
    b_x_response_message CLOB;
    v_url VARCHAR2(5000);
     v_url2 VARCHAR2(5000);
   v_sender_object  VARCHAR2(5000);
   i_sender_object_id int;
   v_mode varchar2(200);
    v_method varchar2(200);
   c_data clob;
BEGIN
 
  select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='isdsretry'; 
 
open cur_data for select a.dpt_seqno
                from mscs_deportee a
                 where to_char(a.update_date,'dd/mm/yyyy') ='23/07/2019' and
                 a.actflag ='Y';
LOOP
            FETCH cur_data
            INTO i_sender_object_id;
            EXIT WHEN cur_data%NOTFOUND;
              begin
              
            
                   v_url2 := v_url||'/'||'DeporteeToPibics';
             
              select JSON_OBJECT (
                               'requestData' VALUE (select JSON_OBJECT (
                                                           'seqno' VALUE i_sender_object_id,
                                                           'mode' VALUE 'E',
                                                           'method' VALUE '1'
                                                           )
                                                    from dual)
                                                    
                                )         
                into c_data
               from dual;
            
              l_obj := JSON_OBJECT_T(c_data);
               DBMS_OUTPUT.put_line(v_url2);
                PKG_UTILS.POST(l_obj.stringify,v_url2,v_x_response_code,b_x_response_message);
                   DBMS_OUTPUT.put_line(b_x_response_message);
             exception when others then
            DBMS_OUTPUT.put_line(sqlerrm);
            END;
 END LOOP ;
CLOSE cur_data;  
    exception when others then
     null;
END PROC_RUN_MANNUAL_TO_PIBICS;
/
