CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMM_TEST3" IS
tmpVar NUMBER;
tdtnoOld varchar(10);
tdtnoNew varchar(10);
BEGIN
tdtnoOld := 'B876125';
tdtnoNew := 'AA3318682';
declare
    cursor c_passtmp is select * from (select tdtnoNew TDTNO,'' FLAG,'' STATUS,'' UPDATE_DELETE from dual);--TESTPASSTEMP WHERE STATUS IS NULL;
    --cursor c_passtmp is select * from TESTPASSTEMP WHERE tdtno in ('AA1005687','AA1014304','AA1060486','AA1046022');
    rec_passtmp c_passtmp%rowtype;
    foundData varchar(1);

    BEGIN
        foundData := 'N';
        
        open c_passtmp;
        loop fetch c_passtmp into rec_passtmp; exit when c_passtmp%notfound; 
                FOR rec_imm IN (select * from immigration where tdtno = rec_passtmp.TDTNO and nationcd = 'T03' and imgpass is not null and rownum = 1)
                LOOP
                    IF rec_passtmp.FLAG = '1' THEN --Case ที่ภาพเสีย
                        UPDATE IMMIGRATION  SET IMGPASS = NULL WHERE  personid = rec_imm.personid AND TDTNO = rec_imm.TDTNO;
                        COMMIT;
                            
                        UPDATE TESTPASSTEMP SET STATUS = 'Y' , UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                        COMMIT;
                    ELSIF rec_passtmp.FLAG IS NULL THEN --Case ที่ภาพไม่ตรง
                        FOR rec_tmonline IN (select * from (select * from vw_tmonline where personid = rec_imm.personid order by inoutdate desc) where rownum = 1)
                        --FOR rec_tmonline IN (select * from (select * from vw_tmonline where personid = rec_imm.personid and length(tdtno) = 7 and tdtno <> tdtnoNew  order by inoutdate desc) where rownum = 1)
                        LOOP
                            foundData := 'Y';
                            --dbms_output.put_line('foundData : '||foundData);
                            /*IF rec_tmonline.tdtno IS NOT NULL THEN*/
                            --Update TDTNO อันล่าสุดให้เป็นเลขเดิมก่อน
                                /*UPDATE IMMIGRATIONHIST SET TDTNO = tdtnoOld WHERE IMMHISTSEQNO = (SELECT IMMHISTSEQNO FROM(SELECT * FROM IMMIGRATIONHIST WHERE PERSONID = rec_imm.personid ORDER BY INOUTDTE DESC) WHERE ROWNUM=1); 
                                COMMIT;*/
                                
                            --ย้ายข้อมูลไปไว้ที่ hist แล้วอัพเดตค่าที่ imm เป็น tdtno ใหม่
                                INSERT INTO IMMIGRATIONHIST (IMMHISTSEQNO, PERSONID, TM6NO, INOUTDTE, CARDTYPE,
                                TFAMILYNM, TFIRSTNM, TMIDDLENM, EFAMILYNM, EFIRSTNM, EMIDDLENM, SEX, BIRTHDTE, NATIONCD, TDTNO, PASSPORTDTE, 
                                PASSPORTEXPDTE, VISATYPECD, VISAEXPDTE, DEPTCD, IMGPASS, UPDUSR, UPDDTE, COUNT_SEQNO, VISATYPE_SEQNO, DEPT_SEQNO)
                                VALUES(IMMHISTSEQNO.nextval, rec_tmonline.PERSONID,rec_tmonline.TM6NO,rec_tmonline.INOUTDATE,rec_tmonline.CARDTYPE,
                                rec_tmonline.TFAMILYNM,rec_tmonline.TFIRSTNM, rec_tmonline.TMIDDLENM,rec_tmonline.EFAMILYNM,rec_tmonline.EFIRSTNM,
                                rec_tmonline.EMIDDLENM,rec_tmonline.SEX,rec_tmonline.BIRTHDTE,rec_tmonline.NATIONCD,tdtnoOld,rec_tmonline.PASSPORTDTE,
                                rec_tmonline.PASSPORTEXPDTE,rec_tmonline.VISATYPECD, rec_tmonline.VISAEXPDTE,rec_tmonline.DEPTCD,
                                (SELECT IMGPASS FROM IMMIGRATION WHERE personid=rec_imm.personid AND ROWNUM=1),rec_tmonline.UPDUSR,rec_tmonline.UPDDTE,rec_tmonline.COUNT_SEQNO,
                                rec_tmonline.VISATYPE_SEQNO,rec_tmonline.DEPT_SEQNO);
                                COMMIT;
                               
                                --Update ที่ imm ให้รูป pass เป็น null
                                UPDATE IMMIGRATION  SET IMGPASS = NULL ,TDTNO = tdtnoNew WHERE  personid = rec_imm.personid;-- AND TDTNO = rec_imm.TDTNO;
                                COMMIT;
                                
                                UPDATE TESTPASSTEMP SET STATUS = 'Y', UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                                COMMIT;
                            /*ELSIF rec_tmonline.tdtno IS NULL THEN
                                UPDATE IMMIGRATION  SET IMGPASS = NULL WHERE  personid = rec_imm.personid AND TDTNO = rec_imm.TDTNO;
                                --COMMIT;
                                    
                                UPDATE TESTPASSTEMP SET STATUS = 'Y' , UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                                COMMIT;*/
                            /*END IF;*/
                        END LOOP;
                        IF foundData = 'N' THEN
                            FOR rec_tmonlineCase2 IN (select * from (select * from vw_tmonline where TFAMILYNM = rec_imm.TFAMILYNM AND TFIRSTNM = rec_imm.TFIRSTNM AND NATIONCD = rec_imm.NATIONCD AND BIRTHDTE = rec_imm.BIRTHDTE /*and length(tdtno) = 7*/ and tdtno <> rec_passtmp.TDTNO order by inoutdate desc) where rownum = 1)
                            LOOP
                                --IF rec_tmonlineCase2.tdtno IS NOT NULL THEN
                                    INSERT INTO IMMIGRATIONHIST (IMMHISTSEQNO, PERSONID, TM6NO, INOUTDTE, CARDTYPE,
                                    TFAMILYNM, TFIRSTNM, TMIDDLENM, EFAMILYNM, EFIRSTNM, EMIDDLENM, SEX, BIRTHDTE, NATIONCD, TDTNO, PASSPORTDTE, 
                                    PASSPORTEXPDTE, VISATYPECD, VISAEXPDTE, DEPTCD, IMGPASS, UPDUSR, UPDDTE, COUNT_SEQNO, VISATYPE_SEQNO, DEPT_SEQNO)
                                    VALUES(IMMHISTSEQNO.nextval, rec_tmonlineCase2.PERSONID,rec_tmonlineCase2.TM6NO,rec_tmonlineCase2.INOUTDATE,rec_tmonlineCase2.CARDTYPE,
                                    rec_tmonlineCase2.TFAMILYNM,rec_tmonlineCase2.TFIRSTNM, rec_tmonlineCase2.TMIDDLENM,rec_tmonlineCase2.EFAMILYNM,rec_tmonlineCase2.EFIRSTNM,
                                    rec_tmonlineCase2.EMIDDLENM,rec_tmonlineCase2.SEX,rec_tmonlineCase2.BIRTHDTE,rec_tmonlineCase2.NATIONCD,rec_tmonlineCase2.TDTNO,rec_tmonlineCase2.PASSPORTDTE,
                                    rec_tmonlineCase2.PASSPORTEXPDTE,rec_tmonlineCase2.VISATYPECD, rec_tmonlineCase2.VISAEXPDTE,rec_tmonlineCase2.DEPTCD,
                                    (SELECT IMGPASS FROM IMMIGRATION WHERE personid=rec_imm.personid AND ROWNUM=1),rec_tmonlineCase2.UPDUSR,rec_tmonlineCase2.UPDDTE,rec_tmonlineCase2.COUNT_SEQNO,
                                    rec_tmonlineCase2.VISATYPE_SEQNO,rec_tmonlineCase2.DEPT_SEQNO);
                                    COMMIT;
                                   
                                    --Update ที่ imm ให้รูป pass เป็น null
                                    UPDATE IMMIGRATION  SET IMGPASS = NULL WHERE  personid = rec_imm.personid;-- AND TDTNO = rec_imm.TDTNO;
                                    COMMIT;
                                    
                                    UPDATE TESTPASSTEMP SET STATUS = 'Y', UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                                    COMMIT;
                                    --dbms_output.put_line('foundData : '||foundData);
                                    --dbms_output.put_line(rec_imm.TFAMILYNM || rec_imm.TFIRSTNM = TFIRSTNM ||rec_imm.NATIONCD ||rec_imm.BIRTHDTE);
                                /*ELSIF rec_tmonline.tdtno IS NULL THEN
                                    UPDATE IMMIGRATION  SET IMGPASS = NULL WHERE  personid = rec_imm.personid AND TDTNO = rec_imm.TDTNO;
                                    --COMMIT;
                                        
                                    UPDATE TESTPASSTEMP SET STATUS = 'Y' , UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                                    COMMIT;
                                END IF;*/
                            END LOOP;
                        END IF;
                        --Clear value
                        foundData := 'N';
                    ELSE
                        UPDATE TESTPASSTEMP SET STATUS = 'N' , UPDATE_DELETE = sysdate WHERE TDTNO = rec_imm.TDTNO;
                        COMMIT;
                    END IF;
                END LOOP;
        end loop;
        close c_passtmp; 
    
    Exception
    WHEN no_data_found THEN
        dbms_output.put_line('NOT DATA FOUND!');
    WHEN others THEN
        dbms_output.put_line(''||SQLERRM);
   END;
    
END MIGRATEIMM_TEST3;
/
