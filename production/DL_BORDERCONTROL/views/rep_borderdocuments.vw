CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" ("BRDDOCID", "IDENTITY", "DOCCLASS", "DOCTYPE_VALUE", "DOCNO", "ISSUECTRY", "ISSUECTRY_VALUE", "NAT", "NAT_VALUE", "DOB", "SEX", "SEX_VALUE", "EXPIRYDATE", "GIVENNAME", "SURNAME", "OPTIONALDATA", "AFISID", "INS_AT", "INS_BY", "INS_BY_NAME", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_TERMINAL_NAME", "INS_BORDERPOST", "INS_BORDERPOST_NAME", "OFFICER_OBSERVATION", "PASS_VISUAL_FACE", "PASS_ICAO_FACE", "PASS_VISUALPAGE", "LASTMOVEMENTLIVEPHOTO", "LANDINGCARD_PAGE", "VISA_PAGE") AS 
  select  bd.BRDDOCID
        ,i.identity
        ,bd.DOCCLASS
        ,bd.DOCTYPE                    						DOCTYPE_value
        ,bd.DOCNO
        ,bd.ISSUECTRY
        ,(SELECT nvl(display_value,display_value$dlc)
            FROM dl_common.countries$lc
           WHERE key_value = bd.ISSUECTRY)                   ISSUECTRY_value
        ,bd.NAT
        ,(SELECT nvl(display_value,display_value$dlc)
            FROM dl_common.countries$lc
           WHERE key_value = bd.nat)                         NAT_value
        ,coalesce(to_char(bd.CALC_DOB, 'YYYY-MM-DD'), 'Invalid Date - ' || bd.DOB)	DOB
        ,bd.SEX
        ,(SELECT nvl(display_value,display_value$dlc)
            FROM dl_common.human_sexes$lc
           WHERE num_value = bd.sex)                         sex_value
        ,bd.EXPIRYDATE
        ,bd.GIVENNAME
        ,bd.SURNAME
        ,bd.OPTIONALDATA
        ,bd.AFISID
        ,bd.INS_AT
        ,bd.INS_BY
        ,trim(substr(bd.INS_BY, 1, instr(bd.INS_BY,'@') - 2)) INS_BY_name
        ,bd.DML_AT
        ,bd.DML_BY
        ,bd.DML_TYPE
        ,bd.INS_TERMINAL
        ,(SELECT nvl(name,name$dlc)
            FROM dl_bordercontrol.terminals$lc
           WHERE id = bd.ins_terminal)                      INS_TERMINAL_name
        ,bd.INS_BORDERPOST
        ,(SELECT nvl(name,name$dlc)
            FROM dl_bordercontrol.borderposts$lc
           WHERE key_value = bd.ins_borderpost)             INS_BORDERPOST_name
        ,bd.OFFICER_OBSERVATION
        ,(select image
            from dl_bordercontrol.borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_VISUAL_FACE#()) as PASS_VISUAL_FACE
        ,(select image
            from dl_bordercontrol.borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_ICAO_FACE#()) as PASS_ICAO_FACE
        ,(select image
            from dl_bordercontrol.borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_VISUAL_PAGE#()) as PASS_VISUALPAGE
        ,(select dl_bordercontrol.dl_movementhandling.get_last_movement_blob(P_DOCNO => bd.docno,
                    P_EXPIRYDATE => bd.expirydate,
                    P_ISSUECTRY => issuectry,
                    P_TYPE => 'LIVE_PHOTO',
                    P_INS_BORDERPOST => null)
            from dual)  as lastmovementlivephoto
        ,(select EF.FORM_IMAGE
            from dl_bordercontrol.movements m
            join dl_bordercontrol.entry_forms ef on m.entry_form = ef.key_value
           where m.brddocid = bd.brddocid
           order by m.dml_at desc
           fetch first 1 row only) as landingcard_page
        ,(select v.visa_image
            from dl_bordercontrol.movements m
            join dl_bordercontrol.visas v on m.visa = v.key_value
           where m.brddocid = bd.brddocid
           order by m.dml_at desc
           fetch first 1 row only) as visa_page
from dl_bordercontrol.BORDERDOCUMENTS bd
left join dl_bordercontrol.identities i ON bd.brddocid = i.brddocid
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_BORDERDOCUMENTS" TO "PUNYAWII_D";
