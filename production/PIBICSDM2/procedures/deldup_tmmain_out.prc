CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELDUP_TMMAIN_OUT" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is       
    /*select * from (
    select outtdtno, outtm6no, to_char(outdte, 'yyyymmddhh24mi'), count('X') cnt, max(tmrunno) maxtm, min(tmrunno) mintm from tmmain where to_char(outdte, 'yyyymmdd') = '20141014' 
    --and typedata <> 'PISCES' 
    group by outtdtno, outtm6no, to_char(outdte, 'yyyymmddhh24mi')) where cnt =2 ;*/
    
    
        select * from tmmain where to_char(outcredte, 'yyyymmdd') = '20150416' and outseqno in (
       select seqno from tminout where to_number(to_char(credte, 'YYYYMMDD')) < to_number(to_char(sysdate, 'YYYYMMDD')));
    
    rec_tmmain c1%rowtype;
begin
     totalrow:=0;
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
     file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_Deldup_tmmain_out'||sysdateFile||'.txt','W');
     utl_file.put_line(file_ut,sysdateTxt||' Start migrate duplicate data pibics@Tmmain out .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        --dbms_output.put_line('tmrunno: '||rec_tmmain.tmrunno);
        <<itemTm_loop>> FOR itemTM IN
            (
                select * from tmmain where tmrunno = rec_tmmain.tmrunno
            )
            LOOP
                insert into tmmainlog (
                tmmainlogid, loguserid, logflag, logdte,  tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno, indte, indeptcd, intravcd, 
                inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecd, inpermitcd, inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, 
                visaissue, visadte, visabyrights, inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte, 
                inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd, outconvcd, outconvregno, 
                outtdtcd, outtdtno, outtm6no, outvisatypecd, outpermitcd, outpermitdte, outpassportdte, outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, 
                outcredterm, outupdusr, outupddte, outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm, tfsndxnm, tlsndxnm, 
                tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype, outintype, intargetno, outtargetno, inremark, outremark, flagmatch, inrescertno, 
                outrescertno, inimg, outimg, extid, outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inconv_seqno, invisatype_seqno, indept_seqno, 
                count_seqno, inpermit_seqno, citizenid, pass_seqno, inflightprefix, inflightnumber, outflightprefix, outflightnumber, inrpjseqno, outrpjseqno, typedata, flagjoinpass, 
                flagfines) 
                select tmmainlog_seq.nextval, 'ittipon', 'D', sysdate,  tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno, indte, indeptcd, intravcd, 
                inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecd, inpermitcd, inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, 
                visaissue, visadte, visabyrights, inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte, 
                inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd, outconvcd, outconvregno, 
                outtdtcd, outtdtno, outtm6no, outvisatypecd, outpermitcd, outpermitdte, outpassportdte, outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, 
                outcredterm, outupdusr, outupddte, outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm, tfsndxnm, tlsndxnm, 
                tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype, outintype, intargetno, outtargetno, 'ข้อมูลซ้ำจากการนำเข้า', outremark, flagmatch, inrescertno, 
                outrescertno, inimg, outimg, extid, outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inconv_seqno, invisatype_seqno, indept_seqno, 
                count_seqno, inpermit_seqno, citizenid, pass_seqno, inflightprefix, inflightnumber, outflightprefix, outflightnumber, inrpjseqno, outrpjseqno, typedata, flagjoinpass, 
                flagfines from tmmain where tmrunno = itemTM.tmrunno; 
            
                delete tmmain where tmrunno = itemTM.tmrunno;
                commit;
                totalrow:=totalrow+1;
                
            END LOOP
        commit;
        end loop;
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End Process  migrate duplicate data pibics@Tmmain out .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;

END DELDUP_TMMAIN_OUT;
/
