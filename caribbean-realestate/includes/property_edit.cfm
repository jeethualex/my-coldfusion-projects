<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<!---FILE UPLOAD--->
<cfset REQUEST.FileCount = 5 />
<cfset REQUEST.UploadPath = ExpandPath( "../uploads/" ) />
<cfif IsDefined("form.submit")>
  <cfset IsUploaded = true>
  <cftry>
    <cfset removePhotosArr = ListToArray(removePhotos)>
    <cfloop index="intFileIndex" from="1" to="#ArrayLen(removePhotosArr)#" step="1">
      <cfset oldVal = "#removePhotosArr[intFileIndex]#">
      <cfset DelFile = "#REQUEST.UploadPath##oldVal#">
      <cffile action="delete" file="#DelFile#" />
    </cfloop>
    <!---<cfdump var="#Form#">--->
    <cfset oldPhotosArr = ListToArray(oldPhotos)>
    <cfset arrUploaded = ArrayNew( 1 ) />
    <cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
      <cfset oldVal = "">
      <cfset newVal = "">
      <cfif IsDefined("FORM.file#intFileIndex#")>
        <cfset value = Evaluate("FORM.file#intFileIndex#")>
        <cfset newVal = "#value#">
        <cfif intFileIndex lte ArrayLen(oldPhotosArr)>
          <cfset oldVal = "#oldPhotosArr[intFileIndex]#">
        </cfif>
        <!---NEW VALUE IS DEFINED -- UPLOAD & DELETE--->
        <cfif oldVal neq "" and  newVal neq "">
          <cfset DelFile = "#REQUEST.UploadPath##oldVal#">
          <cffile action="delete" file="#DelFile#" />
          <!---<cfdump var="Delete: #DelFile#">--->
        </cfif>
        <cfif oldVal neq "" and  newVal eq "">
          <cfset ArrayAppend(arrUploaded,oldVal) />
        </cfif>
        <cfif newVal neq "">
          <!---<cfdump var="Upload: #newVal#">--->
          <cffile action="upload" destination="#REQUEST.UploadPath#" filefield="file#intFileIndex#" nameconflict="makeunique" />
          <cfset ArrayAppend(arrUploaded,(CFFILE.ServerFile)) />
        </cfif>
      </cfif>
    </cfloop>
    <cfcatch>
      <cfset IsUploaded = false>
    </cfcatch>
  </cftry>
  <cfif IsUploaded>
    <cfset FORM.photos = ArrayToList(arrUploaded)>
    <cfset FORM.location = "#FORM.city#,#FORM.state#,#FORM.country#,#FORM.pincode#">
    <cfset success = createObject("component", "#application.commonCFC#").UpdateProperty(form)/>
    <cfdump var="#FORM#">
    <cfdump var="#success#">
  </cfif>
</cfif>
<!---FILE UPLOAD--->
<cfinclude template="#application.incPath#header.cfm">
<script src="http://jqueryui.com/jquery-1.6.2.js"></script>
<script src="http://jqueryui.com/external/jquery.cookie.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.core.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.widget.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.tabs.js"></script>
<!--<link href="http://jqueryui.com/demos.css" rel="stylesheet">-->
<link href="http://jqueryui.com/themes/base/jquery.ui.all.css" rel="stylesheet">
<style type="text/css">
.ui-widget {
	font-family: Verdana,Arial,sans-serif;
	font-size: 11px;
}
.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
-moz-border-radius-bottomright: 0/*{cornerRadius}*/;
-webkit-border-bottom-right-radius: 0/*{cornerRadius}*/;
-khtml-border-bottom-right-radius: 0/*{cornerRadius}*/;
border-bottom-right-radius: 0/*{cornerRadius}*/;
}

.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl {
-moz-border-radius-bottomleft: 0/*{cornerRadius}*/;
-webkit-border-bottom-left-radius: 0/*{cornerRadius}*/;
-khtml-border-bottom-left-radius: 0/*{cornerRadius}*/;
border-bottom-left-radius: 0/*{cornerRadius}*/;
}

.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
-moz-border-radius-topright: 0/*{cornerRadius}*/;
-webkit-border-top-right-radius: 0/*{cornerRadius}*/;
-khtml-border-top-right-radius: 0/*{cornerRadius}*/;
border-top-right-radius: 0/*{cornerRadius}*/;
}

.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {
-moz-border-radius-topleft: 0/*{cornerRadius}*/;
-webkit-border-top-left-radius: 0/*{cornerRadius}*/;
-khtml-border-top-left-radius: 0/*{cornerRadius}*/;
border-top-left-radius: 0/*{cornerRadius}*/;
}

.ui-widget-header {
border:none;
border-bottom: 1px solid #AAA/*{borderColorHeader}*/;
color: #222/*{fcHeader}*/;
font-weight: bold;
}

