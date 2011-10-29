<cfparam name="items" default="3">

<cfoutput>
  <cfset obj = createObject("component", "#application.commonCFC#")>
  <h1>#obj.GetCategory(url.catid).name# - Featured Properties</h1>
  <div class="cboth"></div>
  <cfset myQuery = obj.GetFProperty(url.catid)/>
  <cfset i = 0>
  <cfif isDefined("url.items")>
  <cfset items = url.items>
  </cfif>
  
</cfoutput>

 <cfoutput query="myQuery"  maxrows="#items#">
  <cfset i = i+1>
  <cfset qryStr = "id=#id#">
  <div class="w33p floatL">
    <div class="contentHolder"> <img src="#application.uploadPath##ListFirst(photos)#" class="tbnl" align="left" />
      <h1>
	  <a href="#application.basePath#detail.cfm?#qryStr#">#title#</a></h1>
      <p>#description#</p>
      <p> <a href="#application.basePath#detail.cfm?#qryStr#">&raquo; See Details</a></p>
    </div>
  </div>
  <cfif not ( i mod 3 neq 0 )>
    <div class="cboth"></div>
  </cfif>
</cfoutput> 