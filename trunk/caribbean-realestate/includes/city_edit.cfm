<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfset obj = createObject("component", "#application.commonCFC#")>
<cfif IsDefined("form.Submit")>
  <cfset success = obj.UpdateLocation(form)/>
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

<h1>Edit Categeory</h1>
<cfif isDefined("success") and success>
  <cfset urlLoc = "city_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset City = obj.GetLocation(url.id)/>
</cfif>
</cfoutput>
<cfif isDefined("City.recordcount")>
  <cfoutput query="City">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    
	<cfset state_id = 0>
	<cfset country_id = 0>
	
	<cfif IsDefined("City.id")>
         <cfset state_id = City.parent_id>
		 <cfset country_id = obj.GetState(state_id).parent_id>
    </cfif>
	
	<form action="" method="post" id="aForm" >
      <table class="noborder">
		<tr>
        <td>country</td>
        <td><select name="country_id" id="country_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#city_edit.cfm?country_id='+$('##country_id :selected').val()+'&page=#page#&id=#id#');">
            <option value="0">-- Select --</option>
            
            <cfif IsDefined("url.country_id")>
              <cfset country_id = url.country_id>
            </cfif>
			
            <cfset countries = obj.ListCountries()/>
            <cfloop query="countries">
              <option value="#id#" <cfif country_id eq id>selected="selected"</cfif>>#name#</option>
            </cfloop>
          </select>
        </td>
      </tr>
	   <tr>
        <td>state</td>
        <td><select name="parent_id" class="required">
            <option value="0">-- Select --</option>
            <cfif country_id neq 0 and country_id neq "">
              <cfset states = obj.GetStates(country_id)/>
			  <cfloop query="states">
                <option value="#id#" <cfif state_id eq id>selected="selected"</cfif>>#name#</option>
              </cfloop>
            </cfif>
          </select>
        </td>
      </tr>
		<tr>
          <td>City</td>
          <td>
		
		  <input name="name" id="name1" type="text" maxlength="50" class="required" value="#name#"/></td>
        </tr>
        <tr>
          <td colspan="2">
		<input name="type" type="hidden" value="#type#" />
		  <input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" />
            <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#city_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="city_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
