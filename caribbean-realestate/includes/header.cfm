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
<title>Real Estate Project</title>
<cfoutput>
  <link href="#application.cssPath#style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="#application.jsPath#script.js"></script>
</cfoutput>
</head>
<body>
<cfif not IsLoginPage>
  <cfinclude template="#application.incPath#menu.cfm">
</cfif>
