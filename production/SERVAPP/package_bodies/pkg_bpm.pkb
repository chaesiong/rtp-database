CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_BPM" AS

  PROCEDURE SEARCH_BLACKLIST_BIO (
        p_request     IN BLOB,
        p_message   OUT CLOB
    ) AS
  v_url varchar2(200);
  c_request CLOB;
  v_x_response_code VARCHAR2(5000);
  b_x_response_message CLOB;
  c_data CLOB;
  json_obj json := json ();
  l_obj json_object_t;
  l_temp_obj1 json_object_t;
  l_temp_obj2 json_object_t;
  l_temp_obj3 json_object_t;
  l_face_arr json_array_t;
  l_obj_response json_object_t;
  BEGIN
   
     WITH obj_data AS (
   SELECT *
    FROM json_table(p_request  FORMAT JSON, '$'
         COLUMNS (
			dateOfBirth      VARCHAR2  	PATH '$.demographic.dateOfBirth',
			expiryDate      VARCHAR2  	PATH '$.demographic.expiryDate',
			firstname 		VARCHAR2   	PATH '$.demographic.firstname',
		    surname 		VARCHAR2    PATH '$.demographic.surname',
			nationality   	VARCHAR2  	PATH '$.demographic.nationality',	
            passportNumber   		    VARCHAR2  	PATH '$.demographic.passportNumber',
            sex   		VARCHAR2  	PATH '$.demographic.sex',
            placeOfBirth   		VARCHAR2  	PATH '$.demographic.placeOfBirth',
            passportExpiryDate   		    VARCHAR2  	PATH '$.demographic.passportExpiryDate',
            passportIssuingCountry   		    VARCHAR2  	PATH '$.demographic.passportIssuingCountry'
        )) a)
    select JSON_OBJECT (
                   'demographic' VALUE (select JSON_OBJECT (
                                               'dateOfBirth' VALUE dateOfBirth,
                                               'expiryDate' VALUE expiryDate,
                                               'firstname' VALUE firstname,
                                               'surname' VALUE surname,
                                               'nationality' VALUE nationality,
                                               'passportNumber' VALUE passportNumber,
                                               'sex' VALUE sex,
                                               'placeOfBirth' VALUE placeOfBirth,
                                               'passportExpiryDate' VALUE passportExpiryDate,
                                               'passportIssuingCountry' VALUE passportIssuingCountry
                                               )
                                        from obj_data),
                    'biometric' VALUE ( 
                                       select JSON_OBJECT (
                                               'fingerprints' VALUE '',
                                               'faces' VALUE ''
                                               )
                                        from dual
                                       )
                      )
    into c_data
    from obj_data;
    
    l_obj := JSON_OBJECT_T(c_data);
     select CONFIG_VALUE
   into v_url
   from mscs_sys_config
   where CONFIG_NAME ='bpmservice';
   v_url := v_url||'/blacklist/search';
    PKG_UTILS.POST(l_obj.stringify,v_url,v_x_response_code,b_x_response_message);
    p_message := b_x_response_message;
    
    exception when others then
    p_message :=sqlerrm;
   
  END SEARCH_BLACKLIST_BIO;

END PKG_BPM;
/
