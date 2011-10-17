<cfset MaxOrder = 9>
<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").InsertPLocation(form)/>
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
  
  <h1>Add Popular Locations</h1>
  <cfif isDefined("success") and success>
    <cflocation url="popular_locations_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
      <tr>
        <td>Popular location</td>
        <td><select name="plocation_id" class="required">
            <cfset obj = createObject("component", "#application.commonCFC#")>
            <cfset countryQuery = obj.GetCountries()/>
            <cfloop query="countryQuery">
              <cfset tempVar="#name#">
              <option value="#id#">#tempVar#</option>
              <cfset stateQuery = obj.GetStates(id)/>
              <cfloop query="stateQuery">
                <cfset tempVar1="#name#">
                <option value="#id#">#tempVar# - #tempVar1#</option>
                <cfset cityQuery = obj.GetCities(id)/>
                <cfloop query="cityQuery">
                  <cfset tempVar2="#name#">
                  <option value="#id#">#tempVar# - #tempVar1# - #tempVar2#</option>
                </cfloop>
              </cfloop>
            </cfloop>
          </select>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td><select name="ordernum" class="required">
            <cfloop index="intFileIndex" from="1" to="#MaxOrder#" step="1">
              <option value="#intFileIndex#">#intFileIndex#</option>
            </cfloop>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2"><input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#popular_locations_list.cfm');" /></td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
