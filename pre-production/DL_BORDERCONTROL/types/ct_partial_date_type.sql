CREATE OR REPLACE EDITIONABLE TYPE "DL_BORDERCONTROL"."CT_PARTIAL_DATE_TYPE" AS OBJECT (
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
* MSCS      06.05.2019  Added for DL_BORDERCONTROL with a different name
*******************************************************************************/
--
    day     NUMBER(2),
    month   NUMBER(2),
    year    NUMBER(4),
    CONSTRUCTOR FUNCTION CT_PARTIAL_DATE_TYPE (day NUMBER, month NUMBER, year NUMBER)  RETURN SELF AS RESULT,
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
    ORDER MEMBER FUNCTION func_order(P_PARTIAL_DATE_ORDER CT_PARTIAL_DATE_TYPE) RETURN INTEGER 
)
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_BORDERCONTROL"."CT_PARTIAL_DATE_TYPE" AS 
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
* M.Bock    06.05.2019  Changed member function to return NULL if all date parts
*                       are NULL, otherwise replace NULL with zero in up to two
*                       parts.
* MTheis    01.02.2019  Added
* MSCS      06.05.2019  Re-using CT_PARTIAL_DATE Column Type logic from 
*                       DL_BLACKLIST for DL_BORDERCONTROL. Using new type for 
*                       less interference.
*******************************************************************************/
--
    CONSTRUCTOR FUNCTION CT_PARTIAL_DATE_TYPE (day NUMBER, month NUMBER, year NUMBER)  RETURN SELF AS RESULT
    IS
    BEGIN
        SELF.day := day;
        SELF.month := month;
        SELF.year := year;
    RETURN;
    END;


MEMBER FUNCTION getFormatData (  date_format IN VARCHAR2 DEFAULT 'DD.MM.YYYY'
    ) RETURN VARCHAR2 AS
        l_day NUMBER := coalesce(DAY, 0);
        l_month NUMBER := coalesce (MONTH, 0);
        l_year NUMBER := coalesce (YEAR, 0);
      BEGIN
        IF
            DAY IS NULL AND MONTH IS NULL AND YEAR IS NULL
        THEN
            RETURN NULL;
        ELSE
            CASE date_format
            WHEN 'DD.MM.YY' THEN
                 RETURN  trim( trim( to_char(l_day,'00'))) || '.' ||  trim( to_char(l_month,'00')) || '.' || substr(to_char(l_year,'0000'),4,2);
            WHEN 'DD.MM.YYYY' THEN
                 RETURN  trim( trim( to_char(l_day,'00'))) || '.' ||  trim( to_char(l_month,'00')) || '.' || trim( to_char(l_year,'0000'));
            WHEN 'DD/MM/YYYY' THEN
                 RETURN trim( to_char(l_day,'00')) || '/' ||  trim( to_char(l_month,'00')) || '/' || trim( to_char(l_year,'0000'));
            WHEN 'DD-MM-YYYY' THEN
                 RETURN trim( to_char(l_day,'00')) || '-' ||  trim( to_char(l_month,'00')) || '-' || trim( to_char(l_year,'0000'));
            WHEN 'YYYY.MM.DD' THEN
                 RETURN  trim( to_char(l_year,'0000')) || '.' ||  trim( to_char(l_month,'00')) || '.' || trim( to_char(l_day,'00'));
            WHEN 'YYYY/MM/DD' THEN
                 RETURN  trim( to_char(l_year,'0000')) || '/' ||  trim( to_char(l_month,'00')) || '/' || trim( to_char(l_day,'00'));
            WHEN 'YYYY-MM-DD' THEN
                 RETURN  trim( to_char(l_year,'0000')) || '-' || trim( to_char(l_month,'00')) || '-' || trim( to_char(l_day,'00'));
            WHEN 'YYMMDD' THEN
                 RETURN  trim( substr(to_char(l_year,'0000'), -2, 2)) || trim( to_char(l_month,'00')) || trim( to_char(l_day,'00'));
            ELSE
                RETURN  trim( to_char(l_year,'0000')) || '/' || trim( to_char(l_month,'00')) || '/' || trim( to_char(l_day,'00'));
            END CASE;
        END IF;
    END;

    MEMBER FUNCTION isValidDate RETURN INTEGER AS
        BEGIN

        IF TO_DATE(day ||'.'|| month||'.'||year, 'DD.MM.YYYY') IS NULL THEN
               RETURN 0;
            ELSE
               RETURN 1;
        END IF;
            Exception WHEN OTHERS THEN
        RETURN 0;
    END;

    MEMBER FUNCTION isNull RETURN INTEGER AS
        BEGIN

        IF isEmptyDay = 1 and isEmptyMonth = 1 and isEmptyYear = 1 THEN
               RETURN 1;
            ELSE
               RETURN 0;
        END IF;
            Exception WHEN OTHERS THEN
        RETURN 0;
    END;

    MEMBER FUNCTION isEmptyDay RETURN INTEGER AS
    BEGIN
        IF day = 0 or day is NULL THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION isEmptyMonth RETURN INTEGER AS
    BEGIN
        IF month = 0 or month is NULL THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION isEmptyYear RETURN INTEGER AS
    BEGIN
        IF year = 0 or year is NULL THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION isValidDay RETURN INTEGER AS
    BEGIN
        IF day > 0 and day <=31 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION isValidMonth RETURN INTEGER AS
    BEGIN
        IF month > 0 and month <=12 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION isValidYear RETURN INTEGER AS
    BEGIN
        IF year > 1900 and year <=2099 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;

    MEMBER FUNCTION getDay RETURN NUMBER AS
    BEGIN
        IF day is NULL THEN
            RETURN 0;
        ELSE
            RETURN day;
        END IF;
    END;

    MEMBER FUNCTION getMonth RETURN NUMBER AS
    BEGIN
        IF month is NULL THEN
            RETURN 0;
        ELSE
            RETURN month;
        END IF;
    END;

    MEMBER FUNCTION getYear RETURN NUMBER AS
    BEGIN
        IF year is NULL THEN
            RETURN 0;
        ELSE
            RETURN YEAR;
        END IF;
    END;

    MEMBER FUNCTION getDate RETURN DATE AS
    BEGIN
        RETURN TO_DATE(day ||'.'|| month||'.'||year, 'DD.MM.YYYY');
    Exception WHEN OTHERS THEN
        RETURN NULL;
    END;

    -- Order by definieren

    ORDER MEMBER FUNCTION func_order(P_PARTIAL_DATE_ORDER CT_PARTIAL_DATE_TYPE) RETURN INTEGER IS

    BEGIN
      IF P_PARTIAL_DATE_ORDER.day=self.day AND
         P_PARTIAL_DATE_ORDER.month=self.month AND
         P_PARTIAL_DATE_ORDER.year=self.year
         THEN
         RETURN 0;

      ELSIF P_PARTIAL_DATE_ORDER.day< self.day AND
            P_PARTIAL_DATE_ORDER.month< self.month AND
            P_PARTIAL_DATE_ORDER.year< self.year THEN
            RETURN 1;

      ELSIF P_PARTIAL_DATE_ORDER.day >self.day AND
            P_PARTIAL_DATE_ORDER.month >self.month AND
            P_PARTIAL_DATE_ORDER.year >self.year THEN
            RETURN -1;
      END IF;

    END;
END;
--
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."CT_PARTIAL_DATE_TYPE" TO PUBLIC;
