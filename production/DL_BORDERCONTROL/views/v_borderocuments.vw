CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_BORDEROCUMENTS" ("BRDDOCID", "DOCTYPE", "DOCNO", "ISSUECTRY", "NAT", "DOB", "DOB_PARTIAL", "SEX", "EXPIRYDATE", "GIVENNAME", "SURNAME", "MIDDLENAME", "GIVENNAME_THAI", "SURNAME_THAI", "MIDDLENAME_THAI", "OPTIONALDATA", "AFISID", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_BORDERPOST", "OFFICER_OBSERVATION", "MANUAL_EXPIRY_DATE", "DOCCLASS", "PASS_VISUAL_FACE", "PASS_ICAO_FACE", "PASS_VISUALPAGE", "PASS_UVPAGE", "PASS_IRPAGE", "PASS_DG3_0", "PASS_DG3_1") AS 
  select bd.BRDDOCID
        ,bd.DOCTYPE
        ,bd.DOCNO
        ,bd.ISSUECTRY
        ,bd.NAT
        ,bd.DOB
        ,bd.DOB_PARTIAL
        ,bd.SEX
        ,bd.EXPIRYDATE
        ,bd.GIVENNAME
        ,bd.SURNAME
        ,bd.MIDDLENAME
        ,bd.GIVENNAME_THAI
        ,bd.SURNAME_THAI
        ,bd.MIDDLENAME_THAI      
        ,bd.OPTIONALDATA
        ,bd.AFISID
        ,bd.INS_AT
        ,bd.INS_BY
        ,bd.DML_AT
        ,bd.DML_BY
        ,bd.DML_TYPE
        ,bd.INS_TERMINAL
        ,bd.INS_BORDERPOST
        ,bd.OFFICER_OBSERVATION
        ,bd.MANUAL_EXPIRY_DATE
        ,bd.DOCCLASS
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_VISUAL_FACE#()) as PASS_VISUAL_FACE
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_ICAO_FACE#()) as PASS_ICAO_FACE
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_VISUAL_PAGE#()) as PASS_VISUALPAGE
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_UV_PAGE#()) as PASS_UVPAGE
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_IR_PAGE#()) as PASS_IRPAGE
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_DG3_0#()) as PASS_DG3_0
        ,(select image
            from borderdocimages bdi
           where bdi.brddocid = bd.brddocid
             and seqno = DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.Get_IMG_SEQ_DG3_1#()) as PASS_DG3_1
    from BORDERDOCUMENTS bd;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_BORDEROCUMENTS" TO "APPSUP";
