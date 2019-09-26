CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."CALL_EXTERNAL_SERVICE" 
 is
  req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'https://us-central1-kasetdbdev.cloudfunctions.net/submitReport';
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000) := '{  
   "appId":"th.ac.ku.agr.smartfeed",
   "appVersion":"1.0.0",
   "drawAreaLoc":{  
      "latitude":13.753789,
      "longitude":100.626084
   },
   "sentDate":"Sun Jun 10 2018 17:48:33 GMT+0700 (+07)",
   "lastUpdated":"Sun Jun 10 2018 17:48:33 GMT+0700 (+07)",
   "reportId":"Test smartfeed",
   "payload":{
   		"appVer":"1.0.0",
   		"deviceOS":"ios",
   		"ownerName":"????????",
   		"province":"?????????",
		"test" : "???????????"
	},
   "payloadLabel":{  
      "ownerName":"?????????"
   }
}';

begin
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
    end loop;
    utl_http.end_response(res);
  --  res_out:=res;
  exception
    when utl_http.end_of_body 
    then
      utl_http.end_response(res);
  end;
end CALL_EXTERNAL_SERVICE;

/
