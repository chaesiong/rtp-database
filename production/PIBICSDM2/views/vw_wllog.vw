CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLLOG" ("WLLOGID", "USERNM", "DEPTUSERID", "WLLOGDTE", "USERSTAFFNM", "DEPTUSERSTAFF", "FLAGSYSTEM", "SYSNAME", "CARDTYPE", "INOUTDTEORDOCDTE", "DEPTNAME", "TDTNO", "TM6NO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "TFAMILYNM", "TFIRSTNM", "TMIDDLENM", "SEXNM", "BIRTHDTE", "NATION", "CONVREGNO", "WLCD", "REASONNM", "MESSAGEDESC", "REMARK", "WLIMG") AS 
  SELECT wllogid,
          get_hrprofilefull (userid) usernm,
          get_deptabbfmt3 (get_hrdeptseqno (userid)) deptuserid,
          TO_CHAR (wllogdte, 'dd/mm/yyyy hh24:mi') wllogdte,
          get_hrprofilefull (userstaff) userstaffnm,
          get_deptabbfmt3 (get_hrdeptseqno (userstaff)) deptuserstaff,
          a.flagsystem,
          a.flagsystem || ' - ' || b.system_name sysname,
          DECODE (travel,
                  'I', 'ขาเข้า',
                  'O', 'ขาออก')
             cardtype,
          CASE
             WHEN flagsystem IN ('INOUT', 'CREW', 'TRNS', 'RETH')
             THEN
                TO_CHAR (inoutdte, 'dd/mm/yyyy hh24:mi')
             ELSE
                TO_CHAR (wllogdte, 'dd/mm/yyyy')
          END
             AS inoutdteordocdte,
          CASE
             WHEN dept_seqno IS NOT NULL THEN get_deptabbfmt3 (dept_seqno)
             ELSE get_DEPTABBFMT3BYDEPTCD (deptcd)
          END
             AS deptname,
          tdtno,
          tm6no,
          efamilynm,
          efirstnm,
          emiddlenm,
          tfamilynm,
          tfirstnm,
          tmiddlenm,
          DECODE ('M', 'ชาย', 'F', 'หญิง') sexnm,
          birthdte,
          get_nationnm (nationcd, 'T') nation,
          convregno,
          wlcd,
          get_blimpreasons (reasoncd) reasonnm,
          c.messagedesc,
          remark,
          wlimg
     FROM wllog a, vw_wllogsystem b, bklmessage c
    WHERE a.flagsystem = b.system_code(+) AND a.mseqno = c.mseqno(+);
