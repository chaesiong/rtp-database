prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92970267602466432)
,p_theme_id=>500
,p_name=>'DERMALOG'
,p_is_current=>true
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"    .t-PageBody.js-rightExpanded.t-PageBody--hideLeft .t-Body-main {  \n      margin-right: 250px;  \n    }  \n    .t-PageBody.js-rightCollapsed .t-Body-actions {  \n      -webkit-transform: translate3d(250px, 0, 0);  \n      -ms-transf'
||'orm: translate(250px);  \n      transform: translate3d(250px, 0, 0);  \n    }  \n    #t_Body_actions {   \n      width: 250px;   \n    }  ","vars":{"@g_Accent-BG":"#004c93","@g_Link-Base":"#004c93","@g_Focus":"#004c93","@g_Body-Title-BG":"#004c93","@'
||'Nav-Exp":"220px","@Actions-Exp":"240px","@g_Color-Palette-8-FG":"#099ce0","@g_Nav-BG":"#004c93","@g_Actions-Col-BG":"#004c93"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#26066738065303397.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92970413910466432)
,p_theme_id=>500
,p_name=>'Mull_Spezial'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"body {  \n      font-family: \"Tahoma\", sans-serif;\n}\n.t-Login-region{\n box-shadow: none; \n}\n.apex-rds-selected {\n  background-color: white !important;\n  bord\n  er-radius: 4px 4px 0 0 !important;\n}\n.t-Tabs-item {\n  backgroun'
||'d-color: rgba(0, 0, 0, 0.05);\n}\n.apex-rds-item {\n  background-color: rgba(0, 0, 0, 0.05);\n}\n.apex-rds a:focus {\n  box-shadow: 0 -2px 0 #74ace6 inset;\n}\n.t-Tabs-item.is-active {\n  background-color: white !important;\n  border-radius: 4px 4px '
||'0 0 !important;\n}\n\n.a-TreeView-node--leaf > .a-TreeView-content > .fa {\n  width: 20px;\n}\n\n.t-Button.t-Button--header.t-Button--headerRight {\n  border-bottom-left-radius: 1em;\n  border-left: 1px solid rgba(255, 255, 255, 0.7);\n  border-botto'
||'m: 1px solid rgba(255, 255, 255, 0.7);\n  z-index: 1;\n  left: 0px;\n}\n\n.t-Body-actions {\n  border-left: 1px solid rgba(255, 255, 255, 0.7);\n  background-color: rgba(255, 255, 255, 0.7);\n}\n\n#t_Button_rightControlButton {\n  background-color: r'
||'gba(255, 255, 255, 0.7);\n}\n\n#t_Button_rightControlButton:hover {\n  background-color: rgba(255, 255, 255, 0.8);\n}\n\n#div_right_side .t-Button.t-Button--icon.t-Button--iconRight {\n  margin-left: 0.6em;\n  margin-top: 2em;\n  width: 160px;\n}\n\n'
||'#div_right_side .t-Button.t-Button--icon.t-Button--primary.t-Button--iconRight {\n  background-color: #2577cf;\n  color: white;\n}\n\n#t_Body_actions {\n  border-left: none;\n}\n\n.VERSIONINFO>span {\n font-family: ''Helvetica Neue'',''Segoe UI'',Helveti'
||'ca,Arial,sans-serif;\n  font-size: 1.2rem !important;\n\n.t-Body-topButton {\n  display: none !important;\n}\n\n.deletebutton {\n  background-color: darkred;\n}\n\n.t-Body-content {\n  padding-bottom: 2rem;\n}\n\n.VERSIONINFO {\n  color: rgba(255, 25'
||'5, 255, 0.7);\n  margin-top: 0.1rem;\n}\n\n.CSSBUTTON {\n  border-left: 1px solid rgba(255, 255, 255, 0.2);\n  border-top: 1px solid rgba(255, 255, 255, 0.2);\n  border-right: 1px solid rgba(0, 0, 0, 0.3);\n  border-bottom: 1px solid rgba(0, 0, 0, 0.'
||'3);\n  /*background-color: rgba(0, 0, 0, 0.1) !important*/;\n  border-radius: 6px !important;\n  margin-left: 1px;\n  margin-right: 1px;\n}\n\n.a-TreeView-row.is-selected {\n  background-color: rgba(255,255,255,0.3) !important;\n  background: linear-'
||'gradient(to bottom, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.5));\n}\n\n.a-TreeView-content.is-selected>.a-TreeView-label {\n  font-weight: bold;\n}\n\n.t-Alert.t-Alert--defaultIcons.t-Alert--warning.t-Alert--horizontal.t-Alert--page.t-Alert--colorBG.is-v'
||'isible {\n  position: fixed;\n  left: 25%;\n  top: 50%;\n  z-index: 200;\n  width: 25%;\n  height: 25%;\n}\n\n.ui-widget.ui-dialog {\n\tborder-top-left-radius: 1em;\n\tborder-top-right-radius: 1em;\n}\n\n.apex-rds {\n  border-bottom: 1px solid rgba(0'
||', 0, 0, 0.1);\n}\n\n.apex-rds-selected {\n  border-top-left-radius: 1em;\n  border-top-right-radius: 1em;\n  border-top: 1px solid rgba(0, 0, 0, 0.2);\n/*  border-left: 1px solid rgba(0, 0, 0, 0.2);\n  border-right: 1px solid rgba(0, 0, 0, 0.2);*/\n '
||' background-color: rgba(255, 255, 255, 0.8) !important;\n  margin-bottom: -1px;\n  font-weight: bold;\n}","vars":{"@g_Button-BorderRadius":"8px","@g_Actions-Col-BG":"#b5bdc9","@l_Left-Col-BG":"#2577cf","@g_Actions-Col-Text":"#2577cf","@g_Accent-OG":"'
||'#d1e0f5","@g_Container-BorderRadius":"14px","@g_Form-BorderRadius":"2px"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#285684833989249813.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92970589033466455)
,p_theme_id=>500
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92970850010466455)
,p_theme_id=>500
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92971022864466455)
,p_theme_id=>500
,p_name=>'Vita (Copy)'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":".t-Body-nav{\n  background: url(Maldives_Wappen_01.png) no-repeat bottom left; \n}\n\n","vars":{}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#9042958329967539.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92971202982466455)
,p_theme_id=>500
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(92971388958466456)
,p_theme_id=>500
,p_name=>'mit runden kanten'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Button-BorderRadius":"8px"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#9158898821790931.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(115046323111156285)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(115046680480156288)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(115047027500156289)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(115047499426156289)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(115047904353156290)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/