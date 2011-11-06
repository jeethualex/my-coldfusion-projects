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
    <cfset myQuery = createObject("component", "#application.commonCFC#").SearchNews(form)/>
    <cfelse>
    <cfset StructDelete(Session,"keyword")>
    <cfset StructDelete(Session,"type")>
    <cfset myQuery = createObject("component", "#application.commonCFC#").ListNews()/>
  </cfif>
  <cfelseif IsDefined("session.type") and IsDefined("session.keyword")>
  <cfset frm = StructNew()>
  <cfset frm.keyword = "#session.keyword#">
  <cfset frm.type = "#session.type#">
  <cfset keyword = frm.keyword>
  <cfset type = frm.type>
  <cfset myQuery = createObject("component", "#application.commonCFC#").SearchNews(frm)/>
  <cfelse>
  <cfset myQuery = createObject("component", "#application.commonCFC#").ListNews()/>
</cfif>
<cfset pagination = createObject("component", "#application.cfcPath#.Pagination").init()/>
<cfset pagination.setQueryToPaginate(myQuery) />
<cfset pagination.setItemsPerPage(10) />
<cfset pagination.setUrlPageIndicator("page") />
<cfset pagination.setShowNumericLinks(true) />
<cfinclude template="#application.incPath#header.cfm">

<cfoutput>
  <h1>News List</h1>
  <table class="noborder">
    <tr>
      <td><h4>Search a News</h4></td>
      <td><form action="" method="post" id="aForm" >
          <input id="keyword" name="keyword" type="text" maxlength="50" value="#keyword#"/>
          <input name="type" type="hidden" value="title" />
          <input name="Submit" type="submit" value="Submit" />
          <input name="Clear" type="submit" value="Clear" onclick="javascript:$('##keyword').val('');" />
        </form></td>
      <td>|
        <input name="newuser" type="button" value="Add New News" onclick="javascript:$(location).attr('href','#application.incPath#news_add.cfm');" /></td>
    </tr>
  </table>
</cfoutput>
<cfif myQuery.recordCount>
  <table width="700" class="gridd">
    <tr>
      <th>title</th>
      <th>summary</th>
      <th>detail news</th>
      <th>posted on</th>
      <th>featured</th>
      <th>actions</th>
    </tr>
    <cfoutput query="myQuery" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
      <tr>
        <td>#title#</td>
        <td>#summary#</td>
        <td>#detail#</td>
        <td nowrap="nowrap">#DateFormat(posted,"dd-mmm-yyyy")#</td>
        <td><cfif featured eq 1> Yes <cfelse> No </cfif></td>
        <td nowrap="nowrap"><cfset qryStr = "id=#id#&page=#page#">
          <a href="news_edit.cfm?#qryStr#">edit</a> | <a href="news_delete.cfm?#qryStr#" onclick="javascript:return confirm('You are about delete this record. Are you sure.')">delete</a></td>
      </tr>
    </cfoutput>
  </table>
  <p><cfoutput>#pagination.getRenderedHTML()#</cfoutput></p>
  <cfelse>
  <h2>No records found</h2>
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
