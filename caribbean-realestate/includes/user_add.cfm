<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").InsertUser(form)/>
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
  
  <h1>Add User</h1>
  <cfif isDefined("success") and success>
    <cflocation url="user_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
      <tr>
        <td>username</td>
        <td><input name="username" type="text" maxlength="50" class="required"/></td>
      </tr>
      <tr>
        <td>password</td>
        <td><input name="password" type="text" maxlength="30" class="required" /></td>
      </tr>
      <tr>
        <td>privilege</td>
        <td><select name="privilege" class="required">
            <option value="0">Normal</option>
            <option value="1">Admin</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>email</td>
        <td><input name="email" type="text" maxlength="75" class="required email" /></td>
      </tr>
      <tr>
        <td>phone</td>
        <td><input name="phone" type="text" maxlength="20" class="required" /></td>
      </tr>
      <tr>
        <td>expiry</td>
        <td><input name="expiry" type="text" class="cal required" readonly="readonly" /></td>
      </tr>
      <tr>
        <td colspan="2"><input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#user_list.cfm');" />
        </td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
