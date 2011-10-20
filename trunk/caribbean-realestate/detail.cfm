<cfinclude template="#application.incPath#header_2.cfm">
<cfset obj = createObject("component", "#application.commonCFC#")>
<cfif IsDefined("url.id")>
  <cfset propertyid = url.id>
  <cfset qry = obj.GetProperty(propertyid)/>
  <cfset loc=ListToArray(qry.location)>
  <cfset photos=ListToArray(qry.photos)>
  <cfset photoindex=ArrayLen(photos)>
</cfif>
<!---<script src="http://jqueryui.com/jquery-1.6.2.js"></script>
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
</script>--->
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
        <!---new gallery--->
        <link rel="stylesheet" href="#application.jsPath#tabs/general.css" type="text/css" media="screen">
        <div id="container_tabs">
          <ul class="menu_tabs">
            <li id="news" class="active">Photo Gallery</li>
            <li id="tutorials" class="">Location Map</li>
            <li id="links" class="">Other Details</li>
          </ul>
          <span class="clear"></span>
          <div class="content news" style="display: block; ">
           
		   <!---NEW GALLERY--->
		   <link rel="stylesheet" type="text/css" href="#application.jsPath#gallery/jquery.ad-gallery.css">
		     <script type="text/javascript" src="#application.jsPath#gallery/jquery.ad-gallery.js"></script>
  <script type="text/javascript">
  $(function() {
    $('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
    $('img.image1').data('ad-title', 'Title through $.data');
    $('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
    $('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');
    var galleries = $('.ad-gallery').adGallery();
    $('##switch-effect').change(
      function() {
        galleries[0].settings.effect = $(this).val();
        return false;
      }
    );
    $('##toggle-slideshow').click(
      function() {
        galleries[0].slideshow.toggle();
        return false;
      }
    );
    $('##toggle-description').click(
      function() {
        if(!galleries[0].settings.description_wrapper) {
          galleries[0].settings.description_wrapper = true;/*$('##descriptions');*/
        } else {
          galleries[0].settings.description_wrapper = false;
        }
        return false;
      }
    );
  });
  </script> 
		 <style type="text/css">   
		  ##gallery {
    margin-left: auto;
    margin-right: auto;
    padding: 30px;
}
  ##descriptions {
    position: relative;
    height: 50px;
    background: ##EEE;
    margin-top: 10px;
    width: 640px;
    padding: 10px;
    overflow: hidden;
  }
    ##descriptions .ad-image-description {
      position: absolute;
    }
      ##descriptions .ad-image-description .ad-description-title {
        display: block;
      }
	  
	  ##container_tabs {
margin: 0;
}
  </style>
		   
		   
		   <div id="gallery" class="ad-gallery" align="center">
      <div class="ad-image-wrapper">
      </div>
      <div class="ad-controls">
      </div>
      <div class="ad-nav">
        <div class="ad-thumbs">
          <ul class="ad-thumb-list">
		   <cfloop index="i" from="1" to="#arrayLen(photos)#" step="1">
            <li>		
              <a href="#application.uploadPath##photos[i]#">
                <img src="#application.uploadPath##photos[i]#" class="image0" width="120">
              </a>
            </li>
			</cfloop>
           <!--- <li>
              <a href="#application.uploadPath#villa.jpg">
                <img src="#application.uploadPath#villa.jpg" title="A title for 10.jpg" alt="This is a nice, and incredibly descriptive, description of the image 10.jpg" class="image1" width="120">
              </a>
            </li>
            <li>
              <a href="#application.uploadPath#villa.jpg">
                <img src="#application.uploadPath#villa.jpg" title="A title for 11.jpg" longdesc="http://coffeescripter.com" alt="This is a nice, and incredibly descriptive, description of the image 11.jpg" class="image2" width="120">
              </a>
            </li>--->
           
          </ul>
        </div>
      </div>
    </div>
	
	<!--- <div id="descriptions">

    </div>
		   --->
		   
		   
		   
		   <!---NEW GALLERY--->
		   
		   
		    <!---OLD GALLERY--->
            <!---<cfif photoindex gt 0>
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
            </cfif>--->
            <!---OLD GALLERY--->
          </div>
          <div class="content tutorials" style="display: none; ">
           
			   
		   
		   
		   
		   
		 <style type="text/css">
  ##map_canvas { width:100%; height: 450px; }
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
          <div class="content links" style="display: none; ">
            <table border="0" cellpadding="5" cellspacing="0" width="100%">
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
        </div>
        <script type="text/javascript" src="#application.jsPath#tabs/tabs.js"></script>
        <!---new gallery--->
        <!---OLD GALLERY--->
        <!---<div class="demo">
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
          </div>
        </div>--->
        <!---OLD GALLERY--->
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
