CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."REPTMMAINVIEW" ("TMRUNNO", "TNAME", "ENAME", "SEXNM", "SEX", "NATIONCD", "NATIONTNM", "NATIONENM", "BIRTHDTE", "INTDTNO", "INTM6NO", "INCONVREGNO", "OUTTDTNO", "OUTTM6NO", "OUTCONVREGNO", "OUTDEPTCD", "OUTDEPTTNM", "OUTDEPTENM", "INDEPTCD", "INDEPTTNM", "INDEPTENM", "INDTE", "INDTE_TIME", "OUTDTE", "OUTDTE_TIME") AS 
  SELECT   TO_NUMBER (tmrunno) tmrunno,
            tfirstnm || ' ' || tmiddlenm || ' ' || tfamilynm tname,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm ename,
            DECODE (sex, 'F', 'หญิง', 'ชาย') sexnm,
            sex,
            nationcd,
            get_nations (nationcd, 'T') nationtnm,
            get_nations (nationcd, 'E') nationenm,
            birthdte,
            intdtno,
            intm6no,
            DECODE (inconvregno, NULL, '-', inconvregno) inconvregno,
            outtdtno,
            outtm6no,
            DECODE (outconvregno, NULL, '-', outconvregno) outconvregno,
            DECODE (outdeptcd, NULL, 'N/A', outdeptcd) outdeptcd,
            get_Departments (outdeptcd, 'T') outdepttnm,
            get_Departments (outdeptcd, 'E') outdeptenm,
            DECODE (indeptcd, NULL, 'N/A', indeptcd) indeptcd,
            get_departments (indeptcd, 'T') indepttnm,
            get_departments (indeptcd, 'E') indeptenm,
            TO_CHAR (indte,
                     'DD/MM/YYYY HH24:MI:SS',
                     'NLS_CALENDAR=GREGORIAN')
               indte,
            TO_CHAR (indte, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=GREGORIAN')
               indte_time,
            TO_CHAR (outdte,
                     'DD/MM/YYYY HH24:MI:SS',
                     'NLS_CALENDAR=GREGORIAN')
               outdte,
            TO_CHAR (outdte, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=GREGORIAN')
               outdte_time
     FROM   tmmain ;