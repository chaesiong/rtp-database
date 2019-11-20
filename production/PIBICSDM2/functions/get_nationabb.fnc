CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONABB" (countseq number,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
 if flag = 'A' then
    select countcd||' - '||nationtnm into tmp from country where count_seqno=countseq;
 elsif flag = 'B' then
    select countcd||' - '||nationenm into tmp  from country where count_seqno=countseq;
 elsif flag = 'C' then
    select abbcount||' - '||nationtnm into tmp from country where count_seqno=countseq;
 elsif flag = 'D' then
    select abbcount||' - '||nationenm into tmp from country where count_seqno=countseq;
 elsif flag = 'E' then
    select countcd||' - '||counttnm into tmp from country where count_seqno=countseq;
 elsif flag = 'F' then
    select countcd||' - '||countenm into tmp from country where count_seqno=countseq;
 elsif flag = 'G' then
    select abbcount||' - '||counttnm into tmp from country where count_seqno=countseq;
 elsif flag = 'H' then
    select nationenm||' - '||abbcount into tmp from country where count_seqno=countseq;
 elsif flag = 'I' then
    select nationtnm||' - '||abbcount into tmp from country where count_seqno=countseq;
 else  select abbcount||' - '||countenm into tmp from country where count_seqno=countseq;
 end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONABB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONABB" TO "BIOSAADM";
