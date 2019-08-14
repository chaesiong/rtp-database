prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(186692193158153892)
,p_lov_name=>'AIRPORTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   un_locode|| '' - '' ||NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORTS$LC',
'    where IS_ACTIVE=''Y'' AND IS_AIRPORT=1',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(144221782939607174)
,p_lov_name=>'BORDERPOST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   key_value r',
'FROM',
'    DL_BORDERCONTROL.BORDERPOSTS$LC',
'    where IS_ACTIVE = ''Y''',
'    order by NAME',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(182747869576861229)
,p_lov_name=>'BORDERPOSTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(236810439642363107)
,p_lov_name=>'BORDER_DOCUMENT_CLASS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(186621155231793690)
,p_lov_name=>'BORDER_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BORDER_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(584693088801564950)
,p_lov_name=>'CARRIERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    iata',
'     || '' - ''',
'     || nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.carriers$lc',
'WHERE',
'        is_active = ''Y''',
'    AND',
'        is_air_carrier = 1',
'    AND',
'        is_sea_carrier = 0',
'    AND',
'        is_rail_carrier = 0',
'    AND',
'        is_road_carrier = 0',
'ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(186621668823841159)
,p_lov_name=>'COUNTRIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566820811133630419)
,p_lov_name=>'DOCTYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select description1 as d,',
'       ID as r',
'  from LOOKUPDOCTYPE',
' order by ID'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853854847655358148)
,p_lov_name=>'ENTRY/EXIT'
,p_lov_query=>'.'||wwv_flow_api.id(853854847655358148)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853855255204358150)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Entry'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853855601150358156)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Exit'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853856062724358157)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853872977372364607)
,p_lov_name=>'ENTRY/EXIT1'
,p_lov_query=>'.'||wwv_flow_api.id(853872977372364607)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853873405677364608)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Entry'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853873776933364609)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Exit'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853874247240364610)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853908993419395188)
,p_lov_name=>'ENTRY/EXIT2'
,p_lov_query=>'.'||wwv_flow_api.id(853908993419395188)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853909422656395189)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Entry'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853909776502395190)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Exit'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853910189813395191)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853923240513403081)
,p_lov_name=>'ENTRY/EXIT3'
,p_lov_query=>'.'||wwv_flow_api.id(853923240513403081)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853923603101403082)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Entry'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853924013865403083)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Exit'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853924395739403084)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(262034404724586336)
,p_lov_name=>'ENTRY_EXIT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(145064320709335682)
,p_lov_name=>'ENTRY_EXIT$TAG$LOV_TERMINALS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(p.DISPLAY_VALUE, p.DISPLAY_VALUE$DLC) d, p.NUM_VALUE r',
'  FROM DL_COMMON.PORT_MOVEMENTS$LC p',
'  LEFT JOIN dl_common.port_movements#tag t ON p.key_value = t.key_value',
' WHERE p.IS_ACTIVE = ''Y''',
'   AND t.owner$tag = ''APEX_COMMON_DATA''',
'   AND t.tag       = ''LOV_TERMINALS''',
' ORDER BY p.DISPLAY_VALUE;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(240039047267647330)
,p_lov_name=>'FINGERPOSITIONS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NVL(display_value,',
'    display_value$dlc) d,',
'    num_value r',
'    FROM',
'    dl_common.human_fingers$lc',
'    where    is_active = ''Y''',
'    order by display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853854544397358132)
,p_lov_name=>'FLOOR_NAME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853872383754364604)
,p_lov_name=>'FLOOR_NAME1'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853908733073395186)
,p_lov_name=>'FLOOR_NAME2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853941842557409378)
,p_lov_name=>'FLOOR_NAME3'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853955665582415158)
,p_lov_name=>'FLOOR_NAME4'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853973728124420598)
,p_lov_name=>'FLOOR_NAME5'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       ID as r',
'  from FLOOR',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(235003938973929034)
,p_lov_name=>'ICAO_DOC_CODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(261954108984403088)
,p_lov_name=>'ICAO_GENDER'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, ICAO r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where ICAO is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853857451163358160)
,p_lov_name=>'ITEMS/TERMTYPE'
,p_lov_query=>'.'||wwv_flow_api.id(853857451163358160)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853857865324358162)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'EGATE'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853858252341358163)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Work Station'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853858586025358164)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ARROW-DOWN'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853858993053358165)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'ARROW-UP'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853859395971358166)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'ARROW-LEFT'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853859773376358167)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'ARROW-RIGHT'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853860203713358168)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Wall'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853860613197358168)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Door'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853939095738409370)
,p_lov_name=>'ITEMSTYPE'
,p_lov_query=>'.'||wwv_flow_api.id(853939095738409370)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853939506794409372)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Walls'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853939871042409373)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'ARROW-UP'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853940326165409374)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'ARROW-DOWN'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853940678079409375)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'ARROW-LEFT'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853941105460409376)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'ARROW-RIGHT'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853941513271409377)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Door'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853952669091415151)
,p_lov_name=>'ITEMSTYPE1'
,p_lov_query=>'.'||wwv_flow_api.id(853952669091415151)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853952987403415152)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Walls'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853953464733415153)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'ARROW-UP'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853953797944415153)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'ARROW-DOWN'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853954260719415154)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'ARROW-LEFT'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853954648605415155)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'ARROW-RIGHT'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853954995406415156)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Door'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853970690272420586)
,p_lov_name=>'ITEMSTYPE2'
,p_lov_query=>'.'||wwv_flow_api.id(853970690272420586)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853971079378420587)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Walls'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853971514056420588)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'ARROW-UP'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853971894714420589)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'ARROW-DOWN'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853972294592420590)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'ARROW-LEFT'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853972691399420591)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'ARROW-RIGHT'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853973080345420595)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Door'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(181534113449545346)
,p_lov_name=>'LOCALE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    display_value,',
'    key_value',
'FROM',
'    dl_common.locales',
'    where is_active = ''Y''',
'    and display_value != ''en/US''',
'    order by display_order'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(465911434624728182)
,p_lov_name=>'LOG_MISSINGFINGERREASON'
,p_lov_query=>'.'||wwv_flow_api.id(465911434624728182)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(465911697523728202)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'All 10 Fingers available'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(465912077871728209)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Fingers missing'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(465912500085728210)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'All Fingers missing'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566859047346662312)
,p_lov_name=>'LOOKUP_USERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select FULLNAME as d,',
'       LOGINNAME as r',
'  from APUSER',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(21423340293928538162)
,p_lov_name=>'LOV_ACTION_CODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.action_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687514671885588590)
,p_lov_name=>'LOV_AGCCONTACT'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT agccontnm d, agccontcd r',
'FROM dl_bordercontrol.v_agccontact',
'ORDER BY 2;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(551266022750062932)
,p_lov_name=>'LOV_AIRPORTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from (',
'    select case when regexp_like(IATA_FAA_CODE, ''^[0-9]'') then 1 else 0 end as starts_with_number, IATA_FAA_CODE || '' - '' || CITY || '' ('' || COUNTRY || '')'' as d, ID as r ',
'    from AIRPORTS',
'    order by starts_with_number, IATA_FAA_CODE',
');'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(940507845487109624)
,p_lov_name=>'LOV_BLACKLISTACTION'
,p_lov_query=>'.'||wwv_flow_api.id(940507845487109624)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(940508101140109632)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Inserted'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(940508509328109637)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Updated'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(940508941979109637)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Deleted'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687781221297932428)
,p_lov_name=>'LOV_BLACKLIST_AUTHORITY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT orgnm d, orgcd r',
'FROM dl_bordercontrol.v_policorganize',
'UNION ALL',
'SELECT deptabbfmt1 d, TO_CHAR(dept_seqno) r ',
'FROM dl_bordercontrol.v_department',
'ORDER BY 2;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4688413134551755921)
,p_lov_name=>'LOV_BORDERPOSTS_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(name, name$dlc) d',
'    , key_value r',
'FROM dl_bordercontrol.borderposts$lc ',
'WHERE is_active = ''Y''',
'UNION ALL',
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END d',
'    , TO_CHAR(dept_seqno) r',
'FROM dl_bordercontrol.v_department ',
'WHERE actflag = ''Y'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3420954997476786159)
,p_lov_name=>'LOV_CASES_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'FROM dl_common.case_types$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(456340219693098873)
,p_lov_name=>'LOV_CONTROLPOSTTYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       ID as r',
'  from CONTROLPOSTTYPE',
' order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(155177718235146496)
,p_lov_name=>'LOV_DIM_OFFICERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username as d, id as r',
'from dl_bordercontrol_datamart.dim_officers',
'where ID not in (''-100'', ''-200'')',
'order by username;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(155178217973146540)
,p_lov_name=>'LOV_DIM_TIME_YEARS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct year_numeric as d, year_numeric as r from dl_bordercontrol_datamart.dim_times',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(155178778101146542)
,p_lov_name=>'LOV_DIM_TRANSPORT_MODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_transport_mode(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_transport_modes',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(155179416114146544)
,p_lov_name=>'LOV_DIM_VISA_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_visa_type(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_visa_types',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566472220048858865)
,p_lov_name=>'LOV_DIRECTION'
,p_lov_query=>'.'||wwv_flow_api.id(566472220048858865)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(566472461013858868)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arrival'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(566472884596858869)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Departure'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(196355819822032911)
,p_lov_name=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(905971316972710065)
,p_lov_name=>'LOV_ENTRYEXITDEPORTEEOFFLOAD'
,p_lov_query=>'.'||wwv_flow_api.id(905971316972710065)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(905971636154710066)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arrival'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(905971997098710067)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Departure'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(905972390485711379)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'Deport'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(905972745442712016)
,p_lov_disp_sequence=>22
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(903724949396402361)
,p_lov_name=>'LOV_ENTRYEXITUNKNOWN'
,p_lov_query=>'.'||wwv_flow_api.id(903724949396402361)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(903725267128402372)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arrival'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(903725601850402379)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Departure'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(903725987770403794)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'Both'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(487098868238599867)
,p_lov_name=>'LOV_FINGERPOSITIONS'
,p_lov_query=>'.'||wwv_flow_api.id(487098868238599867)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487099145767599869)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Right Thumb'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487099543008599870)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Right Index'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487099977754599871)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Right Middle'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487100336255599874)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Right Ring'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487100746969599874)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Right Little'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487101137674599874)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Left Thumb'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487101570804599874)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Left Index'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487102024203599875)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Left Middle'
,p_lov_return_value=>'8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487102341219599875)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'Left Ring'
,p_lov_return_value=>'9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(487102774955599875)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Left Little'
,p_lov_return_value=>'10'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(551306535110000705)
,p_lov_name=>'LOV_FLIGHTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.flightnum || '' (''|| o.IATA_FAA_CODE || '' -> '' || d.IATA_FAA_CODE || '')'' as d, f.flghtid as r from flights f',
'join airports o on o.id = f.originairportid',
'join airports d on d.id = f.destinairportid',
'order by f.flightnum;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(428716161485223870)
,p_lov_name=>'LOV_FLIGHTSSIMPLE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.flightnum || '' (''|| o.IATA_FAA_CODE || '' -> '' || d.IATA_FAA_CODE || '')'' as d, f.flightnum as r from flights f',
'join airports o on o.id = f.originairportid',
'join airports d on d.id = f.destinairportid',
'order by f.flightnum;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566474750788893812)
,p_lov_name=>'LOV_FLIGHTTYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       FLGHTTYPEID as r',
'  from FLIGHTTYPES',
' where ACTIVE > 0',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(428410676674707226)
,p_lov_name=>'LOV_INCIDENTTYPES'
,p_lov_query=>'.'||wwv_flow_api.id(428410676674707226)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(428410993252707230)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Blacklist'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(155179957411146545)
,p_lov_name=>'LOV_INTERVALS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    name as d,',
'    id as r',
'FROM',
'    dl_bordercontrol_datamart.intervals',
'order by sort'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(465159242261419400)
,p_lov_name=>'LOV_ISOCOUNTRIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(570709530368811123)
,p_lov_name=>'LOV_MOVEMENTACTION'
,p_lov_query=>'.'||wwv_flow_api.id(570709530368811123)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(570709817617811171)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arrival'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(570710177731811176)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Departure'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(582850413282476241)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(193497710818067469)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(582886410978825232)
,p_lov_name=>'LOV_OFFLOADREASON'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       offldrsnid as r',
'  from OFFLOADREASON',
'where active = 1',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(582884998148748256)
,p_lov_name=>'LOV_OPENFLIGHTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  t.NAME as d, t.trnsprtunitid as r ',
'from transportunits t',
'inner join TRANSPORTSTATUS s on s.id = t.trnsprtstatus',
'where t.active > 0 and upper(s.name) = ''OPEN''',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687561795487750015)
,p_lov_name=>'LOV_OPERATIONREF'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT opercd || ''-'' || operref d, opercd r',
'FROM dl_bordercontrol.v_operationref',
'ORDER BY 2;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(182009484811713195)
,p_lov_name=>'LOV_PERMIT_TYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC)  d,',
'   key_value r',
'from DL_COMMON.PERMIT_TYPES$LC t',
'order by t.DISPLAY_ORDER'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687501952265538300)
,p_lov_name=>'LOV_POLICE_ORG'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT orgnm d, orgcd r',
'FROM dl_bordercontrol.v_policorganize',
'ORDER BY 2;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(235015944016977233)
,p_lov_name=>'LOV_PORT_MOVEMENTS_NUM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORT_MOVEMENTS$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(196404921594343937)
,p_lov_name=>'LOV_PROVINCE'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_province;'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(583210569027105317)
,p_lov_name=>'LOV_RANKDESIGNATION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.NAME as d, p.id as r ',
'from RANKDESIGNATION p',
'where p.active > 0',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2842128054466122552)
,p_lov_name=>'LOV_REASON_CODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'FROM dl_common.reason_codes$lc',
'WHERE is_active = ''Y'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(192805752041171429)
,p_lov_name=>'LOV_RELATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(465452318329460673)
,p_lov_name=>'LOV_SEAPORTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UNLOCODE1 || '' ''|| UNLOCODE2 ||  '' - '' ||  NAME_LAT || '' ('' || COUNTRY_NAME || '')''  d',
'  , ID r',
'from V_SEAPORTS',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687276676109689961)
,p_lov_name=>'LOV_SECRET_LEVELS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || ''-'' || NVL(display_value, display_value$dlc) DISPLAY_VALUE,',
'       key_value',
'FROM dl_common.secret_levels$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(919529937562735893)
,p_lov_name=>'LOV_SERVERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct upper(name) d, key_value',
' from dl_bordercontrol.borderposts b',
' join dl_bordercontrol.MOVEMENTS m',
' on b.key_value = m.INS_BORDERPOST;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(185798964008064825)
,p_lov_name=>'LOV_SEX_NUM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(193497508937057555)
,p_lov_name=>'LOV_SEX_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4684663447151108195)
,p_lov_name=>'LOV_SOURCE_SYSTEMS'
,p_lov_query=>'.'||wwv_flow_api.id(4684663447151108195)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4684663701030108211)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'BIO'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4684664115222108219)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'PIBICS'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4684664594007108219)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ATC'
,p_lov_return_value=>'3'
);
end;
/
begin
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4684664967311108219)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'OFF'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2811513427753360562)
,p_lov_name=>'LOV_STATELESS_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'AND icao.key_value IN (''XXA'', ''XXB'', ''XXC'', ''XXX'')',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(465610319298999594)
,p_lov_name=>'LOV_STOPTYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       ID as r',
'  from SEAROUTESTOPTYPE',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566474453221881719)
,p_lov_name=>'LOV_TRANSPORTSTATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       ID as r',
'  from TRANSPORTSTATUS',
' where ACTIVE > 0',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4687652188449108095)
,p_lov_name=>'LOV_USERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    UPPER(NVL(TRIM(first_name || '' '' || last_name), username)) as d,',
'    username as r',
'FROM apex_user_management.users;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(197276542258595822)
,p_lov_name=>'LOV_VEHICLE_TYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.DISPLAY_VALUE, t0.key_value',
'  from dl_common.TRANS_VEHICLES$LC t0',
' inner join dl_common.TRANS_MODES t1',
'    on (t0.TRANS_MODE is null or t0.TRANS_MODE = t1.KEY_VALUE)',
' inner join dl_common.BORDER_TYPES t2',
'    on (t1.BORDER_TYPE is null or t1.BORDER_TYPE = t2.KEY_VALUE)',
' where t2.KEY_VALUE = :AI_BORDER_TYPE',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(183921632200067160)
,p_lov_name=>'LOV_VISA_TYPES_PERMIT_DAYS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) || NVL2(t.permit_days, '' - ''|| t.PERMIT_DAYS, '''') d,',
'   num_value r',
'from DL_COMMON.VISA_TYPES#ICAO_DC_ITMS$LC t',
'where (t.TRANS_MODE is null or t.TRANS_MODE = (select key_value from DL_COMMON.TRANS_MODES where NUM_VALUE = :AI_TRANSPORT_MODE))',
'and (t.ICAO_DOC_CODE is null or t.ICAO_DOC_CODE = :P17_NATIONALITY)',
'order by t.DISPLAY_ORDER'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(558108972921270797)
,p_lov_name=>'LOV_YESNO'
,p_lov_query=>'.'||wwv_flow_api.id(558108972921270797)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(558109305080270799)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(558109658378270800)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(583162488425998144)
,p_lov_name=>'PASSENGERSTATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.on_board_types$lc t',
'WHERE',
'    is_active = ''Y''',
'ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(144164752012571262)
,p_lov_name=>'PERSON TYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.BC_PERSON_TYPES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(144223516262607184)
,p_lov_name=>'PERSON TYPE1'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.BC_PERSON_TYPES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(144221173136607154)
,p_lov_name=>'TERMINALS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   id r',
'FROM',
'    DL_BORDERCONTROL.TERMINALS$LC',
'    where ACTIVE = 1 ',
'    order by NAME',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(564045129062241674)
,p_lov_name=>'TIMEFRAME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(15/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(30/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, ',
'trim(to_char(1/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''90 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(90/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(1/12,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(3/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(4/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(5/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(6/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(8/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(10/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(12/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''16 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(16/24,''00000.9999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, trim(to_char(1,''00000.9999999999'')) t ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(2,''00000.9999999999'')) t ',
'from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(3,''00000.9999999999'')) t ',
'from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(4,''00000.9999999999'')) t ',
'from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(5,''00000.9999999999'')) t ',
'from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, trim(to_char(7,''00000.9999999999'')) t   ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, trim(to_char(14,''00000.9999999999'')) t   ',
'from dual order by 2'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(930334507141467577)
,p_lov_name=>'TIMEFRAME1'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(15/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(30/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, ',
'trim(to_char(1/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''90 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(90/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(1/12,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(3/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(4/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(5/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(6/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(8/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(10/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(12/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''16 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(16/24,''00000.9999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, trim(to_char(1,''00000.9999999999'')) t ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(2,''00000.9999999999'')) t ',
'from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(3,''00000.9999999999'')) t ',
'from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(4,''00000.9999999999'')) t ',
'from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(5,''00000.9999999999'')) t ',
'from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, trim(to_char(7,''00000.9999999999'')) t   ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, trim(to_char(14,''00000.9999999999'')) t   ',
'from dual order by 2'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(566474202445876303)
,p_lov_name=>'TRANSPORTMODE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.TRANS_MODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(236769328362600782)
,p_lov_name=>'TRANSPORTSTATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.trans_grp_states$lc',
'WHERE',
'    is_active = ''Y''',
'ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(227888123469882486)
,p_lov_name=>'TRAVEL_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.BC_PERSON_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'AND (TRANS_MODE is null OR TRANS_MODE = (SELECT KEY_VALUE from DL_COMMON.TRANS_MODES where NUM_VALUE = :AI_TRANSPORT_MODE))',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(261858493820090450)
,p_lov_name=>'VISA_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853911581775395195)
,p_lov_name=>'WORKSTATION/EGATE'
,p_lov_query=>'.'||wwv_flow_api.id(853911581775395195)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853912069072395196)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'WORKSTATION'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853912438511395197)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'EGATE'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853926421549403091)
,p_lov_name=>'WORKSTATION/EGATE1'
,p_lov_query=>'.'||wwv_flow_api.id(853926421549403091)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853926851011403092)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'WORKSTATION'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853927201961403093)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'EGATE'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853856288901358157)
,p_lov_name=>'YES/NO'
,p_lov_query=>'.'||wwv_flow_api.id(853856288901358157)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853856746294358159)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853857077292358159)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853874774087364611)
,p_lov_name=>'YES/NO1'
,p_lov_query=>'.'||wwv_flow_api.id(853874774087364611)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853875191033364612)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853875620757364613)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853910485623395192)
,p_lov_name=>'YES/NO2'
,p_lov_query=>'.'||wwv_flow_api.id(853910485623395192)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853910890763395193)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853911311553395194)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853925036916403086)
,p_lov_name=>'YES/NO3'
,p_lov_query=>'.'||wwv_flow_api.id(853925036916403086)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853925464601403087)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853925818741403089)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853942147548409379)
,p_lov_name=>'YES/NO4'
,p_lov_query=>'.'||wwv_flow_api.id(853942147548409379)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853942557351409381)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853942898647409382)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853956179934415159)
,p_lov_name=>'YES/NO5'
,p_lov_query=>'.'||wwv_flow_api.id(853956179934415159)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853956572465415161)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853957023134415161)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(853974336239420600)
,p_lov_name=>'YES/NO6'
,p_lov_query=>'.'||wwv_flow_api.id(853974336239420600)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853974761931420601)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(853975162734420602)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(289937499758409966)
,p_lov_name=>'YES_NO_ALFA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    dl_common.yes_nos$lc',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(235001392283894561)
,p_lov_name=>'YES_NO_NUM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    dl_common.yes_nos$lc',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
end;
/
