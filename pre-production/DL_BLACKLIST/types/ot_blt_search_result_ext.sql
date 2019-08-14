CREATE OR REPLACE EDITIONABLE TYPE "DL_BLACKLIST"."OT_BLT_SEARCH_RESULT_EXT" force authid current_user under OT_BLT_SEARCH_RESULT
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
* WWirns    04.05.2018  Remove unneeded feature "Variance-Groups"
*******************************************************************************/
--
  SURNAME$QRY                   varchar2(100 char),
  SURNAME$MSCORE                number(3),
  SURNAME_THAI$MSCORE           number(3),
  MIDDLE_NAME$QRY               varchar2(100 char),
  MIDDLE_NAME$MSCORE            number(3),
  MIDDLE_NAME_THAI$MSCORE       number(3),
  GIVEN_NAME$QRY                varchar2(100 char),
  GIVEN_NAME$MSCORE             number(3),
  GIVEN_NAME_THAI$MSCORE        number(3),
  SEX$QRY                       varchar2(128 char),
  SEX$MSCORE                    number(3),
  SEX$DV$MSCORE                 number(3),
  DATE_OF_BIRTH_F$QRY           DL_BLACKLIST.CT_PARTIAL_DATE,
  DATE_OF_BIRTH_T$QRY           DL_BLACKLIST.CT_PARTIAL_DATE,
  DATE_OF_BIRTH$MSCORE          number(3),
  NATIONALITY$QRY               varchar2(128 char),
  NATIONALITY$MSCORE            number(3),
  NATIONALITY$DV$MSCORE         number(3),
  TDT_DOC_NUMBER$QRY            varchar2(9 char),
  TDT_DOC_NUMBER$MSCORE         number(3),
  TDT_ISSUING_COUNTRY$QRY       varchar2(128 char),
  TDT_ISSUING_COUNTRY$MSCORE    number(3),
  TDT_ISSUING_COUNTRY$DV$MSCORE number(3),
  TDT_DATE_OF_EXPIRY_F$QRY      date,
  TDT_DATE_OF_EXPIRY_T$QRY      date,
  TDT_DATE_OF_EXPIRY$MSCORE     number(3)
--
)
not final
 alter type              "DL_BLACKLIST"."OT_BLT_SEARCH_RESULT_EXT" modify attribute TDT_DOC_NUMBER$QRY varchar2(20 char) cascade
/
