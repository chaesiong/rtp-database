CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PLJSON_HELPER" as
  /* Example:
  set serveroutput on;
  declare
    v_a json;
    v_b json;
  begin
    v_a := json('{a:1, b:{a:null}, e:false}');
    v_b := json('{c:3, e:{}, b:{b:2}}');
    json_helper.merge(v_a, v_b).print(false);
  end;
  --
  {"a":1,"b":{"a":null,"b":2},"e":{},"c":3}
  */
  -- Recursive merge
  -- Courtesy of Matt Nolan - edited by Jonas Krogsboell
  function merge( p_a_json pljson, p_b_json pljson) return pljson;

  -- Join two lists
  -- json_helper.join(json_list('[1,2,3]'),json_list('[4,5,6]')) -> [1,2,3,4,5,6]
  function join( p_a_list pljson_list, p_b_list pljson_list) return pljson_list;

  -- keep only specific keys in json object
  -- json_helper.keep(json('{a:1,b:2,c:3,d:4,e:5,f:6}'),json_list('["a","f","c"]')) -> {"a":1,"f":6,"c":3}
  function keep( p_json pljson, p_keys pljson_list) return pljson;

  -- remove specific keys in json object
  -- json_helper.remove(json('{a:1,b:2,c:3,d:4,e:5,f:6}'),json_list('["a","f","c"]')) -> {"b":2,"d":4,"e":5}
  function remove( p_json pljson, p_keys pljson_list) return pljson;

  --equals
  function equals(p_v1 pljson_value, p_v2 pljson_value, exact boolean default true) return boolean;
  function equals(p_v1 pljson_value, p_v2 pljson, exact boolean default true) return boolean;
  function equals(p_v1 pljson_value, p_v2 pljson_list, exact boolean default true) return boolean;
  function equals(p_v1 pljson_value, p_v2 number) return boolean;
  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  function equals(p_v1 pljson_value, p_v2 binary_double) return boolean;
  function equals(p_v1 pljson_value, p_v2 varchar2) return boolean;
  function equals(p_v1 pljson_value, p_v2 boolean) return boolean;
  function equals(p_v1 pljson_value, p_v2 clob) return boolean;
  function equals(p_v1 pljson, p_v2 pljson, exact boolean default true) return boolean;
  function equals(p_v1 pljson_list, p_v2 pljson_list, exact boolean default true) return boolean;

  --contains json, json_value
  --contains json_list, json_value
  function contains(p_v1 pljson, p_v2 pljson_value, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 pljson, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 pljson_list, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 number, exact boolean default false) return boolean;
  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  function contains(p_v1 pljson, p_v2 binary_double, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 varchar2, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 boolean, exact boolean default false) return boolean;
  function contains(p_v1 pljson, p_v2 clob, exact boolean default false) return boolean;

  function contains(p_v1 pljson_list, p_v2 pljson_value, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 pljson, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 pljson_list, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 number, exact boolean default false) return boolean;
  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  function contains(p_v1 pljson_list, p_v2 binary_double, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 varchar2, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 boolean, exact boolean default false) return boolean;
  function contains(p_v1 pljson_list, p_v2 clob, exact boolean default false) return boolean;

end pljson_helper;
/
