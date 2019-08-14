CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_DL_AUTHORIZATION" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for authorization in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: C. Funke $<br/>
  * @date    $Date:  05/12/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  procedure Define_Landing_Page(p_username in Varchar2);

end;
/
