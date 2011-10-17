<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfset MaxOrder = 9>
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").UpdatePLocation(form)/>
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

<h1>Edit Popular Location</h1>
<cfif isDefined("success") and success>
  <cfset urlLoc = "popular_locations_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset PLID = url.id>
  <cfset location = createObject("component", "#application.commonCFC#").GetPLocation(PLID)/>
</cfif>
</cfoutput>
<cfif isDefined("location.recordcount")>
  <cfoutput query="location">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm" >
      <table class="noborder">
        <tr>
          <td>Popular Location #PLID#</td>
          <td><select name="plocation_id" class="required">
              <cfset obj = createObject("component", "#application.commonCFC#")>
              <cfset countryQuery = obj.GetCountries()/>
              <cfloop query="countryQuery">
                <cfset tempVar="#name#">
                <option value="#id#"      <cfif location.location_id eq id>selected="selected"</cfif>>#tempVar#</option>
                <cfset stateQuery = obj.GetStates(id)/>
                <cfloop query="stateQuery">
                  <cfset tempVar1="#name#">
                  <option value="#id#"  <cfif location.location_id eq id>selected="selected"</cfif>>#tempVar# - #tempVar1#</option>
                  <cfset cityQuery = obj.GetCities(id)/>
                  <cfloop query="cityQuery">
                    <cfset tempVar2="#name#">
                    <option value="#id#" <cfif location.location_id eq id>selected="selected"</cfif>>#tempVar# - #tempVar1# - #tempvar2#</option>
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
                <option value="#intFileIndex#" <cfif intFileIndex eq location.ordernum>selected="selected"</cfif>>#intFileIndex#</option>
              </cfloop>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2"><input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" />
            <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#popular_locations_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="popular_locations_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
