CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "DL_MAINTENANCE"."HM_MAIL" is

  FUNCTION encode_base64(p_blob_in IN BLOB) RETURN CLOB IS
    v_clob       CLOB;
    v_offset     INTEGER;
    v_chunk_size BINARY_INTEGER := (48 / 4) * 3;

    v_buffer_raw RAW(48);
  BEGIN
    v_offset := 1;
    FOR i IN 1 .. ceil(dbms_lob.getlength(p_blob_in) / v_chunk_size)
    LOOP
      dbms_lob.read(p_blob_in, v_chunk_size, v_offset, v_buffer_raw);
      v_buffer_raw := utl_encode.base64_encode(v_buffer_raw);
      v_clob       := v_clob || to_clob(utl_raw.cast_to_varchar2(v_buffer_raw));
      v_offset     := v_offset + v_chunk_size;
    END LOOP;
    RETURN(v_clob);
  END;

   FUNCTION decode_base64(p_clob_in IN CLOB) RETURN BLOB IS
    v_blob           BLOB;
    v_result         BLOB;
    v_offset         INTEGER;
    v_buffer_size    BINARY_INTEGER := 48;
    v_buffer_varchar VARCHAR2(48);
    v_buffer_raw     RAW(48);
  BEGIN
    IF p_clob_in IS NULL
    THEN
      RETURN NULL;
    END IF;
    dbms_lob.createtemporary(v_blob, TRUE);
    v_offset := 1;
    FOR i IN 1 .. ceil(dbms_lob.getlength(p_clob_in) / v_buffer_size)
    LOOP
      dbms_lob.read(p_clob_in, v_buffer_size, v_offset, v_buffer_varchar);
      v_buffer_raw := utl_raw.cast_to_raw(v_buffer_varchar);
      v_buffer_raw := utl_encode.base64_decode(v_buffer_raw);
      dbms_lob.writeappend(v_blob, utl_raw.length(v_buffer_raw), v_buffer_raw);
      v_offset := v_offset + v_buffer_size;
    END LOOP;
    v_result := v_blob;
    dbms_lob.freetemporary(v_blob);
    RETURN v_result;
  END decode_base64;



 procedure send_encode_base64(p_conn    in out utl_smtp.connection,
                               p_blob_in in blob) is
    v_offset         integer;
    v_chunk_size     binary_integer := (48 / 4) * 3;
    v_buffer_varchar varchar2(48);
    v_buffer_raw     raw(48);
    v_all            clob;
  begin
    v_offset := 1;
    v_all    := '';
    for i in 1 .. ceil(dbms_lob.getlength(p_blob_in) / v_chunk_size) loop
      dbms_lob.read(p_blob_in, v_chunk_size, v_offset, v_buffer_raw);
      v_buffer_raw     := utl_encode.base64_encode(v_buffer_raw);
      v_buffer_varchar := utl_raw.cast_to_varchar2(v_buffer_raw);
      utl_smtp.write_data(p_conn, v_buffer_varchar || chr(13) || chr(10));
      v_all    := v_all || v_buffer_varchar || chr(13) || chr(10);
      v_offset := v_offset + v_chunk_size;
    end loop;
    --    log('Sending Base64 ...', v_all);
  end;

  procedure smtp_attach_file(v_mail_conn in out utl_smtp.connection,
                             p_filename  in varchar2,
                             p_mimetype  in varchar2,
                             p_data      in blob,
                             p_part      in varchar2) is
  begin
    utl_smtp.write_data(v_mail_conn,
                        utl_tcp.crlf || '--' || c_mime_boundary ||
                        utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        'Content-Type: ' || p_mimetype || utl_tcp.crlf);
    if p_part is not null then
      utl_smtp.write_data(v_mail_conn,
                          'Content-ID: <' || p_part || '>' || utl_tcp.crlf);
      utl_smtp.write_data(v_mail_conn,
                          'Content-Disposition: inline' || utl_tcp.crlf);
    else
      utl_smtp.write_data(v_mail_conn,
                          'Content-Disposition: attachment; filename="' ||
                          p_filename || '"' || utl_tcp.crlf);
    end if;

    utl_smtp.write_data(v_mail_conn,
                        'Content-Transfer-Encoding: base64' || utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn, utl_tcp.crlf);
    send_encode_base64(v_mail_conn, p_data);
    utl_smtp.write_data(v_mail_conn, utl_tcp.crlf);
  end;

  procedure mail_transmit(p_sender  in varchar2,
                          p_email   in varchar2,
                          p_cc      in varchar2,
                          p_subject in varchar2,
                          p_text    in clob) is
    v_mail_conn     utl_smtp.connection;
    v_attachpresent number;
    v_email         varchar2(500);
    v_chunk         varchar2(32000);
    v_clob          clob;
    i               number;
    v_mailserver      varchar2(500);
    vc_arr          apex_application_global.vc_arr2;
  begin
    SELECT decode(host_name,'tha20675-database-dev3.dev.dc.dermalog.hh','mx.dermalog.com','127.0.0.1') into v_mailserver FROM v$instance;
    hm_main.log('Transmitting Email "' || substr(p_subject, 1, 30) || ' to ' ||
        p_email,
        p_text);

    v_email := p_email;

    v_mail_conn := utl_smtp.open_connection(v_mailserver, 25);
    utl_smtp.helo(v_mail_conn, 'central.hsm.de');
    utl_smtp.mail(v_mail_conn, p_sender);

    vc_arr := apex_util.string_to_table(v_email, ',');
    for i in 1 .. vc_arr.count loop
      utl_smtp.rcpt(v_mail_conn, vc_arr(i));
    end loop;

    vc_arr := apex_util.string_to_table(p_cc, ',');
    for i in 1 .. vc_arr.count loop
      utl_smtp.rcpt(v_mail_conn, vc_arr(i));
    end loop;

    utl_smtp.open_data(v_mail_conn);
    utl_smtp.write_data(v_mail_conn, 'MIME-Version: 1.0' || utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        'Message-ID:<' ||
                        to_char(sysdate - (2 / 24), 'ddmmyyyyhh24miss') ||
                        to_char(systimestamp, 'FF') || 00 ||
                        '@central.octogate.de>' || utl_tcp.crlf);

    utl_smtp.write_data(v_mail_conn, 'From: ' || p_sender || utl_tcp.crlf);

    utl_smtp.write_data(v_mail_conn,
                        'Subject: =?ISO-8859-1?Q?' ||
                        utl_encode.text_encode(substr(p_subject, 1, 60) || case when
                                               length(p_subject) > 60 then
                                               '...' end,
                                               'WE8ISO8859P15',
                                               utl_encode.quoted_printable) || '?=' ||
                        utl_tcp.crlf);

    utl_smtp.write_data(v_mail_conn, 'To: ' || v_email || utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        'Content-Type: multipart/mixed;' || utl_tcp.crlf ||
                        ' charset=ISO-8859-1;' || utl_tcp.crlf ||
                        ' boundary="' || c_mime_boundary || '"' ||
                        utl_tcp.crlf);

    utl_smtp.write_data(v_mail_conn, utl_tcp.crlf);

    utl_smtp.write_data(v_mail_conn,
                        '--' || c_mime_boundary || utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        'Content-Transfer-Encoding: quoted-printable' ||
                        utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        'Content-Type: text/html' || utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn, utl_tcp.crlf);
    utl_smtp.write_data(v_mail_conn,
                        '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> <html><head></head><body>' ||
                        utl_tcp.crlf);

    v_clob := p_text;

    while length(v_clob) > 0 loop
      v_chunk := substr(v_clob, 1, 4000);
      v_clob  := substr(v_clob, 4001);
      utl_smtp.write_data(v_mail_conn,
                          utl_encode.text_encode(v_chunk,
                                                 'WE8ISO8859P15',
                                                 utl_encode.quoted_printable));
    end loop;

    utl_smtp.write_data(v_mail_conn, '</body></html>' || utl_tcp.crlf);

    v_attachpresent := 0;

    for r_c1rec in (select s.value_blob, key
                      from hm_settings s
                     where key like 'IMG%') loop
      smtp_attach_file(v_mail_conn,
                       r_c1rec.key || '.png',
                       'image/png',
                       r_c1rec.value_blob,
                       'part1.0123.0' || substr(r_c1rec.key, -3));
    end loop;

    utl_smtp.write_data(v_mail_conn,
                        '--' || c_mime_boundary || '--' || utl_tcp.crlf);
    utl_smtp.close_data(v_mail_conn);
    utl_smtp.quit(v_mail_conn);

  end;

  procedure process_mail(p_arr            in apex_application_global.vc_arr2,
                         p_overall_status in varchar2,
                         p_num_errors     number) is
    v_text  clob;
    v_temp  clob;
    v_sub   wwv_flow_t_varchar2;
    i       number;
    v_temp2 varchar2(100);

  begin

    v_text := hm_main.get_settings('TEMPLATE_HEADER');
    v_sub  := apex_string.split(p_arr(0), '|');
    v_text := replace(v_text, '%%TEXT%%', v_sub(3));
    v_text := replace(v_text,
                      '%%HEADER%%',
                      'Current System status: ' || v_sub(2));
    v_text := replace(v_text, '%%ANREDE%%', v_sub(1) || p_num_errors);
    v_text := replace(v_text, '%%IMAGE%%', 'cid:part1.0123.0123');

    for i in 1 .. p_arr.count - 1 loop
      v_text := v_text || hm_main.get_settings('TEMPLATE_ROW');
      v_temp := hm_main.get_settings('TEMPLATE_LEFT');
      v_sub  := apex_string.split(p_arr(i), '|');
      v_temp := replace(v_temp, '%%TEXT%%', v_sub(3));
      v_temp := replace(v_temp, '%%HEADER%%', v_sub(1));
      select decode(v_sub(2),
                    'OK',
                    'cid:part1.0123.0125',
                    'ERROR',
                    'cid:part1.0123.0124')
        into v_temp2
        from dual;
      v_temp := replace(v_temp, '%%IMAGE%%', v_temp2);
      v_temp := replace(v_temp, '%%HEIGHT%%', 128);
      v_temp := replace(v_temp, '%%WIDTH%%', 128);
      v_text := v_text || v_temp;
    end loop;
    v_text := v_text || hm_main.get_settings('TEMPLATE_FOOTER');
    mail_transmit('info@mscsittipol.com',
                  hm_main.get_settings('EMAIL_RECIPIENTS'),
                  '',
                  '20675 Thailand / HM - Status report '||to_char(sysdate,'dd.mm.yyyy hh24:mi'),
                  v_text);

  end;


begin
  null;
end HM_MAIL;
/
  GRANT EXECUTE ON "DL_MAINTENANCE"."HM_MAIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_MAINTENANCE"."HM_MAIL" TO "BIOSUPPORT";
