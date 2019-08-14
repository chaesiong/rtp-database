CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BORDERCONTROL"."PRC_UT_ADD_FINGERPRINTS_JSON" is

  l_blob blob;
  l_clob clob;
  l_msg varchar2(4000 char);
  l_result clob;

begin
  for i in (select * from bio_identities) loop
    l_msg := null;

    -- Get face Photo as clob and length of this
    l_blob := i.face_photo;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of face_photo is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_01 as clob and length of this
    l_blob := i.fingerprint_01;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_01 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_02 as clob and length of this
    l_blob := i.fingerprint_02;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_02 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_03 as clob and length of this
    l_blob := i.fingerprint_03;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_03 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_04 as clob and length of this
    l_blob := i.fingerprint_04;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_04 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_05 as clob and length of this
    l_blob := i.fingerprint_05;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_05 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_06 as clob and length of this
    l_blob := i.fingerprint_06;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_06 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_07 as clob and length of this
    l_blob := i.fingerprint_07;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_07 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_08 as clob and length of this
    l_blob := i.fingerprint_08;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_08 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_09 as clob and length of this
    l_blob := i.fingerprint_09;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_09 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));

    -- Get fingerprint_10 as clob and length of this
    l_blob := i.fingerprint_10;
    l_clob := pkg_abis_util.base64encode(p_blob => l_blob);
    dbms_output.put_line('length of fingerprint_10 is ' || dbms_lob.getlength(l_clob));
    dbms_lob.append(l_result, l_clob);
    dbms_output.put_line('length of manipulated clob is ' || dbms_lob.getlength(l_result));


    dbms_output.put_line('-----------------------------------------------------------------------------------------------------');
  end loop;
end;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PRC_UT_ADD_FINGERPRINTS_JSON" TO "DERMALOG_PROXY";
