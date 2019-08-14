CREATE OR REPLACE NONEDITIONABLE PACKAGE "SYSTEM"."HM_MAIN" is

  -- Author  : E1FMENNE
  -- Created : 23/7/2019 10:33:52
  -- Purpose : 

  /*
  Installation:
  Tables and Sequences, Main Package
  ACL Rule,
  system-Grants
  grant all on APEX_050100.WWV_FLOW_COLLECTION_MEMBERS$ to system;
  grant all on APEX_050100.WWV_FLOW_COLLECTIONS$ to system;
  grant all on dba_segments  to system;
  grant all on dba_data_files to system;
  grant all on dba_lobs to system;
  grant all on APEX_050100.WWV_FLOW_COLLECTION_MEMBERS$  to system;
  
  */

  procedure generate_testdata;
  function get_settings(p_key in varchar2) return varchar2;
  procedure go;
  procedure log(p_message in varchar2, p_data in clob);

end hm_main;
/
