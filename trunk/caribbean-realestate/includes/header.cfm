<cfset IsLoginPage = FindNoCase("login","#cgi.SCRIPT_NAME#")>
<cfset IsAdminPage = ListFindNoCase("user_add.cfm,user_edit.cfm,user_delete.cfm,user_list.cfm",listlast(cgi.script_name,"/\") , ",") neq 0>
<cfset IsAdminPrivilege = IsDefined("session.privilege") AND session.privilege eq 1>
<!---<cfdump var="#IsAdminPrivilege#">
<cfdump var="#IsAdminPage#">--->
<cfif not IsLoginPage>
  <cfif not IsDefined("session.id")>
    <cflocation url="#application.incPath#login.cfm" addtoken="no">
  </cfif>
</cfif>
<cfif IsAdminPage>
  <cfif not IsAdminPrivilege>
    <cflocation url="#application.basePath#index.cfm" addtoken="no">
  </cfif>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CARIBBEANREALESTATE.com</title>
<cfoutput>
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="#application.jsPath#script.js"></script>
  
  <link href="#application.cssPath#style_1.css" rel="stylesheet" type="text/css" />
<!---  <link href="#application.cssPath#style.css" rel="stylesheet" type="text/css" />
---></cfoutput>
</head>
<body>


<cfoutput><div class="header">
  <div class="wrap">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><p>
		
		<a href="#application.basePath#index.cfm" class="heading" style="margin-left:0;">CARIBBEANREALESTATE.com</a>
		
		
          </p></td>
        <td align="right" width="300"><table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><p><strong>Administrator Control Panel</strong></p></td>
              
            </tr>
          </table>
          <!-- <td align="right"><input type="text" name="q" id="q" class="q"></td>
        <td width="60"><input name="Search" type="button" value="GO" class="qs" onclick="javascript:alert('Clicked');" />-->
        </td>
      </tr>
    </table>
  </div>
</div></cfoutput>



<div class="outer">
<div class="banner">
<!--Second Page-->
<div class="Banner5"></div>
</div>



<div class="content tabcontent checkerLightBG">
  <a name="featured_properties"></a>
    <table border="0" cellpadding="2" cellspacing="0" class="categories noborder">
      <tr><td align="center">
	  <cfif not IsLoginPage>
  <cfinclude template="#application.incPath#menu.cfm">
</cfif></td>
	   </tr>
    </table>
  </div>



<div class="content">
<div class="contentHolder">



