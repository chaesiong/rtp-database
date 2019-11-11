CREATE OR REPLACE NONEDITIONABLE PACKAGE "DL_MAINTENANCE"."HM_MAIL" is
  c_mime_boundary constant varchar2(256) := '-----AABCDEFBBCCC0123456789DE';
 procedure process_mail(p_arr            in apex_application_global.vc_arr2,
                         p_overall_status in varchar2,
                         p_num_errors     number);

 FUNCTION encode_base64(p_blob_in IN BLOB) RETURN CLOB;
 FUNCTION decode_base64(p_clob_in IN CLOB) RETURN BLOB;

end HM_MAIL;
/
