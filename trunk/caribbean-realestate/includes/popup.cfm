<cfif IsDefined("form.Submit")>
  <cfset qry = createObject("component", "#application.commonCFC#").CheckUser(form)/>
  <!---<cfdump var="#qry#">--->
  <cfif qry.recordcount>
    <cfset session.id=qry.id>
    <cfset session.privilege=qry.privilege>
    <!---<cflocation url="#cgi.SCRIPT_NAME#" addtoken="no">--->
	
	
	
		<cfif IsDefined("session.urlpath") >
		<cfset urlpath="#session.urlpath#">
		<cfset url1="#urlpath#">
		<cfelse>
		<cfset url1="#application.basePath#index.cfm">
		</cfif>
		
		<cfdump var="#url1#">
		<cflocation url="#url1#" addtoken="no">
	
	
	
	
    <cfelse>
    <cflocation url="#application.incPath#logout1.cfm?err=1" addtoken="no">
  </cfif>
</cfif>

<cfoutput>
  <style type="text/css">
##popup {
height: 100%;
width: 100%;
background: ##000000;
position: absolute;
top: 0;
-moz-opacity:0.75;
-khtml-opacity: 0.75;
opacity: 0.75;
filter:alpha(opacity=75);
}

##window {
    background: none repeat scroll 0 0 ##FFFFFF;
    border: 1px solid ##000000;
/*    min-height: 150px;
*/    
    margin: 0 auto;
  
    position: absolute;
   	top: 40%;
	left: 40%;
	
    width: 250px;
    border: solid 1px ##000;
    border-radius: 8px;
}

##popup_content { color:##000000; padding:10px;}
##popup_content a { color:##000000;}
</style>
  
  <div id="popup" style="display: none;"></div>
  <div id="window" style="display: none;">
    <div id="popup_content">
	
	
	
	<!---LOGIN FORM--->
	
	
	<cfif IsDefined("url.err") and url.err eq 1>
	<p style="color:##FF0000; font-weight:bold;">Invalid Credentials</p>
	</cfif>
	
	<h1>Login</h1>
	<p>Not Registered!<br />
Please signup for viewing this page</p>
	
	
	<!---<cfdump var="#session#">--->
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
        <td colspan="2"><input name="submit" type="submit" value="Submit" class="glue secondary"> <input name="close" type="button" value="Close" onclick="javascript:Close_Popup();"  class="glue secondary"/></td>
      </tr>
    </table>
  </form>
	
	
	<!---LOGIN FORM--->
	
	
	
	</div>
  </div>
  <script type="text/javascript">
function Show_Popup(action, userid) {
$('##popup').fadeIn('fast');
$('##window').fadeIn('fast');
}
function Close_Popup() {
$('##popup').fadeOut('fast');
$('##window').fadeOut('fast');
}

<cfif IsDefined("url.err")>
Show_Popup();
</cfif>
</script>
</cfoutput>