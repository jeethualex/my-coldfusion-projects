<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>

<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").UpdateUser(form)/>
</cfif>
<cfinclude template="#application.incPath#header.cfm">
<cfoutput>
  <!--CALENDER-->
  <link href="#application.jsPath#datepicker/calendar.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="#application.jsPath#datepicker/cal.js"></script>
  <script type="text/javascript">
jQuery(document).ready(function () {
	$('input.cal').simpleDatepicker();
});
</script>
  <!--CALENDER-->
  <!-- VALIDATOR -->
  <script type="text/javascript" src="http://view.jquery.com/trunk/plugins/validate/jquery.validate.js"></script>
  <script type="text/javascript">
  jQuery(document).ready(function(){
    $("##aForm").validate();
  });
  </script>
  <style type="text/css">
  	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
  </style>
  <!-- VALIDATOR -->
  
  <h1>Edit User</h1>
  <cfif isDefined("success") and success>
    <cfset urlLoc = "user_list.cfm">
    <cfset urlLoc = urlLoc&"?page=#form.page#">
   
    <cflocation url="#urlLoc#" addtoken="no">
  </cfif>
  <cfif IsDefined("url.id")>
    <cfset user = createObject("component", "#application.commonCFC#").GetUser(url.id)/>
  </cfif>
  </cfoutput>
  <cfif isDefined("user.recordcount")>
  <cfoutput query="user">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm" >
      <table class="noborder">
        <tr>
          <td>username</td>
          <td><input name="username" type="text" maxlength="50" class="required" value="#username#"/></td>
        </tr>
        <tr>
          <td>password</td>
          <td><input name="password" type="text" maxlength="30" class="required" value="#password#"/></td>
        </tr>
        <tr>
          <td>privilege</td>
          <td><select name="privilege" class="required">
              <option value="0" <cfif privilege eq 0>selected="selected"</cfif>>Normal</option>
              <option value="1" <cfif privilege eq 1>selected="selected"</cfif>>Admin</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>email</td>
          <td><input name="email" type="text" maxlength="75" class="required email" value="#email#"/></td>
        </tr>
        <tr>
          <td>phone</td>
          <td><input name="phone" type="text" maxlength="20" class="required digits" value="#phone#"/></td>
        </tr>
        <tr>
          <td>expiry</td>
          <td><input name="expiry" type="text" class="cal required" readonly="readonly" value="#DateFormat(expiry,'mm/dd/yyyy')#"/></td>
        </tr>
        <tr>
          <td colspan="2">
            <input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" /><input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#user_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  	<cflocation url="user_list.cfm" addtoken="no">
  </cfif>

<cfinclude template="#application.incPath#footer.cfm">
