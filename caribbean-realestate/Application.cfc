<cfcomponent>
<cfscript>
       this.name = "Real_Estate";
       this.applicationTimeout = createTimeSpan(0,0,0,1);
       this.clientmanagement= "yes";
       this.loginstorage = "session" ;
       this.sessionmanagement = "yes";
       this.sessiontimeout = createTimeSpan(0,0,0,600);
       this.setClientCookies = "yes";
       this.setDomainCookies = "no";
       this.scriptProtect = "all";   
   </cfscript>
<cffunction name="onApplicationStart" output="false">
  <cfscript>
		application.dsn = "crb01_DSN";
		application.basePath = "/";
		application.incPath = application.basePath&"includes/";
		application.uploadPath = application.basePath&"uploads/";
		application.imgPath = application.incPath&"images/";
		application.jsPath = application.incPath&"scripts/";
		application.cssPath = application.incPath&"styles/";
		application.cfcPath = "includes.cfc";
		application.commonCFC = application.cfcPath&".Common";
</cfscript>
  <cfreturn true />
</cffunction>
<cffunction name="onApplicationEnd" output="false">
  <cfargument name="applicationScope" required="true">
  <cfreturn true />
</cffunction>
<cffunction name="onSessionStart" output="false">
  <cfscript>
 session.started = now();
</cfscript>
  <cfreturn true />
</cffunction>
<cffunction name="onSessionEnd" output="false">
  <cfargument name = "sessionScope" required=true/>
  <cfargument name = "applicationScope" required=true/>
</cffunction>
<cffunction name="onRequestStart">
  <cfargument name="requestname" required=true/>
  <cfreturn true />
</cffunction>
<cffunction name="OnRequest" access="public" returntype="boolean" output="true">
  <cfargument name="TargetPage" type="string" required="true"/>
  <cfinclude template="#arguments.TargetPage#" />
  <cfreturn true />
</cffunction>
<cffunction name="onError" output="true">
  <cfargument name="exception" required=true/>
  <cfargument name="eventName" type="String" required=true/>
  <cfif (trim(arguments.eventName) IS NOT "onSessionEnd") AND (trim(arguments.eventName) IS NOT "onApplicationEnd")>
    <cflog file="#this.name#" type="error"
                text="Event name: #arguments.eventName#" >
    <cflog file="#this.name#" type="error"
                text="Message: #arguments.exception.message#">
    <cfoutput>
      <h2>An unexpected error occurred.</h2>
      <p>Please provide the following information to technical support:</p>
      <p>Error Event: #arguments.eventName#</p>
      <p>Error details:</p>
    </cfoutput>
    <cfdump var=#arguments.exception#>
    <cfelseif (arguments.eventName IS "onApplicationEnd")>
    <cflog file="#this.name#" type="Information"
            text="Application #this.name# Ended" >
  </cfif>
</cffunction>
</cfcomponent>
