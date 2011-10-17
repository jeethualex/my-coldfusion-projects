<cfinclude template="#application.incPath#header.cfm">
<cfparam name="page" default="1">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("url.id")>
  <cfset success = createObject("component", "#application.commonCFC#").DeleteUser(id)/>
</cfif>
<cfif isDefined("success") and success>
  <cfset urlLoc = "user_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#page#">
  <cflocation url="#urlLoc#" addtoken="no">
  <cfelse>
  <cflocation url="user_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
