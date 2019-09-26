CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FUNCTION_CLOB_BASE64_TO_BLOB" (i_data_cl in CLOB) 
return blob is
  v_out_bl blob;
  clob_size number;
  pos number;
  charBuff varchar2(32767);
  dBuffer RAW(32767);
  v_readSize_nr number;
  v_line_nr number;
begin
  dbms_lob.createTemporary
    (v_out_bl, true, dbms_lob.call);
  v_line_nr:=greatest(65, 
                 instr(i_data_cl,chr(10)),
                 instr(i_data_cl,chr(13)));
  v_readSize_nr:=
      floor(32767/v_line_nr)*v_line_nr;
  clob_size := dbms_lob.getLength(i_data_cl);
  pos := 1;

  WHILE (pos < clob_size) LOOP
    dbms_lob.read
      (i_data_cl, v_readSize_nr, pos, charBuff);
    dBuffer := UTL_ENCODE.base64_decode
      (utl_raw.cast_to_raw(charBuff));
    dbms_lob.writeAppend
     (v_out_bl,utl_raw.length(dBuffer),dBuffer);
    pos := pos + v_readSize_nr;
  end loop;
  return v_out_bl;
END FUNCTION_CLOB_BASE64_TO_BLOB;

/
