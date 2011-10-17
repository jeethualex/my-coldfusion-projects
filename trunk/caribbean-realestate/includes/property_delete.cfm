<cfinclude template="#application.incPath#header.cfm">
<cfparam name="page" default="1">
<cfset REQUEST.FileCount = 5 />
<cfset REQUEST.UploadPath = ExpandPath( "../uploads/" ) />
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("url.id")>
  <cfset obj = createObject("component", "#application.commonCFC#")/>
  <cfset photos=obj.GetProperty(id).photos/>
  <cfset photo = ListToArray(photos)>
  <cfset IsDeleted = true>
  <cftry>
    <cfloop index="intFileIndex" from="1" to="#ArrayLen(photo)#" step="1">
      <cfset DelFile = "#REQUEST.UploadPath##photo[intFileIndex]#">
      <!---<cfif FileExists(ExpandPath(DelFile))>--->
	  <cffile action="delete" file="#DelFile#" />
	  <!---</cfif>--->
    </cfloop>
	
    <cfset success = obj.DeleteProperty(id)/>
    <cfcatch type="any">
      <cfset IsDeleted = false>
	  <cfdump var="#cfcatch#">
	  <cfabort>
    </cfcatch>
  </cftry>
  
</cfif>
<cfif isDefined("success") and success>
  <cfset urlLoc = "property_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#page#">
  <cflocation url="#urlLoc#" addtoken="no">
  <cfelse>
  <cflocation url="property_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
