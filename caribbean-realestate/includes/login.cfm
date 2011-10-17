<cfif IsDefined("form.Submit")>
  <cfset qry = createObject("component", "#application.commonCFC#").CheckUser(form)/>
  <!---<cfdump var="#qry#">--->
  <cfif qry.recordcount>
    <cfset session.id=qry.id>
    <cfset session.privilege=qry.privilege>
    <cflocation url="#application.basePath#admin.cfm" addtoken="no">
    <cfelse>
    <cflocation url="#application.incPath#logout.cfm" addtoken="no">
  </cfif>
</cfif>
<cfinclude template="#application.incPath#header.cfm">

<cfoutput>
  <h1>User Login</h1>
  <form action="" method="post">
    <table class="noborder">
      <tr>
        <td>username</td>
        <td><input name="username" type="text" maxlength="50"></td>
      </tr>
      <tr>
        <td>password</td>
        <td><input name="password" type="password" maxlength="30"></td>
      </tr>
      <tr>
        <td colspan="2"><input name="submit" type="submit" value="Submit"></td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
