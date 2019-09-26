CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CHKWL_IN_IMMIGRATION" IS
tmpVar NUMBER;

BEGIN
DECLARE
    postfix varchar2(20);
    flagfound varchar(20);
    totalrownum number(20);
    commitrow number(20);
    totalinsert number(20);
    batchlogno_seq number(20);    
CURSOR C1 IS
        select a.wlcd, b.wlefirstnm, b.wlelastnm, a.sex, a.birthdte, a.nationcd, c.docno 
        from watchlist a, watchlistnm b, wlindicatecard c
        where a.wlcd = b.wlcd 
        and a.wlcd = c.wlcd(+)
        and a.nationcd <> 'T03'
        and a.reasoncd <> '0076' 
        and flagcheckpoint is null
        --and a.wlcd in ('013893', '013894', '013895', '013896')
        --and rownum <= 40
        order by wlcd desc;
    rec_tm c1%rowtype;
BEGIN
    totalrownum := 0;
    commitrow := 0;
    totalinsert := 0;
        
    batchlogno_seq := batchlog_seq.nextval;
    insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
    values (batchlogno_seq, 'CWK', '74', 'CHECK WL ' || to_char(sysdate -1, 'dd/MM/yyyy'), null, 0, 0, 0, sysdate, null, '1', 'CWL001', sysdate, 'N', 0, 0, 0, sysdate);
    commit;

    OPEN C1;
    LOOP
    FETCH C1 INTO REC_TM; EXIT WHEN C1%NOTFOUND;
    
    postfix := null;
    flagfound := 'NOTFOUND';
    
     if rec_tm.wlefirstnm is not null and rec_tm.wlelastnm is not null then
        <<iitembkl1_loop>> for itembkl1 in
            (
                select * from (
                select * from immigration 
                where to_char(inoutdte, 'YYYYMMDD') between '20160101' and '20180522' 
                and cardtype = '1' 
                and nationcd <> 'T03'
                and ((efirstnm = rec_tm.wlefirstnm and efamilynm = rec_tm.wlelastnm) or (efamilynm = rec_tm.wlelastnm and efirstnm = rec_tm.wlefirstnm))
                and birthdte = rec_tm.birthdte
                order by inoutdte desc) where rownum = 1
            )
        loop        
            for rec_out in (
                select * from (
                select * from vw_tmonline where tdtno = itembkl1.tdtno and nationcd = itembkl1.nationcd and cardtype = '2'
                and to_char(inoutdate, 'YYYYMMDDHH24MI') > to_char(itembkl1.inoutdte, 'YYYYMMDDHH24MI') order by inoutdate desc)
                where rownum = 1
            )
            loop
                postfix := 'FOUNDCARDTWO';
            end loop;
        
            if postfix is null then
                insert into thailandelite_tmp (no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, 
                inoutdte, dept_seqno, match_name, match_tdtno, match_name_wlcd, match_tdtno_wlcd)
                values (investigate_seq.nextval, itembkl1.tdtno, itembkl1.efamilynm, itembkl1.efirstnm, itembkl1.emiddlenm, 
                itembkl1.sex, itembkl1.birthdte, itembkl1.nationcd, itembkl1.inoutdte, itembkl1.dept_seqno,
                'Y', null, rec_tm.wlcd, null  );
                commit;
                flagfound := 'FOUND';
                totalinsert := totalinsert + 1;
            end if;
        end loop;--Loop   
    end if;    
    
    if flagfound = 'NOTFOUND' then
        postfix := null;
        if rec_tm.wlefirstnm is not null and rec_tm.wlelastnm is null then
            <<iitembkl1_loop>> for itembkl1 in
                (
                    select * from (
                    select * from immigration 
                    where to_char(inoutdte, 'YYYYMMDD') between '20160101' and '20180522' 
                    and cardtype = '1' 
                    and nationcd <> 'T03'
                    and (efirstnm = rec_tm.wlefirstnm and efamilynm is null)
                    and birthdte = rec_tm.birthdte
                    order by inoutdte desc) where rownum = 1
                )
            loop        
                for rec_out in (
                    select * from (
                    select * from vw_tmonline where tdtno = itembkl1.tdtno and nationcd = itembkl1.nationcd and cardtype = '2'
                    and to_char(inoutdate, 'YYYYMMDDHH24MI') > to_char(itembkl1.inoutdte, 'YYYYMMDDHH24MI') order by inoutdate desc)
                    where rownum = 1
                )
                loop
                    postfix := 'FOUNDCARDTWO';
                end loop;
            
                if postfix is null then
                    insert into thailandelite_tmp (no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, 
                    inoutdte, dept_seqno, match_name, match_tdtno, match_name_wlcd, match_tdtno_wlcd)
                    values (investigate_seq.nextval, itembkl1.tdtno, itembkl1.efamilynm, itembkl1.efirstnm, itembkl1.emiddlenm, 
                    itembkl1.sex, itembkl1.birthdte, itembkl1.nationcd, itembkl1.inoutdte, itembkl1.dept_seqno,
                    'Y', null, rec_tm.wlcd, null  );
                    commit;
                    flagfound := 'FOUND';
                    totalinsert := totalinsert + 1;
                end if;
            end loop;--Loop   
        end if;
    end if;
    
    if flagfound = 'NOTFOUND' then
    postfix := null;
        if rec_tm.wlefirstnm is null and rec_tm.wlelastnm is not null then
            <<iitembkl1_loop>> for itembkl1 in
                (
                    select * from (
                    select * from immigration 
                    where to_char(inoutdte, 'YYYYMMDD') between '20160101' and '20180522' 
                    and cardtype = '1' 
                    and nationcd <> 'T03'
                    and (efirstnm is null and efamilynm = rec_tm.wlelastnm)
                    and birthdte = rec_tm.birthdte
                    order by inoutdte desc) where rownum = 1
                )
            loop        
                for rec_out in (
                    select * from (
                    select * from vw_tmonline where tdtno = itembkl1.tdtno and nationcd = itembkl1.nationcd and cardtype = '2'
                    and to_char(inoutdate, 'YYYYMMDDHH24MI') > to_char(itembkl1.inoutdte, 'YYYYMMDDHH24MI') order by inoutdate desc)
                    where rownum = 1
                )
                loop
                    postfix := 'FOUNDCARDTWO';
                end loop;
            
                if postfix is null then
                    insert into thailandelite_tmp (no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, 
                    inoutdte, dept_seqno, match_name, match_tdtno, match_name_wlcd, match_tdtno_wlcd)
                    values (investigate_seq.nextval, itembkl1.tdtno, itembkl1.efamilynm, itembkl1.efirstnm, itembkl1.emiddlenm, 
                    itembkl1.sex, itembkl1.birthdte, itembkl1.nationcd, itembkl1.inoutdte, itembkl1.dept_seqno,
                    'Y', null, rec_tm.wlcd, null);
                    flagfound := 'FOUND';
                    totalinsert := totalinsert + 1;
                    commit;
                end if;
            end loop;--Loop   
        end if;
    end if;
    
    --if flagfound = 'NOTFOUND' then
    postfix := null;
        if rec_tm.docno is not null and rec_tm.nationcd is not null then
            <<iitembkl1_loop>> for itembkl1 in
                (
                    select * from (
                    select * from immigration 
                    where to_char(inoutdte, 'YYYYMMDD') between '20160101' and '20180522' 
                    and cardtype = '1' 
                    --and nationcd <> 'T03'
                    and tdtno = rec_tm.docno
                    and nationcd = rec_tm.nationcd
                    order by inoutdte desc) where rownum = 1
                )
            loop        
                for rec_out in (
                    select * from (
                    select * from vw_tmonline where tdtno = itembkl1.tdtno and nationcd = itembkl1.nationcd and cardtype = '2'
                    and to_char(inoutdate, 'YYYYMMDDHH24MI') > to_char(itembkl1.inoutdte, 'YYYYMMDDHH24MI') order by inoutdate desc)
                    where rownum = 1
                )
                loop
                    postfix := 'FOUNDCARDTWO';
                end loop;
            
                if postfix is null then
                    insert into thailandelite_tmp (no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, 
                    inoutdte, dept_seqno, match_name, match_tdtno, match_name_wlcd, match_tdtno_wlcd)
                    values (investigate_seq.nextval, itembkl1.tdtno, itembkl1.efamilynm, itembkl1.efirstnm, itembkl1.emiddlenm, 
                    itembkl1.sex, itembkl1.birthdte, itembkl1.nationcd, itembkl1.inoutdte, itembkl1.dept_seqno,
                    null, 'Y', null, rec_tm.wlcd);
                    flagfound := 'FOUND';
                    totalinsert := totalinsert + 1;
                    commit;
                end if;
            end loop;--Loop   
        end if;
    --end if;    
        totalrownum := totalrownum + 1;
        commitrow := commitrow + 1;
        
        if commitrow = 10 then
            update batchlog set prrow = prrow + commitrow, totalins = totalinsert where batchlogno = batchlogno_seq;
            commit;
            commitrow := 0;
        end if;
                            
    END LOOP;        
    CLOSE C1;

    update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
    commit;

END;
END CHKWL_IN_IMMIGRATION;
/
