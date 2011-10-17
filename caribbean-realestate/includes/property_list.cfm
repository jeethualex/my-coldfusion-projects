<cfparam name="keyword" default="">
<cfparam name="type" default="title">
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
    <cfset myQuery = createObject("component", "#application.commonCFC#").SearchProperty(form)/>
    <cfelse>
    <cfset StructDelete(Session,"keyword")>
    <cfset StructDelete(Session,"type")>
    <cfset myQuery = createObject("component", "#application.commonCFC#").ListProperties()/>
  </cfif>
  <cfelseif IsDefined("session.type") and IsDefined("session.keyword")>
  <cfset frm = StructNew()>
  <cfset frm.keyword = "#session.keyword#">
  <cfset frm.type = "#session.type#">
  <cfset keyword = frm.keyword>
  <cfset type = frm.type>
  <cfset myQuery = createObject("component", "#application.commonCFC#").SearchProperty(frm)/>
  <cfelse>
  <cfset myQuery = createObject("component", "#application.commonCFC#").ListProperties()/>
</cfif>
<cfset pagination = createObject("component", "#application.cfcPath#.Pagination").init()/>
<cfset pagination.setQueryToPaginate(myQuery) />
<cfset pagination.setItemsPerPage(10) />
<cfset pagination.setUrlPageIndicator("page") />
<cfset pagination.setShowNumericLinks(true) />
<cfinclude template="#application.incPath#header.cfm">

<cfoutput>
  <h1>Properties List</h1>
  <table class="noborder">
    <tr>
      <td><h4>Search a Property</h4></td>
      <td><form action="" method="post" id="aForm" >
          <input id="keyword" name="keyword" type="text" maxlength="50" value="#keyword#"/>
          <input name="type" type="hidden" value="title" />
          <input name="Submit" type="submit" value="Submit" />
          <input name="Clear" type="submit" value="Clear" onclick="javascript:$('##keyword').val('');" />
        </form></td>
      <td>|
        <input name="newproperty" type="button" value="Add New Property" onclick="javascript:$(location).attr('href','#application.incPath#property_add.cfm');" /></td>
    </tr>
  </table>
</cfoutput>
<cfif myQuery.recordCount>
  <table>
    <tr>
      <th>title</th>
      <th>description</th>
      <th>category</th>
      <th>bedrooms</th>
      <th>bathrooms</th>
      <th>size</th>
      <th>price</th>
      <th>location</th>
      <th>aminities</th>
      <th>photos</th>
      <th>featured</th>
      <th>status</th>
      <th>posted on</th>
      <th>actions</th>
    </tr>
	<cfset obj = createObject("component", "#application.commonCFC#")/>
    <cfoutput query="myQuery" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
      <tr>
        <td>#Left(title,"15")#...</td>
        <td>#Left(description,"30")#...</td>
        <td>#obj.GetCategory(category_id).name#</td>
        <td>#bedrooms#</td>
        <td>#bathrooms#</td>
        <td>#size#</td>
        <td>#price#</td>
        <td><cfloop list="#location#" index="ListItem" delimiters=",">
            #ListItem#<br />
          </cfloop>
        </td>
        <td><cfloop list="#aminities#" index="ListItem" delimiters=",">
            #ListItem#<br />
          </cfloop>
        </td>
        <td>
		<cfif photos neq "">
		<cfloop list="#photos#" index="ListItem" delimiters=",">
            #ListItem#<br />
          </cfloop>
		  <cfelse>
		  None
		  </cfif>
		  </td>
        <td>
		<cfif featured eq 1> Yes <cfelse> No</cfif>
		</td>
        <td><cfif status eq 1> Open<cfelse> Closed </cfif></td>
        <td>#DateFormat(posted,'dd/mm/yyyy')#</td>
        <td><cfset qryStr = "id=#id#&page=#page#">
          <a href="property_edit.cfm?#qryStr#">edit</a> | <a href="property_delete.cfm?#qryStr#" onclick="javascript:return confirm('You are about delete this record. Are you sure.')">delete</a></td>
      </tr>
    </cfoutput>
  </table>
  <p><cfoutput>#pagination.getRenderedHTML()#</cfoutput></p>
  <cfelse>
  <h2>No records found</h2>
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
