CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."PLJSON" force under pljson_element (

  /*
  Copyright (c) 2010 Jonas Krogsboell

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  */

  /**
   * <p>This package defines <em>PL/JSON</em>'s representation of the JSON
   * object type, e.g.:</p>
   *
   * <pre>
   * {
   *   "foo": "bar",
   *   "baz": 42
   * }
   * </pre>
   *
   * <p>The primary method exported by this package is the <code>pljson</code>
   * method.</p>
   *
   * <strong>Example:</strong>
   * <pre>
   * declare
   *   myjson pljson := pljson('{ "foo": "foo", "bar": [0, 1, 2], "baz": { "foobar": "foobar" } }');
   * begin
   *   myjson.get('foo').print(); // => dbms_output.put_line('foo')
   *   myjson.get('bar[1]').print(); // => dbms_output.put_line('0')
   *   myjson.get('baz.foobar').print(); // => dbms_output.put_line('foobar')
   * end;
   * </pre>
   *
   * @headcom
   */

  /* Variables */
  /** Private variable for internal processing. */
  json_data pljson_value_array,
  /** Private variable for internal processing. */
  check_for_duplicate number,

  /* Constructors */

  /**
   * <p>Primary constructor that creates an empty object.</p>
   *
   * <p>Internally, a <code>pljson</code> "object" is an array of values.</p>
   *
   * <pre>
   *   decleare
   *     myjson pljson := pljson();
   *   begin
   *     myjson.put('foo', 'bar');
   *     dbms_output.put_line(myjson.get('foo')); // "bar"
   *   end;
   * </pre>
   *
   * @return A <code>pljson</code> instance.
   */
  constructor function pljson return self as result,

  /**
   * <p>Construct a <code>pljson</code> instance from a given string of JSON.</p>
   *
   * <pre>
   *   decleare
   *     myjson pljson := pljson('{"foo": "bar"}');
   *   begin
   *     dbms_output.put_line(myjson.get('foo')); // "bar"
   *   end;
   * </pre>
   *
   * @param str The JSON to parse into a <code>pljson</code> object.
   * @return A <code>pljson</code> instance.
   */
  constructor function pljson(str varchar2) return self as result,

  /**
   * <p>Construct a <code>pljson</code> instance from a given CLOB of JSON.</p>
   *
   * @param str The CLOB to parse into a <code>pljson</code> object.
   * @return A <code>pljson</code> instance.
   */
  constructor function pljson(str in clob) return self as result,

  /**
   * <p>Construct a <code>pljson</code> instance from a given BLOB of JSON.</p>
   *
   * @param str The BLOB to parse into a <code>pljson</code> object.
   * @param charset The character set of the BLOB data (defaults to UTF-8).
   * @return A <code>pljson</code> instance.
   */
  constructor function pljson(str in blob, charset varchar2 default 'UTF8') return self as result,

  /**
   * <p>Construct a <code>pljson</code> instance from
   * a given table of key,value pairs of type varchar2.</p>
   *
   * @param str_array The pljson_varray (table of varchar2) to parse into a <code>pljson</code> object.
   * @return A <code>pljson</code> instance.
   */
  constructor function pljson(str_array pljson_varray) return self as result,

  /**
   * <p>Create a new <code>pljson</code> object from a current <code>pljson_value</code>.
   *
   * <pre>
   *   declare
   *    myjson pljson := pljson('{"foo": {"bar": "baz"}}');
   *    newjson pljson;
   *   begin
   *    newjson := pljson(myjson.get('foo').to_json_value())
   *   end;
   * </pre>
   *
   * @param elem The <code>pljson_value</code> to cast to a <code>pljson</code> object.
   * @return An instance of <code>pljson</code>.
   */
  constructor function pljson(elem pljson_value) return self as result,

  /**
   * <p>Create a new <code>pljson</code> object from a current <code>pljson_list</code>.
   *
   * @param l The array to create a new object from.
   * @return An instance of <code>pljson</code>.
   */
  constructor function pljson(l in out nocopy pljson_list) return self as result,

  /* Member setter methods */
  /**
   * <p>Remove a key and value from an object.</p>
   *
   * <pre>
   *   declare
   *     myjson pljson := pljson('{"foo": "foo", "bar": "bar"}')
   *   begin
   *     myjson.remove('bar'); // => '{"foo": "foo"}'
   *   end;
   * </pre>
   *
   * @param pair_name The key name to remove.
   */
  member procedure remove(pair_name varchar2),

  /**
   * <p>Add a <code>pljson</code> instance into the current instance under a
   * given key name.</p>
   *
   * @param pair_name Name of the key to add/update.
   * @param pair_value The value to associate with the key.
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson_value, position pls_integer default null),

  /**
   * <p>Add a <code>varchar2</code> instance into the current instance under a
   * given key name.</p>
   *
   * @param pair_name Name of the key to add/update.
   * @param pair_value The value to associate with the key.
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value varchar2, position pls_integer default null),

  /**
   * <p>Add a <code>number</code> instance into the current instance under a
   * given key name.</p>
   *
   * @param pair_name Name of the key to add/update.
   * @param pair_value The value to associate with the key.
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value number, position pls_integer default null),

  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  /**
   * <p>Add a <code>binary_double</code> instance into the current instance under a
   * given key name.</p>
   *
   * @param pair_name Name of the key to add/update.
   * @param pair_value The value to associate with the key.
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value binary_double, position pls_integer default null),

  /**
   * <p>Add a <code>boolean</code> instance into the current instance under a
   * given key name.</p>
   *
   * @param pair_name Name of the key to add/update.
   * @param pair_value The value to associate with the key.
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value boolean, position pls_integer default null),

  member procedure check_duplicate(self in out nocopy pljson, v_set boolean),
  member procedure remove_duplicates(self in out nocopy pljson),

  /*
   * had been marked as deprecated in favor of the overloaded method with pljson_value
   * the reason is unknown even though it is useful in coding
   * and removes the need for the user to do a conversion
   * also path_put function has same overloaded parameter and is not marked as deprecated
   *
   * after tests by trying to add new overloaded procedures, a theory has emerged
   * with all procedures there are cyclic type references and installation is not possible
   * so some procedures had to be removed, and these were meant to be removed
   *
   * but by careful package ordering and removing only a few procedures from pljson_list package
   * it is possible to compile the project without error and keep these procedures
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson, position pls_integer default null),
  /*
   * had been marked as deprecated in favor of the overloaded method with pljson_value
   * the reason is unknown even though it is useful in coding
   * and removes the need for the user to do a conversion
   * also path_put function has same overloaded parameter and is not marked as deprecated
   *
   * after tests by trying to add new overloaded procedures, a theory has emerged
   * with all procedures there are cyclic type references and installation is not possible
   * so some procedures had to be removed, and these were meant to be removed
   *
   * but by careful package ordering and removing only a few procedures from pljson_list package
   * it is possible to compile the project without error and keep these procedures
   */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson_list, position pls_integer default null),

  /* Member getter methods */
  /**
   * <p>Return the number values in the object. Essentially, the number of keys
   * in the object.</p>
   *
   * @return The number of values in the object.
   */
  member function count return number,

  /**
   * <p>Retrieve the value of a given key.</p>
   *
   * @param pair_name The name of the value to retrieve.
   * @return An instance of <code>pljson_value</code>, or <code>null</code>
   * if it could not be found.
   */
  member function get(pair_name varchar2) return pljson_value,

  /**
   * <p>Retrieve a value based on its position in the internal storage array.
   * It is recommended you use name based retrieval.</p>
   *
   * @param position Index of the value in the internal storage array.
   * @return An instance of <code>pljson_value</code>, or <code>null</code>
   * if it could not be found.
   */
  member function get(position pls_integer) return pljson_value,

  /**
   * <p>Determine the position of a given value within the internal storage
   * array.</p>
   *
   * @param pair_name The name of the value to retrieve the index for.
   * @return An index number, or <code>-1</code> if it could not be found.
   */
  member function index_of(pair_name varchar2) return number,

  /**
   * <p>Determine if a given value exists within the object.</p>
   *
   * @param pair_name The name of the value to check for.
   * @return <code>true</code> if the value exists, <code>false</code> otherwise.
   */
  member function exist(pair_name varchar2) return boolean,

  /* Output methods */
  /**
   * <p>Serialize the object to a JSON representation string.</p>
   *
   * @param spaces Enable pretty printing by formatting with spaces. Default: <code>true</code>.
   * @param chars_per_line Wrap output to a specific number of characters per line. Default: <code>0<code> (infinite).
   * @return A <code>varchar2</code> string.
   */
  member function to_char(spaces boolean default true, chars_per_line number default 0) return varchar2,

  /**
   * <p>Serialize the object to a JSON representation and store it in a CLOB.</p>
   *
   * @param buf The CLOB in which to store the results.
   * @param spaces Enable pretty printing by formatting with spaces. Default: <code>false</code>.
   * @param chars_per_line Wrap output to a specific number of characters per line. Default: <code>0<code> (infinite).
   * @param erase_clob Whether or not to wipe the storage CLOB prior to serialization. Default: <code>true</code>.
   * @return A <code>varchar2</code> string.
   */
  member procedure to_clob(self in pljson, buf in out nocopy clob, spaces boolean default false, chars_per_line number default 0, erase_clob boolean default true),

  /**
   * <p>Print a JSON representation of the object via <code>DBMS_OUTPUT</code>.</p>
   *
   * @param spaces Enable pretty printing by formatting with spaces. Default: <code>true</code>.
   * @param chars_per_line Wrap output to a specific number of characters per line. Default: <code>8192<code> (<code>32512</code> is maximum).
   * @param jsonp Name of a function for wrapping the output as JSONP. Default: <code>null</code>.
   * @return A <code>varchar2</code> string.
   */
  member procedure print(self in pljson, spaces boolean default true, chars_per_line number default 8192, jsonp varchar2 default null), --32512 is maximum

  /**
   * <p>Print a JSON representation of the object via <code>HTP.PRN</code>.</p>
   *
   * @param spaces Enable pretty printing by formatting with spaces. Default: <code>true</code>.
   * @param chars_per_line Wrap output to a specific number of characters per line. Default: <code>0<code> (infinite).
   * @param jsonp Name of a function for wrapping the output as JSONP. Default: <code>null</code>.
   * @return A <code>varchar2</code> string.
   */
  member procedure htp(self in pljson, spaces boolean default false, chars_per_line number default 0, jsonp varchar2 default null),

  /**
   * <p>Convert the object to a <code>pljson_value</code> for use in other methods
   * of the PL/JSON API.</p>
   *
   * @returns An instance of <code>pljson_value</code>.
   */
  member function to_json_value return pljson_value,

  /* json path */
  /**
   * <p>Retrieve a value from the internal storage array based on a path string
   * and a starting index.</p>
   *
   * @param json_path A string path, e.g. <code>'foo.bar[1]'</code>.
   * @param base The index in the internal storage array to start from.
   * This should only be necessary under special circumstances. Default: <code>1</code>.
   * @return An instance of <code>pljson_value</code>.
   */
  member function path(json_path varchar2, base number default 1) return pljson_value,

  /* json path_put */
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson_value, base number default 1),
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem varchar2, base number default 1),
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem number, base number default 1),
  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem binary_double, base number default 1),
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem boolean, base number default 1),
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson_list, base number default 1),
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson, base number default 1),

  /* json path_remove */
  member procedure path_remove(self in out nocopy pljson, json_path varchar2, base number default 1),

  /* map functions */
  /**
   * <p>Retrieve all of the values within the object as a <code>pljson_list</code>.</p>
   *
   * <pre>
   * myjson := pljson('{"foo": "bar"}');
   * myjson.get_values(); // ['bar']
   * </pre>
   *
   * @return An instance of <code>pljson_list</code>.
   */
  member function get_values return pljson_list,

  /**
   * <p>Retrieve all of the keys within the object as a <code>pljson_list</code>.</p>
   *
   * <pre>
   * myjson := pljson('{"foo": "bar"}');
   * myjson.get_keys(); // ['foo']
   * </pre>
   *
   * @return An instance of <code>pljson_list</code>.
   */
  member function get_keys return pljson_list

) not final;
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."PLJSON" as

  /* Constructors */
  constructor function pljson return self as result as
  begin
    self.json_data := pljson_value_array();
    self.check_for_duplicate := 1;
    return;
  end;

  constructor function pljson(str varchar2) return self as result as
  begin
    self := pljson_parser.parser(str);
    self.check_for_duplicate := 1;
    return;
  end;

  constructor function pljson(str in clob) return self as result as
  begin
    self := pljson_parser.parser(str);
    self.check_for_duplicate := 1;
    return;
  end;

  constructor function pljson(str in blob, charset varchar2 default 'UTF8') return self as result as
    c_str clob;
  begin
    pljson_ext.blob2clob(str, c_str, charset);
    self := pljson_parser.parser(c_str);
    self.check_for_duplicate := 1;
    dbms_lob.freetemporary(c_str);
    return;
  end;

  constructor function pljson(str_array pljson_varray) return self as result as
    new_pair boolean := True;
    pair_name varchar2(32767);
    pair_value varchar2(32767);
  begin
    self.json_data := pljson_value_array();
    self.check_for_duplicate := 1;
    for i in str_array.FIRST .. str_array.LAST loop
      if new_pair then
        pair_name := str_array(i);
        new_pair := False;
      else
        pair_value := str_array(i);
        put(pair_name, pair_value);
        new_pair := True;
      end if;
    end loop;
    return;
  end;

  constructor function pljson(elem pljson_value) return self as result as
  begin
    self := treat(elem.object_or_array as pljson);
    self.check_for_duplicate := 1;
    return;
  end;

  constructor function pljson(l in out nocopy pljson_list) return self as result as
  begin
    for i in 1 .. l.list_data.count loop
      if(l.list_data(i).mapname is null or l.list_data(i).mapname like 'row%') then
      l.list_data(i).mapname := 'row'||i;
      end if;
      l.list_data(i).mapindx := i;
    end loop;

    self.json_data := l.list_data;
    self.check_for_duplicate := 1;
    return;
  end;

  /* Member setter methods */
  member procedure remove(self in out nocopy pljson, pair_name varchar2) as
    temp pljson_value;
    indx pls_integer;

    function get_member(pair_name varchar2) return pljson_value as
      indx pls_integer;
    begin
      indx := json_data.first;
      loop
        exit when indx is null;
        if(pair_name is null and json_data(indx).mapname is null) then return json_data(indx); end if;
        if(json_data(indx).mapname = pair_name) then return json_data(indx); end if;
        indx := json_data.next(indx);
      end loop;
      return null;
    end;
  begin
    temp := get_member(pair_name);
    if(temp is null) then return; end if;

    indx := json_data.next(temp.mapindx);
    loop
      exit when indx is null;
      json_data(indx).mapindx := indx - 1;
      json_data(indx-1) := json_data(indx);
      indx := json_data.next(indx);
    end loop;
    json_data.trim(1);
    --num_elements := num_elements - 1;
  end;

  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson_value, position pls_integer default null) as
    insert_value pljson_value := nvl(pair_value, pljson_value.makenull);
    indx pls_integer; x number;
    temp pljson_value;
    function get_member(pair_name varchar2) return pljson_value as
      indx pls_integer;
    begin
      indx := json_data.first;
      loop
        exit when indx is null;
        if(pair_name is null and json_data(indx).mapname is null) then return json_data(indx); end if;
        if(json_data(indx).mapname = pair_name) then return json_data(indx); end if;
        indx := json_data.next(indx);
      end loop;
      return null;
    end;
  begin
    --dbms_output.put_line('PN '||pair_name);

    --if(pair_name is null) then
    --  raise_application_error(-20102, 'JSON put-method type error: name cannot be null');
    --end if;
    insert_value.mapname := pair_name;
    --self.remove(pair_name);
    if(self.check_for_duplicate = 1) then temp := get_member(pair_name); else temp := null; end if;
    if(temp is not null) then
      insert_value.mapindx := temp.mapindx;
      json_data(temp.mapindx) := insert_value;
      return;
    elsif(position is null or position > self.count) then
      --insert at the end of the list
      --dbms_output.put_line('Test');
      --indx := self.count + 1;
      json_data.extend(1);
      /* changed to common style of updating mapindx; fix bug in assignment order */
      insert_value.mapindx := json_data.count;
      json_data(json_data.count) := insert_value;
      --dbms_output.put_line('Test2'||insert_value.mapindx);
      --dbms_output.put_line('Test2'||insert_value.mapname);
      --self.print;
    elsif(position < 2) then
      --insert at the start of the list
      indx := json_data.last;
      json_data.extend;
      loop
        exit when indx is null;
        temp := json_data(indx);
        temp.mapindx := indx+1;
        json_data(temp.mapindx) := temp;
        indx := json_data.prior(indx);
      end loop;
      /* changed to common style of updating mapindx; fix bug in assignment order */
      insert_value.mapindx := 1;
      json_data(1) := insert_value;
    else
      --insert somewhere in the list
      indx := json_data.last;
      --dbms_output.put_line('Test '||indx);
      json_data.extend;
      --dbms_output.put_line('Test '||indx);
      loop
        --dbms_output.put_line('Test '||indx);
        temp := json_data(indx);
        temp.mapindx := indx + 1;
        json_data(temp.mapindx) := temp;
        exit when indx = position;
        indx := json_data.prior(indx);
      end loop;
      /* changed to common style of updating mapindx; fix bug in assignment order */
      insert_value.mapindx := position;
      json_data(position) := insert_value;
    end if;
    --num_elements := num_elements + 1;
  end;

  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value varchar2, position pls_integer default null) as
  begin
    put(pair_name, pljson_value(pair_value), position);
  end;

  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value number, position pls_integer default null) as
  begin
    if(pair_value is null) then
      put(pair_name, pljson_value(), position);
    else
      put(pair_name, pljson_value(pair_value), position);
    end if;
  end;

  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value binary_double, position pls_integer default null) as
  begin
    if(pair_value is null) then
      put(pair_name, pljson_value(), position);
    else
      put(pair_name, pljson_value(pair_value), position);
    end if;
  end;

  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value boolean, position pls_integer default null) as
  begin
    if(pair_value is null) then
      put(pair_name, pljson_value(), position);
    else
      put(pair_name, pljson_value(pair_value), position);
    end if;
  end;

  member procedure check_duplicate(self in out nocopy pljson, v_set boolean) as
  begin
    if(v_set) then
      check_for_duplicate := 1;
    else
      check_for_duplicate := 0;
    end if;
  end;

  /* deprecated putters */
  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson, position pls_integer default null) as
  begin
    if(pair_value is null) then
      put(pair_name, pljson_value(), position);
    else
      put(pair_name, pair_value.to_json_value, position);
    end if;
  end;

  member procedure put(self in out nocopy pljson, pair_name varchar2, pair_value pljson_list, position pls_integer default null) as
  begin
    if(pair_value is null) then
      put(pair_name, pljson_value(), position);
    else
      put(pair_name, pair_value.to_json_value, position);
    end if;
  end;

  /* Member getter methods */
  member function count return number as
  begin
    return self.json_data.count;
  end;

  member function get(pair_name varchar2) return pljson_value as
    indx pls_integer;
  begin
    indx := json_data.first;
    loop
      exit when indx is null;
      if(pair_name is null and json_data(indx).mapname is null) then return json_data(indx); end if;
      if(json_data(indx).mapname = pair_name) then return json_data(indx); end if;
      indx := json_data.next(indx);
    end loop;
    return null;
  end;

  member function get(position pls_integer) return pljson_value as
  begin
    if(self.count >= position and position > 0) then
      return self.json_data(position);
    end if;
    return null; -- do not throw error, just return null
  end;

  member function index_of(pair_name varchar2) return number as
    indx pls_integer;
  begin
    indx := json_data.first;
    loop
      exit when indx is null;
      if(pair_name is null and json_data(indx).mapname is null) then return indx; end if;
      if(json_data(indx).mapname = pair_name) then return indx; end if;
      indx := json_data.next(indx);
    end loop;
    return -1;
  end;

  member function exist(pair_name varchar2) return boolean as
  begin
    return (self.get(pair_name) is not null);
  end;

  /* Output methods */
  member function to_char(spaces boolean default true, chars_per_line number default 0) return varchar2 as
  begin
    if(spaces is null) then
      return pljson_printer.pretty_print(self, line_length => chars_per_line);
    else
      return pljson_printer.pretty_print(self, spaces, line_length => chars_per_line);
    end if;
  end;

  member procedure to_clob(self in pljson, buf in out nocopy clob, spaces boolean default false, chars_per_line number default 0, erase_clob boolean default true) as
  begin
    if(spaces is null) then
      pljson_printer.pretty_print(self, false, buf, line_length => chars_per_line, erase_clob => erase_clob);
    else
      pljson_printer.pretty_print(self, spaces, buf, line_length => chars_per_line, erase_clob => erase_clob);
    end if;
  end;

  member procedure print(self in pljson, spaces boolean default true, chars_per_line number default 8192, jsonp varchar2 default null) as --32512 is the real maximum in sqldeveloper
    my_clob clob;
  begin
    my_clob := empty_clob();
    dbms_lob.createtemporary(my_clob, true);
    pljson_printer.pretty_print(self, spaces, my_clob, case when (chars_per_line>32512) then 32512 else chars_per_line end);
    pljson_printer.dbms_output_clob(my_clob, pljson_printer.newline_char, jsonp);
    dbms_lob.freetemporary(my_clob);
  end;

  member procedure htp(self in pljson, spaces boolean default false, chars_per_line number default 0, jsonp varchar2 default null) as
    my_clob clob;
  begin
    my_clob := empty_clob();
    dbms_lob.createtemporary(my_clob, true);
    pljson_printer.pretty_print(self, spaces, my_clob, chars_per_line);
    pljson_printer.htp_output_clob(my_clob, jsonp);
    dbms_lob.freetemporary(my_clob);
  end;

  member function to_json_value return pljson_value as
  begin
    return pljson_value(self);
  end;

  /* json path */
  member function path(json_path varchar2, base number default 1) return pljson_value as
  begin
    return pljson_ext.get_json_value(self, json_path, base);
  end path;

  /* json path_put */
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson_value, base number default 1) as
  begin
    pljson_ext.put(self, json_path, elem, base);
  end path_put;

  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem varchar2, base number default 1) as
  begin
    pljson_ext.put(self, json_path, elem, base);
  end path_put;

  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem number, base number default 1) as
  begin
    if(elem is null) then
      pljson_ext.put(self, json_path, pljson_value(), base);
    else
      pljson_ext.put(self, json_path, elem, base);
    end if;
  end path_put;

  /* E.I.Sarmas (github.com/dsnz)   2016-12-01   support for binary_double numbers */
  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem binary_double, base number default 1) as
  begin
    if(elem is null) then
      pljson_ext.put(self, json_path, pljson_value(), base);
    else
      pljson_ext.put(self, json_path, elem, base);
    end if;
  end path_put;

  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem boolean, base number default 1) as
  begin
    if(elem is null) then
      pljson_ext.put(self, json_path, pljson_value(), base);
    else
      pljson_ext.put(self, json_path, elem, base);
    end if;
  end path_put;

  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson_list, base number default 1) as
  begin
    if(elem is null) then
      pljson_ext.put(self, json_path, pljson_value(), base);
    else
      pljson_ext.put(self, json_path, elem, base);
    end if;
  end path_put;

  member procedure path_put(self in out nocopy pljson, json_path varchar2, elem pljson, base number default 1) as
  begin
    if(elem is null) then
      pljson_ext.put(self, json_path, pljson_value(), base);
    else
      pljson_ext.put(self, json_path, elem, base);
    end if;
  end path_put;

  member procedure path_remove(self in out nocopy pljson, json_path varchar2, base number default 1) as
  begin
    pljson_ext.remove(self, json_path, base);
  end path_remove;

  /* Thanks to Matt Nolan */
  member function get_keys return pljson_list as
    keys pljson_list;
    indx pls_integer;
  begin
    keys := pljson_list();
    indx := json_data.first;
    loop
      exit when indx is null;
      keys.append(json_data(indx).mapname);
      indx := json_data.next(indx);
    end loop;
    return keys;
  end;

  member function get_values return pljson_list as
    vals pljson_list := pljson_list();
  begin
    vals.list_data := self.json_data;
    return vals;
  end;

  member procedure remove_duplicates(self in out nocopy pljson) as
  begin
    pljson_parser.remove_duplicates(self);
  end remove_duplicates;

end;
/
  GRANT EXECUTE ON "DL_COMMON"."PLJSON" TO PUBLIC;
