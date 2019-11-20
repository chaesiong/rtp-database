CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROCEDURE1" 
(
  P_DATA IN clob 
) AS 

 l_top_obj      JSON_OBJECT_T;
  l_dept_arr     JSON_ARRAY_T;
  l_dept_obj     JSON_OBJECT_T;
  l_emp_arr      JSON_ARRAY_T;
  l_emp_obj      JSON_OBJECT_T;
  
  l_borderdocimages_obj json_list;
  l_borderdocimage_obj json;
  v_emp  varchar2(200);
   v_emp_id  varchar2(200);
   b_imgdata blob;
   c_imgdata clob;
   REQ_DATA     JSON_OBJECT_T;
PERSONS_DATA      JSON_ARRAY_T;
PERSON_DATA    JSON_OBJECT_T;
BEGIN

REQ_DATA := JSON_OBJECT_T(P_DATA);
DBMS_OUTPUT.put_line('Test');
PERSONS_DATA := REQ_DATA.get_array('personData');

--DBMS_LOB.createtemporary(c_imgdata, TRUE);
--DBMS_LOB.open(c_imgdata, DBMS_LOB.lob_readwrite);

--c_imgdata := EMPTY_CLOB();
--DBMS_LOB.CREATETEMPORARY (c_imgdata, false);

 -- dbms_lob.createtemporary(lob_loc => c_imgdata, cache => true, dur => dbms_lob.call);
 
 dbms_lob.createtemporary(c_imgdata, true);
   
FOR i IN 0 .. PERSONS_DATA.get_size - 1 LOOP
DBMS_OUTPUT.put_line('Test2');
PERSON_DATA:=TREAT(PERSONS_DATA.get(i) AS JSON_OBJECT_T);
DBMS_OUTPUT.put_line(PERSON_DATA.stringify);
 
 l_borderdocimages_obj := json_list(PERSONS_DATA.stringify); 
l_borderdocimage_obj := JSON(l_borderdocimages_obj.get(i));
    --  l_borderdocimage_obj.get('image').get_string(l_image_clob);
--c_imgdata :=PERSON_DATA.get_clob('IMGINOUT');
  l_borderdocimage_obj.get('IMGINOUT').get_string(c_imgdata);

    --    l_result_borderdocimage.image           := convert_base64_clob_to_blob(l_image_clob);
        
DBMS_OUTPUT.put_line('Test3');
DBMS_OUTPUT.put_line(c_imgdata);
DBMS_OUTPUT.put_line('Test4');

END LOOP;



       htp.prn('{"msgInfo":{"msg_code":"00","msg_desc":"'||c_imgdata||'"}}');

EXCEPTION 
WHEN OTHERS THEN ROLLBACK;
        htp.prn('{"msgInfo":{"msg_code":"99","msg_desc":"' || SQLERRM || '"}}'); 
END PROCEDURE1;
/
  GRANT EXECUTE ON "SERVAPP"."PROCEDURE1" TO "BIOSAADM";
