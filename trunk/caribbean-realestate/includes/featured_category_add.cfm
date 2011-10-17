<cfset MaxOrder = 5>

<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").InsertFCategory(form)/>
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
  
  <h1>Add Featured Category</h1>
  <cfif isDefined("success") and success>
    <cflocation url="featured_category_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
      <tr>
        <td>Featured Category</td>
        <td>
		
		<cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
                <select name="category_id" class="required">
                  <cfloop query="qry">
                    <option value="#id#">#name#</option>
                  </cfloop>
                </select>
		
		</td>
		</tr>
		<tr>
		
		<td>Order</td>
		  <td>
			<select name="ordernum" class="required">
				 <cfloop index="intFileIndex" from="1" to="#MaxOrder#" step="1">
				<option value="#intFileIndex#">#intFileIndex#</option>
				</cfloop>
			</select>
		</td>
      </tr>
      <tr>
        <td colspan="2"><input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#featured_category_list.cfm');" /></td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
