CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SUFFIXBYSEQNO" (
   suffix_seqno_param NUMBER)
   RETURN VARCHAR2
IS
   suffix_desc_return   VARCHAR2 (200);
BEGIN
   BEGIN
      SELECT suffix_desc
        INTO suffix_desc_return
        FROM suffix
       WHERE suffix_seqno = suffix_seqno_param;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   RETURN suffix_desc_return;
END;
/
