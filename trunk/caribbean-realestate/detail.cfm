<cfinclude template="#application.incPath#header_2.cfm">
<cfset obj = createObject("component", "#application.commonCFC#")>
<cfif IsDefined("url.id")>
  <cfset propertyid = url.id>
  <cfset qry = obj.GetProperty(propertyid)/>
  <cfset loc=ListToArray(qry.location)>
  <cfset photos=ListToArray(qry.photos)>
  <cfset photoindex=ArrayLen(photos)>
</cfif>
<script src="http://jqueryui.com/jquery-1.6.2.js"></script>
<script src="http://jqueryui.com/external/jquery.cookie.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.core.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.widget.js"></script>
<script src="http://jqueryui.com/ui/jquery.ui.tabs.js"></script>
<!--<link href="http://jqueryui.com/demos.css" rel="stylesheet">-->
<link href="http://jqueryui.com/themes/base/jquery.ui.all.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){

	$("h2").append('<em></em>')

	$(".thumbs a").click(function(){
	
		var largePath = $(this).attr("href");
		var largeAlt = $(this).attr("title");
		$("#largeImg").attr({ src: largePath, alt: largeAlt });
		$("h2 em").html(" (" + largeAlt + ")"); return false;
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
  <div class="content secondcontent">
    <div class="breadcrumb"><a href="##">Home</a> > <a href="##">Details</a></div>
    <div class="w25p floatL">
      <cfif loc[1] neq 0>
        <cfset qry1 = obj.GetLocation(loc[1])/>
      </cfif>
      <cfif loc[2] neq 0>
        <cfset qry2 = obj.GetLocation(loc[2])/>
      </cfif>
      <cfif loc[3] neq 0>
        <cfset qry3 = obj.GetLocation(loc[3])/>
      </cfif>
      <cfset qry4 = obj.GetCategory(qry.category_id)/>
      <div class="sidePanelSearch gradient">
        <h1>Property Details</h1>
        <div class="cboth dottedLineTop h10px"></div>
        <table border="0" cellpadding="3" cellspacing="0" width="100%">
          <tr>
            <td width="55" valign="top"><strong>Location</strong></td>
            <td><cfif loc[1] neq 0>
                #qry1.name# <br />
              </cfif>
              <cfif loc[2] neq 0>
                #qry2.name# <br />
              </cfif>
              <cfif loc[3] neq 0>
                #qry3.name# <br />
              </cfif>
              <cfif loc[4] neq 0>
                #loc[4]#
              </cfif></td>
          </tr>
          <tr>
            <td width="55"><strong>Type</strong></td>
            <td>#qry4.name#</td>
          </tr>
          <tr>
            <td width="55"><strong>Bed</strong></td>
            <td>#qry.bedrooms#</td>
          </tr>
          <tr>
            <td width="55"><strong>Bath</strong></td>
            <td>#qry.bathrooms#</td>
          </tr>
          <tr>
            <td width="55"><strong>Price</strong></td>
            <td>$#qry.price#</td>
          </tr>
        </table>
      </div>
    </div>
    <div class="w75p floatL">
      <h1>Photo Gallery</h1>
      <div class="contentHolder" align="center">
        <div class="cboth dottedLineTop"></div>
        <!-- <img src="#application.imgPath#gallery.jpg" />-->
        <div class="demo">
          <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
              <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="##tabs-1">Photo Gallery</a></li>
              <li class="ui-state-default ui-corner-top"><a href="##tabs-2">Location Map</a></li>
              <li class="ui-state-default ui-corner-top"><a href="##tabs-3">Other Details</a></li>
            </ul>
            <cfif photoindex gt 0>
              <div id="tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
                <div style="padding:10px;">
                  <p><img alt="Image 2" src="#application.uploadPath##photos[1]#" id="largeImg"></p>
                  <cfif photoindex gt 0 >
                    <p class="thumbs">
                      <cfloop index="i" from="1" to="#arrayLen(photos)#" step="1">
                        <a title="Image 2" href="#application.uploadPath##photos[i]#"><img src="#application.uploadPath##photos[i]#"></a>
                      </cfloop>
                    </p>
                  </cfif>
                </div>
              </div>
            </cfif>
            <!--- <div id="tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
              <div style="padding:10px;">
                <p><img alt="Image 2" src="#application.imgPath#villa.jpg" id="largeImg"></p>
                <p class="thumbs"> 
				<a title="Image 2" href="#application.imgPath#villa.jpg"><img src="#application.imgPath#villa.jpg"></a> 
				<a title="Image 3" href="#application.imgPath#villa2.jpg"><img src="#application.imgPath#villa2.jpg"></a> 
				<a title="Image 4" href="#application.imgPath#villa1.jpg"><img src="#application.imgPath#villa1.jpg"></a> 
				</p>
              </div>
            </div>--->
            <div id="tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
              <style type="text/css">
  ##map_canvas { width:450px; height: 450px; }
</style>
              <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
              <script type="text/javascript">
function showMap(address) {
	geocoder = new google.maps.Geocoder();

	geocoder.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {

			var myOptions = {
				zoom: 8,
				center: results[0].geometry.location,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);

			var marker = new google.maps.Marker({
				map: map, 
				position: results[0].geometry.location
			});
		} else {
			alert("Geocode was not successful for the following reason: " + status);
		}
	});
}
</script>
              <cfset fulladdress = #qry1.name# & " " & #qry2.name# & ", " & #qry3.name# & " " & #loc[4]#>
              <div id="map_canvas"></div>
              <script language="JavaScript" type="text/javascript">
			  showMap('#jsStringFormat(fulladdress)#');

