<cfparam name="keyword" default="">
<cfparam name="type" default="name">
<cfparam name="page" default="1">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>

<cfset obj = createObject("component", "#application.commonCFC#")>

<cfset myQuery = obj.ListFCategories()/>

<cfset pagination = createObject("component", "#application.cfcPath#.Pagination").init()/>
<cfset pagination.setQueryToPaginate(myQuery) />
<cfset pagination.setItemsPerPage(10) />
<cfset pagination.setUrlPageIndicator("page") />
<cfset pagination.setShowNumericLinks(true) />
<cfinclude template="#application.incPath#header.cfm">

<cfoutput>
  <h1>Featured Categories List</h1>
  <table class="noborder">
    <tr>
      <td><input name="newcategory" type="button" value="Add New Featured Category" onclick="javascript:$(location).attr('href','#application.incPath#featured_category_add.cfm');" /></td>
    </tr>
  </table>
</cfoutput>
<cfif myQuery.recordCount>
  <table class="gridd">
    <tr>
      <th>Featured Category Name</th>
	  <th>Order</th>
      <th>actions</th>
    </tr>
    <cfoutput query="myQuery" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
      <tr>
        <td>#obj.GetCategory(category_id).name#</td>
		<td>#ordernum#</td>
        <td><cfset qryStr = "id=#id#&page=#page#">
          <a href="featured_category_edit.cfm?#qryStr#">edit</a> | <a href="featured_category_delete.cfm?#qryStr#" onclick="javascript:return confirm('You are about delete this record. Are you sure.')">delete</a></td>
      </tr>
    </cfoutput>
  </table>
  <p><cfoutput>#pagination.getRenderedHTML()#</cfoutput></p>
  <cfelse>
  <h2>No records found</h2>
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
