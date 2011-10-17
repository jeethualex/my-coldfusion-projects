<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfset MaxOrder = 5>
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").UpdateFCategory(form)/>
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

<h1>Edit Featured Categeory</h1>
<cfif isDefined("success") and success>
  <cfset urlLoc = "featured_category_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset category = createObject("component", "#application.commonCFC#").GetFCategory(url.id)/>
</cfif>
</cfoutput>
<cfif isDefined("category.recordcount")>
  <cfoutput query="category">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm" >
      <table class="noborder">
        <tr>
        <td>Featured Category</td>
        <td>
		
		<cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
                <select name="category_id" class="required">
                  <cfloop query="qry">
                    <option value="#id#"  <cfif category.category_id eq qry.id>selected="selected"</cfif>>#name#</option>
                  </cfloop>
                </select>
		
		</td>
		</tr>
		<tr>
		
		<td>Order</td>
		  <td>
			<select name="ordernum" class="required">
				 <cfloop index="intFileIndex" from="1" to="#MaxOrder#" step="1">
				<option value="#intFileIndex#" <cfif intFileIndex eq category.ordernum>selected="selected"</cfif>>#intFileIndex#</option>
				</cfloop>
			</select>
		</td>
      </tr>
        <tr>
          <td colspan="2"><input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" />
            <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#featured_category_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="featured_category_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
