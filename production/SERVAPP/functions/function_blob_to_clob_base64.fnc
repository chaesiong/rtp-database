CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FUNCTION_BLOB_TO_CLOB_BASE64" (i_bl IN BLOB) 
return clob is
  v_out_cl     CLOB;
  file_len     PLS_INTEGER;
  modulo       PLS_INTEGER;
  pieces       PLS_INTEGER;
  amt          BINARY_INTEGER      := 23808;
  buf          RAW (32767);
  buf_tx       varchar2(32767);
  pos          PLS_INTEGER         := 1;
  filepos      PLS_INTEGER         := 1;
  counter      PLS_INTEGER         := 1;
BEGIN
  DBMS_LOB.createtemporary 
     (v_out_cl, TRUE, dbms_lob.call);
  file_len := DBMS_LOB.getlength (i_bl);
  modulo := MOD (file_len, amt);
  pieces := TRUNC (file_len / amt);

  WHILE (counter <= pieces) LOOP
    DBMS_LOB.READ (i_bl, amt, filepos, buf);
    buf_tx:=utl_raw.cast_to_varchar2
       (UTL_ENCODE.base64_encode (buf));
    dbms_lob.writeappend
       (v_out_cl,length(buf_tx),buf_tx);
    filepos := counter * amt + 1;
    counter := counter + 1;
  END LOOP;

  IF (modulo <> 0) THEN
    DBMS_LOB.READ
      (i_bl, modulo, filepos, buf);
    buf_tx:=utl_raw.cast_to_varchar2
      (UTL_ENCODE.base64_encode (buf));
    dbms_lob.writeappend
      (v_out_cl,length(buf_tx),buf_tx);
  END IF;
  return TRANSLATE (v_out_cl, CHR(10)||CHR(13), '');
  END FUNCTION_BLOB_TO_CLOB_BASE64;

/
  GRANT EXECUTE ON "SERVAPP"."FUNCTION_BLOB_TO_CLOB_BASE64" TO "BIOSAADM";
