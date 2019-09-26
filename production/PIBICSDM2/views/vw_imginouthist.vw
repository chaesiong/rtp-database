CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_IMGINOUTHIST" ("TMRUNNO", "PERSONID", "IMGINOUT", "INOUTDTE", "IMGINOUTDTE", "INOUTDTESORT", "DEPTNAME", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "BIRTHDTE", "NATIONCD", "DEPT_SEQNO", "STATUS", "CARDTYPE", "TM6NO", "TDTNO") AS 
  SELECT seqno tmrunno,
          personid,
          imginout,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi') inoutdte,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi:ss') imginoutdte,
          inoutdte inoutdtesort,
          GET_DEPTABBFMT3 (DEPT_SEQNO) deptname,
          efamilynm,
          efirstnm,
          emiddlenm,
          sex,
          birthdte,
          nationcd,
          DEPT_SEQNO,
          status,
          cardtype,
          tm6no, 
          tdtno  
     FROM tminout
    WHERE imginout IS NOT NULL
   UNION ALL
    SELECT seqno tmrunno,
          personid,
          imginout,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi') inoutdte,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi:ss') imginoutdte,
          inoutdte inoutdtesort,
          GET_DEPTABBFMT3 (DEPT_SEQNO) deptname,
          efamilynm,
          efirstnm,
          emiddlenm,
          sex,
          birthdte,
          nationcd,
          DEPT_SEQNO,
          status,
          cardtype,
          tm6no, 
          tdtno  
     FROM tminout_ma
    WHERE imginout IS NOT NULL
   UNION ALL
   SELECT tmrunno,
          personid,
          inimg imginout,
          TO_CHAR (indte, 'dd/mm/yyyy HH24:mi') inoutdte,
          TO_CHAR (indte, 'dd/mm/yyyy HH24:mi:ss') imginoutdte,
          indte inoutdtesort,
          GET_DEPTABBFMT3 (INDEPT_SEQNO) deptname,
          efamilynm,
          efirstnm,
          emiddlenm,
          sex,
          birthdte,
          nationcd,
          INDEPT_SEQNO DEPT_SEQNO,
          INSTATUS status,
          '1' cardtype,
          intm6no tm6no, 
          intdtno tdtno
     FROM tmmain
    WHERE indte IS NOT NULL AND inimg IS NOT NULL
   UNION ALL
   SELECT tmrunno,
          personid,
          outimg imginout,
          TO_CHAR (outdte, 'dd/mm/yyyy HH24:mi') inoutdte,
          TO_CHAR (outdte, 'dd/mm/yyyy HH24:mi:ss') imginoutdte,
          outdte inoutdtesort,
          GET_DEPTABBFMT3 (OUTDEPT_SEQNO) deptname,
          efamilynm,
          efirstnm,
          emiddlenm,
          sex,
          birthdte,
          nationcd,
          OUTDEPT_SEQNO DEPT_SEQNO,
          OUTSTATUS status,
          '2' cardtype,
          outtm6no tm6no, 
          outtdtno tdtno
     FROM tmmain
    WHERE outdte IS NOT NULL AND outimg IS NOT NULL;
   COMMENT ON TABLE "PIBICSDM2"."VW_IMGINOUTHIST"  IS 'ตารางประวัติภาพถ่ายบุคคลที่เดินทางเข้าออกทั้งหมด';
