CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."CT_PARTIAL_DATE" AS OBJECT (
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
* MTheis    01.02.2019  Added
*******************************************************************************/
--
    day     NUMBER(2),
    month   NUMBER(2),
    year    NUMBER(4),
    CONSTRUCTOR FUNCTION CT_PARTIAL_DATE (day NUMBER, month NUMBER, year NUMBER)  RETURN SELF AS RESULT,
    MEMBER FUNCTION isValidDate RETURN INTEGER,
    MEMBER FUNCTION isNull RETURN INTEGER,
    MEMBER FUNCTION isEmptyDay RETURN INTEGER,
    MEMBER FUNCTION isEmptyMonth RETURN INTEGER,
    MEMBER FUNCTION isEmptyYear RETURN INTEGER,
    MEMBER FUNCTION isValidDay RETURN INTEGER,
    MEMBER FUNCTION isValidMonth RETURN INTEGER,
    MEMBER FUNCTION isValidYear RETURN INTEGER,
    MEMBER FUNCTION getDay RETURN NUMBER,
    MEMBER FUNCTION getMonth RETURN NUMBER,
    MEMBER FUNCTION getYear RETURN NUMBER,
    MEMBER FUNCTION getDate RETURN DATE    ,
    MEMBER FUNCTION getFormatData (date_format IN VARCHAR2 DEFAULT 'DD.MM.YYYY') RETURN VARCHAR2,
    ORDER MEMBER FUNCTION func_order(P_PARTIAL_DATE_ORDER CT_PARTIAL_DATE) RETURN INTEGER 
)
/
