CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PLJSON_UT" as

  /*
   *
   *  E.I.Sarmas (github.com/dsnz)   2017-07-22
   *
   *  Simple unit test framework for pljson
   *
   */

  suite_id number;
  suite_name varchar2(100);
  file_name varchar2(100);
  pass_count number;
  fail_count number;
  total_count number;

  case_name varchar2(100);
  case_pass number;
  case_fail number;
  case_total number;

  INDENT_1 varchar2(10) := '  ';
  INDENT_2 varchar2(10) := '    ';

  procedure testsuite(suite_name_ varchar2, file_name_ varchar2);
  procedure testcase(case_name_ varchar2);

  procedure pass(test_name varchar2 := null);
  procedure fail(test_name varchar2 := null);

  procedure assertTrue(b boolean, test_name varchar2 := null);
  procedure assertFalse(b boolean, test_name varchar2 := null);

  procedure testsuite_report;

  procedure startup;
  procedure shutdown;

end pljson_ut;
/