.ui-tabs {
position: relative;
padding: 0;
zoom: 1;
}

.ui-tabs .ui-tabs-nav {
margin: 0;
padding: 2px 0 0 2px;
}

.demo {
width: 600px;
}
</style>
<script type="text/javascript">



$(document).ready(function(){

	var $tabs = $('#tabs').tabs(); // first tab selected
	
	$('#my-next-link-3').click(function() { // bind click event to link
		$tabs.tabs('select', 3); // switch to third tab
		return false;
	});
	
	$('#my-next-link-2').click(function() { 
		$tabs.tabs('select', 2); 
		return false;
	});
	
	$('#my-next-link-1').click(function() { 
		$tabs.tabs('select', 1); 
		return false;
	});
	
});

$(function() {
	$( "#tabs" ).tabs({
	cookie: {
	// store cookie for a day, without, it would be a session cookie
	expires: 1
	}
	});
}); 



</script>
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

<h1>Edit Property</h1>
<cfif isDefined("success") and success>
  <cfset urlLoc = "property_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset property = createObject("component", "#application.commonCFC#").GetProperty(url.id)/>
</cfif>
</cfoutput>
<cfif isDefined("property.recordcount")>
  <cfoutput query="property">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm"  enctype="multipart/form-data" >
      <div class="demo">
        <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
           <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="##tabs-1">Edit Location</a></li>
          <li class="ui-state-default ui-corner-top"><a href="##tabs-2">Details</a></li>
          <li class="ui-state-default ui-corner-top"><a href="##tabs-3">Aminities</a></li>
		  <li class="ui-state-default ui-corner-top"><a href="##tabs-4">Photos</a></li>
          </ul>
          <cfset obj = createObject("component", "#application.commonCFC#")/>
          <cfset countryQuery = obj.ListCountries()/>
          <cfset stateQuery = obj.ListStates()/>
          <cfset cityQuery = obj.ListCities()/>
          <div id="tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
            <table class="noborder">
              <tr>
                
                 <cfset country_id = 0>
				 <cfset state_id = 0>
				 <cfset city_id = 0>
				 
				
				
				<cfset loc=ListToArray(location)>
				
				<cfif IsDefined("location")>
				 <cfset country_id = loc[3]>
				 <cfset state_id = loc[2]>
				 <cfset city_id = loc[1]>
				</cfif>
				
				 <cfif IsDefined("url.country_id")>
							<cfif country_id neq url.country_id>
							<cfset state_id = 0>
							<cfset country_id = url.country_id>
							</cfif>
                 </cfif>
				 
				 <cfif IsDefined("url.state_id")>
                              <cfset state_id = url.state_id>
                            </cfif>
				
                <td><table class="noborder">
                    <tr>
                      <td> country</td>
                      <td><select name="country"  id="country_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#property_edit.cfm?id=#id#&country_id='+$('##country_id :selected').val()
					  
					  );">
                          <option value="0">-- Select --</option>
                         
                         
                          <cfset countries = obj.ListCountries()/>
						  <cfloop query="countries">
                            <option value="#id#" 
							<cfif id eq country_id>selected="selected"</cfif>
							
							<!---<cfif country_id neq 0>
								<cfif id eq country_id>selected="selected"</cfif>
							<cfelse>
								<cfif loc[3] eq id>selected="selected"</cfif>
							</cfif>--->
							>#name#</option>
                          </cfloop>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td> state</td>
                      <td><select name="state" id="state_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#property_edit.cfm?id=#id#&country_id='+$('##country_id :selected').val()+'&state_id='+$('##state_id :selected').val());">
                          <option value="0">-- Select --</option>
                          
                            
							
							<cfif (country_id neq 0)>
                            <cfset states = obj.GetStates(country_id)/>
							
							<!---<cfelseif IsDefined("location")>
							 <cfset country_id = loc[3]>
							 <cfset state_id = loc[2]>
							<cfset states = obj.GetStates(country_id)/>--->
							
							
							
                            <cfloop query="states">
                              <option value="#id#" 
							  <cfif id eq state_id>selected="selected"</cfif>
							<!---<cfif state_id neq 0>
								<cfif id eq state_id>selected="selected"</cfif>
							<cfelse>
								<cfif loc[2] eq id>selected="selected"</cfif>
							</cfif>--->
							  >#name#</option>
                            </cfloop>
							</cfif>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td> city</td>
                      <td><select name="city" class="required">
                          <option value="0">-- Select --</option>
                            <cfif (state_id neq 0)>
							<cfset cities = obj.GetCities(state_id)/>
							
							
							
							<cfloop query="cities">
                              <option value="#id#" 
							  
							<cfif id eq city_id>selected="selected"</cfif>
							
							  >#name#</option>
                            </cfloop>
							</cfif>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td> pincode</td>
                      <td><input name="pincode" type="text" maxlength="50" class="required" value="#loc[4]#"/></td>
                    </tr>
                  </table></td>
              </tr>
			  
			    <tr>
                <td><input name="next" type="button" value="Next" id="my-next-link-1" /></td>
              </tr>
            </table>
          </div>
          <div id="tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <table class="noborder">
			  
			  
			  <tr>
                <td>title</td>
                <td><input name="title" type="text" maxlength="50" class="required" value="#title#"/></td>
              </tr>
              <tr>
                <td>description</td>
                <td><textarea name="description" cols="30" rows="6">#description#</textarea></td>
              </tr>
              <tr>
                <td>category</td>
                <td><cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
                  <select name="category" class="required">
                    <cfloop query="qry">
                      <option value="#id#" <cfif property.category_id eq qry.id>selected="selected"</cfif>>#name#</option>
                    </cfloop>
                  </select>
                </td>
              </tr>
              <tr>
                <td>bed rooms</td>
                <td><select name="bedrooms" class="required">
                    <option value="1" <cfif property.bedrooms eq 1>selected="selected"</cfif>>1</option>
                    <option value="2" <cfif property.bedrooms eq 2>selected="selected"</cfif>>2</option>
                    <option value="3" <cfif property.bedrooms eq 3>selected="selected"</cfif>>3</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>bath rooms</td>
                <td><select name="bathrooms" class="required">
                    <option value="1" <cfif property.bathrooms eq 1>selected="selected"</cfif>>1</option>
                    <option value="2" <cfif property.bathrooms eq 2>selected="selected"</cfif>>2</option>
                    <option value="3" <cfif property.bathrooms eq 3>selected="selected"</cfif>>3</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>size</td>
                <td><input name="size" type="text" maxlength="50" class="required" value="#size#"/></td>
              </tr>
              <tr>
                <td>price</td>
                <td><input name="price" type="text" maxlength="50" class="required" value="#price#"/></td>
              </tr>
              
              <tr>
                <td>featured</td>
                <td><input name="featured" type="checkbox" value="#featured#" <cfif featured eq 1>checked="checked"</cfif> /></td>
              </tr>
              <tr>
                <td>status</td>
                <td><input name="status" type="checkbox" value="#status#" <cfif status eq 1>checked="checked"</cfif> /></td>
              </tr>
              <tr>
                <td colspan="2"><input name="next" type="button" value="Next" id="my-next-link-2" /></td>
              </tr>
            </table>
          </div>
          <div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <table class="noborder">
              <tr>
              
                <td><cfset aminities1="Balcony,Built in Kitchen Appliances,Built in Wardrobes,Central A/C & Heating,Concierge Service,Covered Parking,Maid Service,Maids Room,Pets Allowed,Private Garden,Private Gym,Private Jacuzzi,Private Pool,Security,Shared Gym,Shared Pool,Shared Spa,Study,View of Landmark,View of Water,Walk-in Closet">
                  <cfloop list="#aminities1#" index="ListItem" delimiters=",">
                    <cfoutput>
                      <input name="aminities" type="checkbox" value="#ListItem#" <cfif ListFindNoCase(aminities,ListItem)>checked="checked"</cfif>/>
                      #ListItem#<br />
                    </cfoutput>
                  </cfloop>
                </td>
              </tr>
              <tr>
                <td><input name="next" type="button" value="Next" id="my-next-link-3" /></td>
              </tr>
            </table>
          </div>
          <div id="tabs-4" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <table class="noborder">
              <tr>
               
                <td><cfset photo = ListToArray(photos)>
                  <cfset length = ArrayLen(photo)>
                  <input name="oldPhotos" class="oldPhotos" type="hidden" value="#photos#" />
                  <input name="removePhotos" class="removePhotos" type="hidden" value="" />
                  <cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
                    <label for="file#intFileIndex#"> Photo #intFileIndex# (
                    <cfif intFileIndex lte length>
                      <span class='#intFileIndex#'> #photo[intFileIndex]# <a href="##" onclick="javascript:removeFile('#photo[intFileIndex]#','#intFileIndex#');">Remove</a> </span>
                    </cfif>
                    ): </label>
                    <input type="file" name="file#intFileIndex#" id="file#intFileIndex#" <cfif intFileIndex lte length>value="../uploads/#photo[intFileIndex]#"</cfif> />
                    <br />
                  </cfloop>
                </td>
              </tr>
              <tr>
                <td><input type="hidden" name="submitted" value="1" />
                  <input name="page" type="hidden" value="#page#" />
                  <input name="id" type="hidden" value="#id#" />
                  <input name="Submit" type="submit" value="Submit" />
                  <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#property_list.cfm?page=#page#');" /></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <!---TABS--->
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="property_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
