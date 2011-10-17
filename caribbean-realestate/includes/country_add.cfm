<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").InsertLocation(form)/>
</cfif>
<cfinclude template="#application.incPath#header.cfm">
<cfoutput>
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
  
  <h1>Add Country</h1>
  <cfif isDefined("success") and success>
    <cflocation url="country_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
      <tr>
        <td>Country</td>
        <td><input name="name" type="text" maxlength="50" class="required"/></td>
      </tr>
      <tr>
        <td colspan="2">
		<input name="type" type="hidden" value="0" />
		<input name="parent_id" type="hidden" value="0" />
		<input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#country_list.cfm');" /></td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
