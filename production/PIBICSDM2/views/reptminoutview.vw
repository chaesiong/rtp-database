CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."REPTMINOUTVIEW" ("SEQNO", "TM6NO", "TDTNO", "CONVREGNO", "CARDTYPE", "TNAME", "ENAME", "SEXNM", "SEX", "BIRTHDTE", "NATIONCD", "NATIONENM", "NATIONTNM", "VISATYPECD", "VISATYPETNM", "VISATYPEENM", "DEPTCD", "DEPTTNM", "DEPTENM", "INOUTDTE", "INOUTDTE_TIME") AS 
  SELECT   seqno,
            tm6no,
            tdtno,
            DECODE (convregno, '', '-', convregno) convregno,
            DECODE (cardtype, '1', 'I', 'O') cardtype,
            tfirstnm || ' ' || tfamilynm tname,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm ename,
            DECODE (sex, 'F', 'หญิง', 'ชาย') sexnm,
            sex,
            birthdte,
            nationcd,
            get_nations (nationcd, 'E') nationenm,
            get_nations (nationcd, 'T') nationtnm,
            visatypecd,
            get_visatypes (visatypecd, 'T') visatypetnm,
            get_visatypes (visatypecd, 'E') visatypeenm,
            deptcd,
            get_departments (deptcd, 'T') depttnm,
            get_departments (deptcd, 'E') deptenm,
            TO_CHAR (inoutdte,
                     'DD/MM/YYYY HH24:MI:SS',
                     'NLS_CALENDAR=GREGORIAN')
               inoutdte,
            TO_CHAR (inoutdte, 'YYYYMMDDHH24MISS') inoutdte_time
     FROM   tminout
   UNION
   SELECT   tmrunno,
            intm6no,
            intdtno,
            DECODE (inconvregno, '', '-', inconvregno),
            'I',
            tfirstnm || ' ' || tfamilynm,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm,
            DECODE (sex, 'F', 'หญิง', 'ชาย') sexnm,
            sex,
            birthdte,
            nationcd,
            get_nations (nationcd, 'E') nationenm,
            get_nations (nationcd, 'T') nationtnm,
            invisatypecd,
            get_visatypes (invisatypecd, 'T') visatypetnm,
            get_visatypes (invisatypecd, 'E') visatypeenm,
            indeptcd,
            get_departments (indeptcd, 'T') depttnm,
            get_departments (indeptcd, 'E') deptenm,
            TO_CHAR (indte,
                     'DD/MM/YYYY HH24:MI:SS',
                     'NLS_CALENDAR=GREGORIAN')
               inoutdte,
            TO_CHAR (indte, 'YYYYMMDDHH24MISS') inoutdte_time
     FROM   tmmain
   UNION
   SELECT   tmrunno,
            outtm6no,
            outtdtno,
            DECODE (outconvregno, '', '-', outconvregno),
            'O',
            tfirstnm || ' ' || tfamilynm,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm,
            DECODE (sex, 'F', 'หญิง', 'ชาย') sexnm,
            sex,
            birthdte,
            nationcd,
            get_nations (nationcd, 'E') nationenm,
            get_nations (nationcd, 'T') nationtnm,
            outvisatypecd,
            get_visatypes (outvisatypecd, 'T') visatypetnm,
            get_visatypes (outvisatypecd, 'E') visatypeenm,
            outdeptcd,
            get_departments (outdeptcd, 'T') depttnm,
            get_departments (outdeptcd, 'E') deptenm,
            TO_CHAR (outdte,
                     'DD/MM/YYYY HH24:MI:SS',
                     'NLS_CALENDAR=GREGORIAN')
               inoutdte,
            TO_CHAR (outdte, 'YYYYMMDDHH24MISS') inoutdte_time
     FROM   tmmain ;
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."REPTMINOUTVIEW" TO "BIOSAADM";
