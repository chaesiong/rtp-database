CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_IMGPASSHIST" ("IMMHISTSEQNO", "PERSONID", "TDTNO", "IMGPASS", "INOUTDTESORT", "INOUTDTE", "FLAGTABLE") AS 
  SELECT immhistseqno,
          personid,
          tdtno,
          imgpass,
          inoutdte inoutdtesort,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi:ss') inoutdte,
          'IMMHIST' flagtable
     FROM immigrationhist
    WHERE imgpass IS NOT NULL
   UNION ALL
   SELECT PERSONID immhistseqno,
          personid,
          tdtno,
          imgpass,
          inoutdte inoutdtesort,
          TO_CHAR (inoutdte, 'dd/mm/yyyy HH24:mi:ss') inoutdte,
          'IMM' flagtable
     FROM immigration
    WHERE imgpass IS NOT NULL;
   COMMENT ON TABLE "PIBICSDM2"."VW_IMGPASSHIST"  IS 'ตารางประวัติภาพถ่ายหนังสือเดินทางเข้าออกทั้งหมด';
