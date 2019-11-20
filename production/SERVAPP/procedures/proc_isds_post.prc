CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROC_ISDS_POST" 
(
  P_SERVICE IN VARCHAR2 
, P_DATA IN VARCHAR2 
, P_RETURN OUT VARCHAR2
) AS 

  req utl_http.req;
  res utl_http.resp;
  url varchar2(4000);
  name varchar2(4000);
  buffer varchar2(32000); 
  content varchar2(32000);
  
BEGIN
  url := 'http://172.22.6.66:6080/ords/servapp/'||P_SERVICE;
  content :='{}';
   req := utl_http.begin_request(url, 'POST',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  utl_http.set_header(req, 'content-type', 'application/json'); 
  utl_http.set_header(req, 'Content-Length', length(content));
 
  utl_http.write_text(req, content);
  res := utl_http.get_response(req);
  -- process the response from the HTTP call
  begin
    loop
      utl_http.read_line(res, buffer);
      dbms_output.put_line(buffer);
      P_RETURN := buffer;
    end loop;
    utl_http.end_response(res);
  exception
    when utl_http.end_of_body 
    then
      utl_http.end_response(res);
  end;
END PROC_ISDS_POST;
/
  GRANT EXECUTE ON "SERVAPP"."PROC_ISDS_POST" TO "BIOSAADM";
