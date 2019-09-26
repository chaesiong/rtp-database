CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TOKENLASTNAME" (
   the_list  varchar2,
   the_index number,
   delim     varchar2 := '-'
)
   return    varchar2
is
   start_pos number;
   end_pos   number;
begin
   if the_index = 1 then
       start_pos := 1;
   else
       start_pos := instr(the_list, delim, 1, the_index - 1);
       if start_pos = 0 then
           return null;
       else
           start_pos := start_pos + length(delim);
       end if;
   end if;

   end_pos := instr(the_list, delim, start_pos, 1);

   if end_pos = 0 then
       return substr(the_list, start_pos);
   else
       return substr(the_list, start_pos);
   end if;

end get_tokenLastName;
/
