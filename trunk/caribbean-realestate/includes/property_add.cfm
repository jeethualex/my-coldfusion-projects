<!---FILE UPLOAD--->
<cfset REQUEST.FileCount = 5 />
<cfset REQUEST.UploadPath = ExpandPath( "../uploads/" ) />
<cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
  <cfparam name="FORM.file#intFileIndex#" type="string" default="" />
</cfloop>
<cftry>
  <cfparam name="FORM.submitted" type="numeric" default="0" />
  <cfcatch>
    <cfset FORM.submitted = 0 />
  </cfcatch>
</cftry>
<cfset arrErrors = ArrayNew( 1 ) />
<cfif FORM.submitted>
  <cfset ArrayAppend(arrErrors,"Please select at least one file to upload") />
  <cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
    <cfif Len( FORM[ "file#intFileIndex#" ] )>
      <cfset ArrayClear( arrErrors ) />
      <cfbreak />
    </cfif>
  </cfloop>
  <cfif NOT ArrayLen( arrErrors )>
    <cfset arrUploaded = ArrayNew( 1 ) />
    <cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
      <cfif Len( FORM[ "file#intFileIndex#" ] )>
        <cftry>
          <cffile action="upload" destination="#REQUEST.UploadPath#" filefield="file#intFileIndex#" nameconflict="makeunique" />
          <!---<cfset ArrayAppend(arrUploaded,(CFFILE.ServerDirectory & "\" & CFFILE.ServerFile)) />--->
          <cfset ArrayAppend(arrUploaded,(CFFILE.ServerFile)) />
          <cfcatch>
            <cfset ArrayAppend(arrErrors,"There was a problem uploading file ###intFileIndex#: #CFCATCH.detail#") />
            <cfbreak />
          </cfcatch>
        </cftry>
      </cfif>
    </cfloop>
    <cfif ArrayLen( arrErrors )>
      <cfloop index="intFileIndex" from="1" to="#ArrayLen( arrUploaded )#" step="1">
        <cftry>
          <cffile
action="delete"
file="#arrUploaded[ intFileIndex ]#"
/>
          <cfcatch></cfcatch>
        </cftry>
      </cfloop>
      <cfelse>
      <!--- !! SUCCESS !! --->
      <cfset FORM.photos = ArrayToList(arrUploaded)>
      <cfset FORM.location = "#FORM.city#,#FORM.state#,#FORM.country#,#FORM.pincode#">
      <!--- <cfdump var="#arrUploaded#">
      <br />
      <cfdump var="#arrErrors#">
      <cfdump var="#FORM#">--->
      <cfset success = createObject("component", "#application.commonCFC#").InsertProperty(form)/>
    </cfif>
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
  
  <h1>Add Property</h1>
  <cfif isDefined("success") and success>
    <cflocation url="property_list.cfm" addtoken="no">
  </cfif>
  <form action="" method="post" id="aForm" enctype="multipart/form-data">
    <!---TABS--->
    <div class="demo">
      <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
        <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
          <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="##tabs-1">Select Location</a></li>
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
             
              <td><table class="noborder">
                  <tr>
                    <td> country</td>
                    <td><select name="country"  id="country_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#property_add.cfm?country_id='+$('##country_id :selected').val());">
                        <option value="0">-- Select --</option>
                        <cfset country_id = 0>
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
                    <td> state</td>
                    <td><select name="state" id="state_id" class="required" onchange="javascript:$(location).attr('href','#application.incPath#property_add.cfm?country_id='+$('##country_id :selected').val()+'&state_id='+$('##state_id :selected').val());">
                        <option value="0">-- Select --</option>
                        <cfset state_id = 0>
                        <cfif country_id neq 0>
                          <cfif IsDefined("url.country_id") and IsDefined("url.state_id")>
                            <cfset country_id = url.country_id>
                            <cfset state_id = url.state_id>
                          </cfif>
                          <cfset states = obj.GetStates(country_id)/>
                          <cfloop query="states">
                            <option value="#id#" <cfif state_id eq id>selected="selected"</cfif>>#name#</option>
                          </cfloop>
                        </cfif>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td> city</td>
                    <td><select name="city" class="required">
                        <option value="0">-- Select --</option>
                        <cfif  country_id neq 0 and state_id neq 0>
                          <cfif IsDefined("url.state_id")>
                            <cfset state_id = url.state_id>
                          </cfif>
                          <cfset cities = obj.GetCities(state_id)/>
                          <cfloop query="cities">
                            <option value="#id#">#name#</option>
                          </cfloop>
                        </cfif>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td> address</td>
                    <td><input name="pincode" type="text" maxlength="50" class="required"/></td>
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
              <td><input name="title" type="text" maxlength="50" class="required"/></td>
            </tr>
            <tr>
              <td>description</td>
              <td><textarea name="description" cols="30" rows="6"></textarea></td>
            </tr>
            <tr>
              <td>category</td>
              <td><cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
                <select name="category" class="required">
                  <cfloop query="qry">
                    <option value="#id#">#name#</option>
                  </cfloop>
                </select>
              </td>
            </tr>
            <tr>
              <td>bed rooms</td>
              <td><select name="bedrooms" class="required">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>bath rooms</td>
              <td><select name="bathrooms" class="required">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>size</td>
              <td><input name="size" type="text" maxlength="50" class="required"/></td>
            </tr>
            <tr>
              <td>price</td>
              <td><input name="price" type="text" maxlength="50" class="required"/></td>
            </tr>
            
            <tr>
              <td>featured</td>
              <td><input name="featured" type="checkbox" value="1" /></td>
            </tr>
            <tr>
              <td>status</td>
              <td><input name="status" type="checkbox" value="1" /></td>
            </tr>
            <tr>
              <td colspan="2"><input name="next" type="button" value="Next" id="my-next-link-2" /></td>
            </tr>
          </table>
        </div>
        <div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
          <table class="noborder">
            <tr>
             
              <td><cfset aminities="Balcony,Built in Kitchen Appliances,Built in Wardrobes,Central A/C & Heating,Concierge Service,Covered Parking,Maid Service,Maids Room,Pets Allowed,Private Garden,Private Gym,Private Jacuzzi,Private Pool,Security,Shared Gym,Shared Pool,Shared Spa,Study,View of Landmark,View of Water,Walk-in Closet">
                <cfloop list="#aminities#" index="ListItem" delimiters=",">
                  <cfoutput>
                    <input name="aminities" type="checkbox" value="#ListItem#" />
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
              
              <td><cfloop index="intFileIndex" from="1" to="#REQUEST.FileCount#" step="1">
                  <label for="file#intFileIndex#"> Photo #intFileIndex#: </label>
                  <input type="file" name="file#intFileIndex#" id="file#intFileIndex#"/>
                  <br />
                </cfloop>
              </td>
            </tr>
            <tr>
              <td><input type="hidden" name="submitted" value="1" />
                <input name="Submit" type="submit" value="Submit" />
                <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#property_list.cfm');" />
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <!---TABS--->
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
