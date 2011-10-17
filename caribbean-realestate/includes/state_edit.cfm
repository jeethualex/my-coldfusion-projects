<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").UpdateLocation(form)/>
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
  <cfset urlLoc = "state_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset State = createObject("component", "#application.commonCFC#").GetLocation(url.id)/>
</cfif>
</cfoutput>
<cfif isDefined("State.recordcount")>
  <cfoutput query="State">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm" >
      <table class="noborder">
		<tr>
        <td>country</td>
        <td>
		<cfset countries = createObject("component", "#application.commonCFC#").ListCountries()/>
		 <select name="parent_id" class="required">
			<option value="0">-- Select --</option>
			<cfloop query="countries">
              <option value="#id#" <cfif countries.id eq State.parent_id>selected="selected"</cfif>>#name#</option>
            </cfloop>
          </select>
		</td>
      </tr>
		<tr>
          <td>State</td>
          <td><input name="name" type="text" maxlength="50" class="required" value="#name#"/></td>
        </tr>
        <tr>
          <td colspan="2">
		<input name="type" type="hidden" value="#type#" />
		  <input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" />
            <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#state_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="state_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
