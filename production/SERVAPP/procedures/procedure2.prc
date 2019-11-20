CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROCEDURE2" 
(
  p_borderdocimages_json IN CLOB 
) AS 



   /* l_borderdocimages_obj   JSON_LIST;
    l_borderdocimage_obj    JSON;
    l_image_clob            clob;
    */

   l_top_obj      JSON; 
  l_dept_obj     JSON;  
   IMGPHB_VAL clob;
   
    
BEGIN
 
  /*
    IF p_borderdocimages_json IS NOT NULL
    THEN
      l_borderdocimages_obj := JSON_LIST(p_borderdocimages_json);
    ELSE
      l_borderdocimages_obj := JSON_LIST();
    END IF;

    IF l_borderdocimages_obj IS NOT NULL
    THEN
      FOR i IN 1 .. l_borderdocimages_obj.count()
      LOOP

        l_borderdocimage_obj := JSON(l_borderdocimages_obj.get(i));

     
        dbms_lob.createtemporary(l_image_clob, true);
  	    l_borderdocimage_obj.get('image').get_string(l_image_clob);
         DBMS_OUTPUT.put_line('Test3');

      END LOOP;
    ELSE
    null;
    END IF;

*/
 dbms_lob.createtemporary(IMGPHB_VAL, true);
   l_top_obj := JSON(p_borderdocimages_json);
  l_dept_obj :=JSON(l_top_obj.get('recordInfo'));
  l_dept_obj.get('imgphb').get_string(IMGPHB_VAL);
  
   DBMS_OUTPUT.put_line(IMGPHB_VAL);
   
  EXCEPTION
    WHEN OTHERS
    THEN
      
      RAISE;
      
END PROCEDURE2;
/
  GRANT EXECUTE ON "SERVAPP"."PROCEDURE2" TO "BIOSAADM";