</script>
            </div>
            <!---
			 <div id="tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
              <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
            </div>--->
            <div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
              <table border="0" cellpadding="3" cellspacing="0" width="100%">
			   <tr>
                  <td width="55"><strong>Title</strong></td>
                  <td>#qry.title#</td>
                </tr>
				
				 <tr>
                  <td width="55"><strong>Description</strong></td>
                  <td>#qry.description#</td>
                </tr>
				
			  
                <tr>
                  <td width="55" valign="top"><strong>Location</strong></td>
                  <td><cfif loc[1] neq 0>
                      #qry1.name# <br />
                    </cfif>
                    <cfif loc[2] neq 0>
                      #qry2.name# <br />
                    </cfif>
                    <cfif loc[3] neq 0>
                      #qry3.name# <br />
                    </cfif>
                    <cfif loc[4] neq 0>
                      #loc[4]#
                    </cfif></td>
                </tr>
                <tr>
                  <td width="55"><strong>Type</strong></td>
                  <td>#qry4.name#</td>
                </tr>
                <tr>
                  <td width="55"><strong>Bed</strong></td>
                  <td>#qry.bedrooms#</td>
                </tr>
                <tr>
                  <td width="55"><strong>Bath</strong></td>
                  <td>#qry.bathrooms#</td>
                </tr>
                <tr>
                  <td width="55"><strong>Size</strong></td>
                  <td>#qry.size#</td>
                </tr>
                <tr>
                  <td width="55"><strong>Price</strong></td>
                  <td>$#qry.price#</td>
                </tr>
                <tr>
                  <td width="55" valign="top"><strong>Aminities</strong></td>
                  <td><cfloop list="#qry.aminities#" index="ListItem" delimiters=",">
                      #ListItem#<br />
                    </cfloop></td>
                </tr>
              </table>
            </div>
            <!--- <div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
              <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
              <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
            </div>--->
          </div>
        </div>
      </div>
      <h1>I am Intrested</h1>
      <div class="contentHolder">
        <div class="cboth dottedLineTop"></div>
        <p> Lorem Ipsum is simply dummy text of the prinstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
        <div class="intrested checkerLightBG">
          <table border="0" cellpadding="3" cellspacing="0">
            <tr>
              <td><p><strong>Name</strong></p></td>
              <td><input name="location" type="text" class="inp" /></td>
            </tr>
            <tr>
              <td><p><strong>Email</strong></p></td>
              <td><input name="location" type="text" class="inp" /></td>
            </tr>
            <tr>
              <td><p><strong>Telephone</strong></p></td>
              <td><input name="location" type="text" class="inp" /></td>
            </tr>
            <tr>
              <td><p><strong>Message</strong></p></td>
              <td><textarea name="msg" cols="50" rows="10"  class="inp"></textarea></td>
            </tr>
            <tr>
              <td colspan="2"><input name="" type="button" value="Send" class="glue secondary" /></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="cboth"></div>
  </div>
  <!--Second Page-->
</cfoutput>
<cfinclude template="#application.incPath#footer_2.cfm">
