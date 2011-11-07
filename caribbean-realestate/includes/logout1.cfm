<cfset Structclear(session)>

<cfif IsDefined("url.err") and err eq 1>
<cfif IsDefined("session.urlpath") >
<cfset urlpath="#session.urlpath#">
<cfset url1="#application.basePath##urlpath#?err=#url.err#">
<cfelse>
<cfset url1="#application.basePath#index.cfm?err=#url.err#">
</cfif>
<cfelse>
<cfset url1="#application.basePath#index.cfm">
</cfif>

<cflocation url="#url1#" addtoken="no">

