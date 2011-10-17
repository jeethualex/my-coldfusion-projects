<cfparam name="keyword" default="">
<cfparam name="type" default="username">
<cfparam name="page" default="1">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("form.Clear")>
  <cfset StructDelete(Session,"keyword")>
  <cfset StructDelete(Session,"type")>
</cfif>
<cfif IsDefined("form.Submit")>
  <cfset keyword = form.keyword>
  <cfset type = form.type>
  <cfif keyword neq "">
    <cfset session.keyword = "#keyword#">
    <cfset session.type = "#type#">
    <cfset myQuery = createObject("component", "#application.commonCFC#").SearchUser(form)/>
    <cfelse>
    <cfset StructDelete(Session,"keyword")>
    <cfset StructDelete(Session,"type")>
    <cfset myQuery = createObject("component", "#application.commonCFC#").ListUsers()/>
  </cfif>
  <cfelseif IsDefined("session.type") and IsDefined("session.keyword")>
  <cfset frm = StructNew()>
  <cfset frm.keyword = "#session.keyword#">
  <cfset frm.type = "#session.type#">
  <cfset keyword = frm.keyword>
  <cfset type = frm.type>
  <cfset myQuery = createObject("component", "#application.commonCFC#").SearchUser(frm)/>
  <cfelse>
  <cfset myQuery = createObject("component", "#application.commonCFC#").ListUsers()/>
</cfif>
<cfset pagination = createObject("component", "#application.cfcPath#.Pagination").init()/>
<cfset pagination.setQueryToPaginate(myQuery) />
<cfset pagination.setItemsPerPage(10) />
<cfset pagination.setUrlPageIndicator("page") />
<cfset pagination.setShowNumericLinks(true) />
<cfinclude template="#application.incPath#header.cfm">

<cfoutput>
  <h1>Users List</h1>
  <table class="noborder">
    <tr>
      <td><h4>Search a User</h4></td>
      <td><form action="" method="post" id="aForm" >
          <input id="keyword" name="keyword" type="text" maxlength="50" value="#keyword#"/>
          <select name="type">
            <option value="username" <cfif type eq "username">selected="selected"</cfif>>username</option>
            <option value="email" <cfif type eq "email">selected="selected"</cfif>>email</option>
            <option value="phone" <cfif type eq "phone">selected="selected"</cfif>>phone</option>
          </select>
          <input name="Submit" type="submit" value="Submit" />
          <input name="Clear" type="submit" value="Clear" onclick="javascript:$('##keyword').val('');" />
        </form></td>
      <td>|
        <input name="newuser" type="button" value="Add New User" onclick="javascript:$(location).attr('href','#application.incPath#user_add.cfm');" /></td>
    </tr>
  </table>
</cfoutput>
<cfif myQuery.recordCount>
  <table>
    <tr>
      <th>username</th>
      <th>password</th>
      <th>privilege</th>
      <th>email</th>
      <th>phone</th>
      <th>expiry</th>
      <th>actions</th>
    </tr>
    <cfoutput query="myQuery" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
      <tr>
        <td>#username#</td>
        <td>#password#</td>
        <td>#privilege#</td>
        <td>#email#</td>
        <td>#phone#</td>
        <td>#DateFormat(expiry,"dd-mmm-yyyy")#</td>
        <td><cfset qryStr = "id=#id#&page=#page#">
          <a href="user_edit.cfm?#qryStr#">edit</a> | <a href="user_delete.cfm?#qryStr#" onclick="javascript:return confirm('You are about delete this record. Are you sure.')">delete</a></td>
      </tr>
    </cfoutput>
  </table>
  <p><cfoutput>#pagination.getRenderedHTML()#</cfoutput></p>
  <cfelse>
  <h2>No records found</h2>
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
