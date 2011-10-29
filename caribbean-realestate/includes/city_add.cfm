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
  
  <h1>Add City</h1>
  <cfif isDefined("success") and success>
    <cflocation url="city_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
	   <tr>
        <td>country</td>
        <td>
		
		
		 <select name="country_id" id="country_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#city_add.cfm?country_id='+$('##country_id :selected').val());">
			<option value="0">-- Select --</option>
			<cfset country_id = 0>
			<cfif IsDefined("url.country_id")>
				<cfset country_id = url.country_id>
			</cfif>
			<cfset countries = createObject("component", "#application.commonCFC#").ListCountries()/>
			<cfloop query="countries">
              <option value="#id#" <cfif country_id eq id>selected="selected"</cfif>>#name#</option>
            </cfloop>
          </select>
		</td>
      </tr>
	   <tr>
        <td>state</td>
        <td>
		
		 <select name="parent_id" class="required">
			<option value="0">-- Select --</option>
			<cfif country_id neq 0>
				<cfset states = createObject("component", "#application.commonCFC#").GetStates(country_id)/>
				<cfloop query="states">
				  <option value="#id#">#name#</option>
				</cfloop>
			</cfif>
          </select>
		</td>
      </tr>
	  <tr>
        <td>City</td>
        <td><input name="name" type="text" maxlength="50" class="required"/></td>
      </tr>
      <tr>
        <td colspan="2">
		<input name="type" type="hidden" value="2" />
		<input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#city_list.cfm');" /></td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
