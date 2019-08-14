CREATE OR REPLACE EDITIONABLE TYPE "DL_BLACKLIST"."OT_BLT_SEARCH_RESULT" force authid current_user is object
(
--
-- *** ATTRIBUTES ***
--
--
--
/**
* ???
*
* PARAMETERS
*   ???
*
* EXCEPTIONS
*   ???
*
* NOTES
*   ???
*
*/
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* WWirns    16.04.2018  Added
*******************************************************************************/
--
  ID                     varchar2(32 char),
  SURNAME                varchar2(100 char),
  SURNAME_THAI           varchar2(100 char),
  MIDDLE_NAME            varchar2(100 char),
  MIDDLE_NAME_THAI       varchar2(100 char),
  GIVEN_NAME             varchar2(100 char),
  GIVEN_NAME_THAI        varchar2(100 char),
  SEX                    varchar2(32 char),
  SEX$DV                 varchar2(128 char),
  DATE_OF_BIRTH          DL_BLACKLIST.CT_PARTIAL_DATE,
  NATIONALITY            varchar2(32 char),
  NATIONALITY$DV         varchar2(128 char),
  TDT_DOC_NUMBER         varchar2(9 char),
  TDT_ISSUING_COUNTRY    varchar2(32 char),
  TDT_ISSUING_COUNTRY$DV varchar2(128 char),
  TDT_DATE_OF_EXPIRY     varchar2(6 char),
  LOCALE                 varchar2(5 char),
  ROW_NUM                integer,
  ROW_CNT                integer
--
)
not final
 alter type              "DL_BLACKLIST"."OT_BLT_SEARCH_RESULT" modify attribute TDT_DOC_NUMBER varchar2(20 char) cascade
/
