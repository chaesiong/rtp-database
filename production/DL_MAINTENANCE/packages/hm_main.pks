CREATE OR REPLACE EDITIONABLE PACKAGE "DL_MAINTENANCE"."HM_MAIN" is

  -- Author  : E1FMENNE
  -- Created : 23/7/2019 10:33:52
  -- Purpose :

  /*
  Installation:
  Tables and Sequences, Main Package
  ACL Rule,

  */
  procedure init_scheduler;
  procedure generate_testdata;
  function get_settings(p_key in varchar2) return varchar2;
  procedure go;
  procedure log(p_message in varchar2, p_data in clob);
  procedure xtest;
end hm_main;
/
