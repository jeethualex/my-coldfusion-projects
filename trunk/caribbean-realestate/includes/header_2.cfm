
<cfset IsSecurePage = ListFindNoCase("detail.cfm",listlast(cgi.script_name,"/\") , ",") neq 0>
<cfset IsLoginPrivilege = IsDefined("session.privilege")>
<cfif IsSecurePage>
  <cfif not IsLoginPrivilege>
  <cfset session.urlpath="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#">
    <cflocation url="#application.basePath#index.cfm?err=2" addtoken="no">
  </cfif>
</cfif>

<cfset obj = createObject("component", "#application.commonCFC#")>
<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CARIBBEANREALESTATE.com</title>
<link href="#application.cssPath#style_1.css" rel="stylesheet" type="text/css" />
<script src="http://craigsworks.com/projects/qtip/packages/jquery-1.3.2.js"></script>
<script type="text/javascript" src="http://craigsworks.com/projects/qtip/packages/1.0.0-rc3/jquery.qtip-1.0.0-rc3.js"></script>
</head>
<body>
<div class="header">
  <div class="wrap">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><p><a href="#application.basePath#index.cfm" class="heading" style="margin-left:0;">CARIBBEANREALESTATE.com</a> <a href="##" class="glue">Sign up</a> 
		<cfif not IsLoginPrivilege>
		
		<a href="##" class="blueColor" onclick="Show_Popup();">Login</a> 
		<cfelse>
		<a href="#application.incPath#logout1.cfm" class="blueColor">Logout</a> 
		</cfif>
		<a href="##">News</a>
            <!--<a href="##">Browse</a> <a href="##">Music</a> <a href="##">Topics</a> <a href="##">Video Games</a>-->
          </p></td>
        <td align="right" width="300"><table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#111.png" align="left" border="0"/></a></td>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#222.png" align="left" border="0"/></a></td>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#333.png" align="left" border="0"/></a></td>
            </tr>
          </table>
          <!-- <td align="right"><input type="text" name="q" id="q" class="q"></td>
        <td width="60"><input name="Search" type="button" value="GO" class="qs" onclick="javascript:alert('Clicked');" />-->
        </td>
      </tr>
    </table>
  </div>
</div>
<div class="outer">
<div class="banner">
<!--Second Page-->
<div class="Banner5"></div>
</cfoutput>