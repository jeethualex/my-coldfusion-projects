<cfinclude template="#application.incPath#header.cfm">

<cfif IsDefined("session.id")>
  <cfset user = createObject("component", "#application.commonCFC#").GetUser(session.id)/>
  <cfoutput>
    <h1>Welcome #user.username#</h1>
  </cfoutput>
  <cfelse>
  <cflocation url="#application.incPath#login.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
