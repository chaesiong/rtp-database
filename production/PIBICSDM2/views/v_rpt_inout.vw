CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_RPT_INOUT" ("INOUTDATE", "MVMNTID", "BRDDOCID", "EXITFLG", "DOCNO", "GIVENNAME", "SURNAME", "SEX", "NAT", "NAME", "IPADDRESS", "SECONDS", "CONTINENT", "PERSON_TYPE", "VISATYPE") AS 
  SELECT TO_CHAR (Date_of_entry, 'DD-MON-YYYY') AS INOUTDATE,
          MVMNTID,
          BRDDOCID,
          EXITFLG,
          DOCNO,
          GIVENNAME,
          SURNAME,
          SEX,
          NAT,
          NAME,
          IPADDRESS,
          ROUND (DIFF_SECOND) AS SECONDS,
          CONTINENTENM AS CONTINENT,
          person_type,
          display_value AS VisaType
     FROM (SELECT row_num,
                  DATE_OF_ENTRY,
                  MVMNTID,
                  BRDDOCID,
                  EXITFLG,
                  DOCNO,
                  GIVENNAME,
                  SURNAME,
                  SEX,
                  NAT,
                  NAME,
                  IPADDRESS,
                  duration_time,
                  diff_second,
                  CONTINENTENM,
                  person_type,
                  display_value
             FROM (  SELECT ROW_NUMBER ()
                               OVER (PARTITION BY d.DOCNO ORDER BY NULL)
                               AS row_num,
                            m.DATE_OF_ENTRY,
                            m.MVMNTID,
                            m.BRDDOCID,
                            m.EXITFLG,
                            d.DOCNO,
                            d.GIVENNAME,
                            d.SURNAME,
                            d.SEX,
                            d.NAT,
                            b.NAME,
                            t.IPADDRESS,
                            m.DML_AT - m.INS_AT AS duration_time,
                              (  CAST (m.DML_AT AS DATE)
                               - CAST (m.INS_AT AS DATE))
                            * 24
                            * 60
                            * 60
                               AS diff_second,
                            cc.CONTINENTENM,
                            m.person_type,
                            VTI.display_value
                       FROM DL_BORDERCONTROL.MOVEMENTS m
                            INNER JOIN DL_BORDERCONTROL.BORDERDOCUMENTS d
                               ON m.BRDDOCID = d.BRDDOCID
                            INNER JOIN DL_BORDERCONTROL.TERMINALS t
                               ON m.INS_TERMINAL = t.ID
                            INNER JOIN DL_BORDERCONTROL.BORDERPOSTS b
                               ON t.BORDER_POST = b.KEY_VALUE
                            INNER JOIN pibicsdm2.country c
                               ON d.nat = c.abbcount
                            INNER JOIN pibicsdm2.continent cc
                               ON c.CONTINENTCD = cc.continentcd
                            INNER JOIN DL_BORDERCONTROL.VISAS vs
                               ON m.visa = vs.key_value
                            INNER JOIN DL_COMMON.VISA_TYPES vt
                               ON m.visa_type = vt.key_value
                            INNER JOIN DL_COMMON.VISA_TYPES$I18N VTI
                               ON VT.KEY_VALUE = VTI.KEY_VALUE
                      WHERE     m.SOURCE_SYSTEM = 1
                            AND m.IS_FINISHED = 'Y'
                            AND TRUNC (m.DATE_OF_ENTRY) > DATE '2018-12-11'
                            AND t.ACTIVE = 1
                            AND VT.IS_ACTIVE = 'Y'
                            AND d.DOCNO IN (SELECT DOCNO
                                              FROM (  SELECT d.DOCNO,
                                                             COUNT (*) AS cnt
                                                        FROM DL_BORDERCONTROL.MOVEMENTS m
                                                             INNER JOIN
                                                             DL_BORDERCONTROL.BORDERDOCUMENTS d
                                                                ON m.BRDDOCID =
                                                                      d.BRDDOCID
                                                       WHERE     m.SOURCE_SYSTEM =
                                                                    1
                                                             AND m.IS_FINISHED =
                                                                    'Y'
                                                             AND TRUNC (
                                                                    m.DATE_OF_ENTRY) >
                                                                    DATE '2018-12-11'
                                                    GROUP BY d.DOCNO) zz--where zz.cnt > 1
                                           )
                   ORDER BY d.DOCNO, m.DATE_OF_ENTRY) aa
            WHERE aa.row_num = 1
            )
    --WHERE diff_second > 5 AND diff_second < 90;
