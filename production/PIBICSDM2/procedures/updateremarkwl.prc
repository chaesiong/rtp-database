CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDATEREMARKWL" IS
tmpVar NUMBER;
BEGIN
declare
totalrownum number(20);
commitrow number(20);
totalupdate number(20);
batchlogno_seq number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select a.wlcd,  a.remark remk_wl , c.remk  remk_wlremark
        from watchlist a, watchlistnm b, wlremark c
        where a.wlcd = b.wlcd and a.wlcd=c.wlcd and b.seqno = 0
        and a.operref='01' --พฤติกรรมที่เกี่ยวข้อง    01 -ม.19/22 
        and a.tdcd ='0001'   --สิ่งที่ต้องปฏิบัติ  0001    ไม่พึงปรารถนา
        and reasoncd in('0029','0078','0081','0083','0086')  -- 0029    ใบอนุญาตทำงานต่างด้าว , 0078    พ.ร.บ.การประมง , 0081    พ.ร.บ.ใบอนุญาตการทำงาน , 0083    เรี่ยไรหรือขอทาน , 0086    ไม่มีปัจจัยยังชีพฯ
        and get_CAL_AGE(to_char(WARRDTE,'dd/mm/yyyy'))>=5 ;   -- วันเดือนปีที่ออก จะต้องมากกว่าวันที่ปัจจุบัน 5ปี
    rec_tm c1%rowtype;  
begin

       batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'BKL', '2', 'WLUPDATEREMARK', null, 0, 0, 0, sysdate, null, '1', 'BKL001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;

 totalrownum:=0;
 totalupdate:=0;
 commitrow:=0;

 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
        update watchlist set td_seqno = 13 , tdcd = '0009', remark = rec_tm.remk_wl || '  คณะกรรมการพิจารณาบันทึกและเปลี่ยนแปลงข้อมูลคนต่างด้าวที่มีพฤติการณ์สมควรห้ามมิให้เข้ามาในราชอาณาจักร ได้มีการประชุมครั้งที่ ๑/๒๕๕๘ ลง ๔ ก.พ.๒๕๕๘ มีมติกรณีคนต่างด้าวถูกบันทึกรายชื่อตามมาตรา ๑๒(๒) , (๓) แห่ง พ.ร.บ.คนเข้าเมือง พ.ศ.๒๕๒๒ เมื่อครบกำหนดระยะเวลา ๕ ปี นับแต่วันที่ ผบช.สตม.สั่งการ ให้ระบบคอมพิวเตอร์บันทึกข้อมูลเพิ่มเติมอัตโนมัติ เพื่ออนุญาตให้เข้ามาในราชอาณาจักรได้'  
 where wlcd=rec_tm.wlcd;
 
        update wlremark set remk = rec_tm.remk_wlremark || '  คณะกรรมการพิจารณาบันทึกและเปลี่ยนแปลงข้อมูลคนต่างด้าวที่มีพฤติการณ์สมควรห้ามมิให้เข้ามาในราชอาณาจักร ได้มีการประชุมครั้งที่ ๑/๒๕๕๘ ลง ๔ ก.พ.๒๕๕๘ มีมติกรณีคนต่างด้าวถูกบันทึกรายชื่อตามมาตรา ๑๒(๒) , (๓) แห่ง พ.ร.บ.คนเข้าเมือง พ.ศ.๒๕๒๒ เมื่อครบกำหนดระยะเวลา ๕ ปี นับแต่วันที่ ผบช.สตม.สั่งการ ให้ระบบคอมพิวเตอร์บันทึกข้อมูลเพิ่มเติมอัตโนมัติ เพื่ออนุญาตให้เข้ามาในราชอาณาจักรได้'
 where wlcd=rec_tm.wlcd;
 
    totalrownum:=totalrownum+1;   
    commitrow:=commitrow+1;
    totalupdate := totalupdate +1;
    if commitrow = 100 then    
        update batchlog set prrow = prrow + commitrow, totalupd=totalupdate where batchlogno = batchlogno_seq;
        commit;
        commitrow := 0;
   end if;   
 end loop; --cursor
 close c1;
 
 update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalupd=totalupdate, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
 commit;
-- Exception
--  when others then
--   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END updateRemarkWL;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDATEREMARKWL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDATEREMARKWL" TO "BIOSAADM";
