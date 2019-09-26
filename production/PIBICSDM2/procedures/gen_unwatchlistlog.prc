CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."GEN_UNWATCHLISTLOG" 
IS
  tmpVar NUMBER;
  /******************************************************************************
  NAME:       GEN_UNWATCHLISTLOG
  PURPOSE:
  REVISIONS:
  Ver        Date        Author           Description
  ---------  ----------  ---------------  ------------------------------------
  1.0        5/16/2012   chatnarin.a       1. Created this procedure.
  NOTES:
  Automatically available Auto Replace Keywords:
  Object Name:     GEN_UNWATCHLISTLOG
  Sysdate:         5/16/2012
  Date and Time:   5/16/2012, 12:29:59 PM, and 5/16/2012 12:29:59 PM
  Username:        chatnarin.a (set in TOAD Options, Procedure Editor)
  Table Name:       (set in the "New PL/SQL Object" dialog)
  ******************************************************************************/
BEGIN
  DECLARE
    sysdateTxt  VARCHAR2(25);
    sysdateFile VARCHAR2(8);
    totalrows   NUMBER := 0;
    cmtrows     NUMBER := 0;
    seqno       NUMBER(20);
    nowdate DATE;
    BATCHLOGNO_SEQ NUMBER(20);
    file_ut UTL_FILE.FILE_TYPE;
    CURSOR c1
    IS
      SELECT *
      FROM watchlist
      WHERE to_number(TO_CHAR(WARREXPDTE, 'YYYYMMDD')) < to_number(TO_CHAR(sysdate, 'YYYYMMDD'))
      AND WARREXPDTE                                  IS NOT NULL;
    rec_tm c1%rowtype;
  BEGIN
    SELECT TO_CHAR(sysdate,'dd/mm/yyyy hh24:mi:ss') INTO sysdateTxt FROM dual;
    SELECT TO_CHAR(sysdate,'YYYYMMDD') INTO sysdateFile FROM dual;
    BATCHLOGNO_SEQ := BATCHLOG_SEQ.NEXTVAL;
    INSERT
    INTO BATCHLOG
      (
        BATCHLOGNO,
        BATCH_SRC,
        FILE_TYPE,
        FILE_NAME,
        FILE_SIZE,
        TOTALROW,
        PRROW,
        ERRROW,
        STARTPROCESS,
        ENDPROCESS,
        STATUS,
        CREUSR,
        CREDTE,
        TFSTATUS,
        TOTALINS,
        TOTALUPD,
        TOTALDEL,
        TRANSFERDTE
      )
      VALUES
      (
        BATCHLOGNO_SEQ,
        'BKL',
        '16',
        'ยกเลิกหมายจับ',
        NULL,
        0,
        0,
        0,
        SYSDATE,
        NULL,
        '1',
        'BKL',
        SYSDATE,
        'N',
        0,
        0,
        0,
        NULL
      );
    COMMIT;
    file_ut := UTL_FILE.FOPEN
    (
      'LOGS_DIR','log_unwatchlist'||sysdateFile||'.txt','W'
    )
    ;
    utl_file.put_line
    (
      file_ut,sysdateTxt||' Start Gen Log File .... !!!'
    )
    ;
    utl_file.fflush
    (
      file_ut
    )
    ;
    OPEN c1;
    LOOP
      FETCH c1 INTO rec_tm;
      EXIT
    WHEN c1%notfound;
      seqno   := WATCHLISTLOG_SEQ.nextval;
      nowdate := sysdate;
      INSERT
      INTO watchlistlog
        (
          wlcd,
          ownerage,
          agccont,
          agcphone,
          emgcont,
          docref,
          seclev,
          birthplace,
          addr,
          house,
          soi,
          road,
          moo,
          district,
          city,
          state,
          curzipcode,
          height,
          weight,
          haircolor,
          hair,
          face,
          build,
          eyecolor,
          complexion,
          feature,
          peculiarity,
          occcd,
          targetno,
          operref,
          ownerorg,
          warrno,
          warrdte,
          warrexpdte,
          docrefer,
          blawsno,
          rlawsno,
          penalno,
          allegecd,
          reasoncd,
          tdcd,
          creusr,
          credte,
          creorg,
          updusr,
          upddte,
          updorg,
          docdte,
          docno,
          sts,
          cause,
          birthdte,
          sex,
          nationcd,
          loguserid,
          logflag,
          logdte,
          otheragccont,
          rmk1,
          rmk2,
          rmk3,
          rmk4,
          rmkdte,
          rmkdte1,
          watchlistlogid,
          precinctcd,
          arrest,
          permitdte1,
          permitdte2,
          permit,
          rmkagccont,
          rmkarrest,
          rmkpermit,
          delremark,
          rmk11,
          rmk12,
          rmk13,
          rmkdte11,
          rmkdte12,
          rmkmore,
          reason_oth,
          reason_type_seqno,
          card_id,
          flagcheckpoint,
          cases_no
        )
        VALUES
        (
          rec_tm.wlcd,
          rec_tm.ownerage,
          rec_tm.agccont,
          rec_tm.agcphone,
          rec_tm.emgcont,
          rec_tm.docref,
          rec_tm.seclev,
          rec_tm.birthplace,
          rec_tm.addr,
          rec_tm.house,
          rec_tm.soi,
          rec_tm.road,
          rec_tm.moo,
          rec_tm.district,
          rec_tm.city,
          rec_tm.state,
          rec_tm.curzipcode,
          rec_tm.height,
          rec_tm.weight,
          rec_tm.haircolor,
          rec_tm.hair,
          rec_tm.face,
          rec_tm.build,
          rec_tm.eyecolor,
          rec_tm.complexion,
          rec_tm.feature,
          rec_tm.peculiarity,
          rec_tm.occcd,
          rec_tm.targetno,
          rec_tm.operref,
          rec_tm.ownerorg,
          rec_tm.warrno,
          rec_tm.warrdte,
          rec_tm.warrexpdte,
          rec_tm.docrefer,
          rec_tm.blawsno,
          rec_tm.rlawsno,
          rec_tm.penalno,
          rec_tm.allegecd,
          rec_tm.reasoncd,
          rec_tm.tdcd,
          rec_tm.creusr,
          rec_tm.credte,
          rec_tm.creorg,
          rec_tm.updusr,
          rec_tm.upddte,
          rec_tm.updorg,
          rec_tm.docdte,
          rec_tm.docno,
          rec_tm.sts,
          rec_tm.cause,
          rec_tm.birthdte,
          rec_tm.sex,
          rec_tm.nationcd,
          'ADMIN2',
          'D',
          nowdate,
          rec_tm.otheragccont,
          rec_tm.rmk1,
          rec_tm.rmk2,
          rec_tm.rmk3,
          rec_tm.rmk4,
          rec_tm.rmkdte,
          rec_tm.rmkdte1,
          seqno,
          rec_tm.precinctcd,
          rec_tm.arrest,
          rec_tm.permitdte1,
          rec_tm.permitdte2,
          rec_tm.permit,
          rec_tm.rmkagccont,
          rec_tm.rmkarrest,
          rec_tm.rmkpermit,
          'ลบเนื่องจากหมายจับหมดอายุความ',
          rec_tm.rmk11,
          rec_tm.rmk12,
          rec_tm.rmk13,
          rec_tm.rmkdte11,
          rec_tm.rmkdte12,
          rec_tm.rmkmore,
          rec_tm.reason_oth,
          rec_tm.reason_type_seqno,
          rec_tm.card_id,
          rec_tm.flagcheckpoint,
          rec_tm.cases_no
        );
      DELETE
      FROM watchlist
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwl_loop>> FOR itemwl IN
      ( SELECT b.* FROM watchlistnm b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WATCHLISTNMLOG
          (
            WLCD,
            SEQNO,
            WLTLASTNM,
            WLTFIRSTNM,
            WLTMIDDLENM,
            WLELASTNM,
            WLEMIDDLENM,
            WLEFIRSTNM,
            EFSNDXNM,
            EMSNDXNM,
            ELSNDXNM,
            NATIONCD,
            BIRTHDTE,
            LOGUSERID,
            LOGFLAG,
            LOGDTE,
            TFSNDXNM,
            TMSNDXNM,
            TLSNDXNM,
            WATCHLISTNMLOGID,
            WATCHLISTLOGID
          )
          VALUES
          (
            itemwl.WLCD ,
            itemwl.SEQNO ,
            itemwl.WLTLASTNM ,
            itemwl.WLTFIRSTNM ,
            itemwl.WLTMIDDLENM ,
            itemwl.WLELASTNM ,
            itemwl.WLEMIDDLENM ,
            itemwl.WLEFIRSTNM ,
            itemwl.EFSNDXNM ,
            itemwl.EMSNDXNM ,
            itemwl.ELSNDXNM ,
            itemwl.NATIONCD ,
            itemwl.BIRTHDTE ,
            'ADMIN2' ,
            'D' ,
            nowdate ,
            itemwl.TFSNDXNM ,
            itemwl.TMSNDXNM ,
            itemwl.TLSNDXNM ,
            WATCHLISTNMLOG_SEQ.nextval ,
            seqno
          );
      END LOOP;--Loop For itemwl
      DELETE
      FROM watchlistnm
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwlcard_loop>> FOR itemwlcard IN
      ( SELECT b.* FROM WLINDICATECARD b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO PIBICS.WLINDICATECARDLOG
          (
            WLCD,
            SEQNO,
            IDCCD,
            DOCNO,
            ISUDTE,
            ISUPLACE,
            LOGUSERID,
            LOGFLAG,
            LOGDTE,
            WLINDICATECARDLOGID,
            WATCHLISTLOGID
          )
          VALUES
          (
            itemwlcard.WLCD ,
            itemwlcard.SEQNO ,
            itemwlcard.IDCCD ,
            itemwlcard.DOCNO ,
            itemwlcard.ISUDTE ,
            itemwlcard.ISUPLACE ,
            'ADMIN2' ,
            'D' ,
            nowdate ,
            WLINDICATECARDLOG_SEQ.nextval ,
            seqno
          );
      END LOOP;--Loop For itemwlcard
      DELETE
      FROM WLINDICATECARD
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwlrela_loop>> FOR itemwlrela IN
      ( SELECT b.* FROM WLRELATION b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WLRELATIONLOG
          (
            WLCD,
            SEQNO,
            RELATION,
            ARFIRSTNM,
            ARLASTNM,
            ARMIDDLENM,
            REMK,
            LOGUSERID,
            LOGFLAG,
            LOGDTE,
            WLRELATIONLOGID,
            WATCHLISTLOGID
          )
          VALUES
          (
            itemwlrela.WLCD ,
            itemwlrela.SEQNO ,
            itemwlrela.RELATION ,
            itemwlrela.ARFIRSTNM ,
            itemwlrela.ARLASTNM ,
            itemwlrela.ARMIDDLENM ,
            itemwlrela.REMK ,
            'ADMIN2' ,
            'D' ,
            nowdate ,
            WLRELATIONLOG_SEQ.nextval ,
            seqno
          );
      END LOOP;--Loop For itemwlrela
      DELETE
      FROM WLRELATION
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwlch_loop>> FOR itemwlch IN
      ( SELECT b.* FROM WLCHARGE b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WLCHARGELOG
          (
            WLCD,
            SEQNO,
            CHARGE_CODE,
            LOGUSERID,
            LOGFLAG,
            LOGDTE,
            WLCHARGELOGID,
            WATCHLISTLOGID
          )
          VALUES
          (
            itemwlch.WLCD ,
            itemwlch.SEQNO ,
            itemwlch.CHARGE_CODE ,
            'ADMIN2' ,
            'D' ,
            nowdate ,
            WLCHARGELOG_SEQ.nextval ,
            seqno
          );
      END LOOP;--Loop For itemwlch
      DELETE
      FROM WLCHARGE
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwlpic_loop>> FOR itemwlpic IN
      ( SELECT b.* FROM WATCHLISTPIC b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WATCHLISTPICLOG
          (
            WLCD,
            SEQNO,
            WLPIC,
            WATCHLISTLOGID,
            WATCHLISTPICLOGID,
            LOGFLAG,
            LOGUSERID,
            LOGDTE
          )
          VALUES
          (
            itemwlpic.WLCD ,
            itemwlpic.SEQNO ,
            itemwlpic.WLPIC ,
            seqno ,
            WATCHLISTPICLOG_SEQ.nextval ,
            'D' ,
            'ADMIN2' ,
            nowdate
          );
      END LOOP;--Loop For itemwlpic
      DELETE
      FROM WATCHLISTPIC
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwldoc_loop>> FOR itemwldoc IN
      ( SELECT b.* FROM WATCHLISTDOC b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WATCHLISTDOCLOG
          (
            WLCD,
            SEQNO,
            WLDOCNM,
            WATCHLISTLOGID,
            WATCHLISTDOCLOGID,
            LOGUSERID,
            LOGFLAG,
            LOGDTE
          )
          VALUES
          (
            itemwldoc.WLCD ,
            itemwldoc.SEQNO ,
            itemwldoc.WLDOCNM ,
            seqno ,
            WATCHLISTDOCLOG_SEQ.nextval ,
            'ADMIN2' ,
            'D' ,
            nowdate
          );
      END LOOP;--Loop For itemwldoc
      DELETE
      FROM WATCHLISTDOC
      WHERE wlcd = rec_tm.wlcd;
                 <<itemwlremark_loop>> FOR itemwlremark IN
      ( SELECT b.* FROM WLREMARK b WHERE wlcd = rec_tm.wlcd
      )
      LOOP
        INSERT
        INTO WLREMARKLOG
          (
            WLCD,
            SEQNO,
            REMK,
            LOGUSERID,
            LOGFLAG,
            LOGDTE,
            WLREMARKLOGID,
            WATCHLISTLOGID
          )
          VALUES
          (
            itemwlremark.WLCD ,
            itemwlremark.SEQNO ,
            itemwlremark.REMK ,
            'ADMIN2' ,
            'D' ,
            nowdate ,
            WLREMARKLOG_SEQ.nextval ,
            seqno
          );
      END LOOP;--Loop For itemwlremark
      DELETE FROM WLREMARK WHERE wlcd = rec_tm.wlcd;
      totalrows :=totalrows+1;
      cmtrows   :=cmtrows  +1;
      IF cmtrows = 100 THEN
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        COMMIT;
        cmtrows:=0;
      END IF;
    END LOOP; --cursor
    CLOSE c1;
    /*
    update watchlistnm set nationcd = 'T03' where wlcd in (
    select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd 
    and a.wlcd like 'W%' and nationcd is null and flagcheckpoint is null and length(b.docno) = 13);

    update watchlist set nationcd = 'T03' where wlcd in (
    select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd 
    and a.wlcd like 'W%' and nationcd is null and flagcheckpoint is null and length(b.docno) = 13);
    */
    
    UPDATE BATCHLOG
    SET TOTALROW     = totalrows,
      PRROW          = totalrows,
      ENDPROCESS     = sysdate,
      STATUS         = '0',
      TFSTATUS       = 'Y',
      TOTALDEL       = totalrows
    WHERE BATCHLOGNO = BATCHLOGNO_SEQ;
    COMMIT;
    utl_file.put_line(file_ut,'total record Gen Log :'||totalrows);
    utl_file.fflush(file_ut);
    SELECT TO_CHAR(sysdate,'dd/mm/yyyy hh24:mi:ss') INTO sysdateTxt FROM dual;
    utl_file.put_line(file_ut,sysdateTxt||' End Gen Log File .... !!!');
    utl_file.fflush(file_ut);
    utl_file.fclose(file_ut);
    -- Exception
    -- when others then
    --    null;--prompt(sqlerrm||'[Re-Gen Error]');
  END;
END;
/
