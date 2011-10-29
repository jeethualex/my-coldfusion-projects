<cfinclude template="#application.incPath#header_2.cfm">
<cfset obj = createObject("component", "#application.commonCFC#")>
<cfif IsDefined("url.id")>
  <cfset propertyid = url.id>
  <cfset qry = obj.GetProperty(propertyid)/>
  <cfset loc=ListToArray(qry.location)>
  <cfset photos=ListToArray(qry.photos)>
  <cfset photoindex=ArrayLen(photos)>
</cfif>
 <cfset qryStr1 = "id=#propertyid#">
<cfoutput>
  <div class="content secondcontent">
    <div class="breadcrumb"><a href="#application.basePath#">Home</a> > <a href="#application.basePath#detail.cfm?#qryStr1#">Details</a></div>
    <div class="w25p floatL">
      <!--- SEARCH PANEL--->
      <cfif IsDefined("form")>
        <cfset qry11 = createObject("component", "#application.commonCFC#").SearchPropertyhome(form)/>
        <!---<cfdump var="#qry11#">--->
      </cfif>
      <div class="sidePanelSearch gradient">
        <h1>Search Properties</h1>
        <div class="cboth dottedLineTop h10px"></div>
		<form name="f1" action="list.cfm" method="post">
        <table border="0" cellpadding="3" cellspacing="0" width="100%">
          <tr>
            <td width="55"><strong>Location</strong></td>
            <td><input name="location" type="text" class="w120px inp" <cfif IsDefined("form.location")> value="#form.location#" </cfif>  /></td>
          </tr>
          <tr>
            <td><strong>Type</strong></td>
            <td><cfset qry12 = createObject("component", "#application.commonCFC#").ListCategories()/>
              <cfif IsDefined("form.propertyType")>
                <cfset propertyType=form.propertyType>
                <cfelse>
                <cfset propertyType=0>
              </cfif>
              <select name="propertyType" class="w120px inp">
                <option value="">Select</option>
                <cfloop query="qry12">
                  <option value="#id#" <cfif id eq propertyType>selected="selected" </cfif>>#name#</option>
                </cfloop>
              </select>
            </td>
          </tr>
          <tr>
            <td><strong>Bed</strong></td>
            <td><cfif IsDefined("form.bed")>
                <cfset bed=form.bed>
                <cfelse>
                <cfset bed=0>
              </cfif>
              <select name="bed" class="w120px inp">
			   <option value=""></option>
                <option value="1" <cfif bed eq 1>selected="selected" </cfif>>1</option>
                <option value="2" <cfif bed eq 2>selected="selected" </cfif>>2</option>
                <option value="3" <cfif bed eq 3>selected="selected" </cfif>>3</option>
              </select></td>
          </tr>
          <tr>
            <td><strong>Bath</strong></td>
            <td><cfif IsDefined("form.bath")>
                <cfset bath=form.bath>
                <cfelse>
                <cfset bath=0>
              </cfif>
              <select name="bath" class="w120px inp">
			   <option value=""></option>
                <option value="1" <cfif bath eq 1>selected="selected" </cfif> >1</option>
                <option value="2" <cfif bath eq 2>selected="selected" </cfif>>2</option>
                <option value="3" <cfif bath eq 3>selected="selected" </cfif>>3</option>
              </select></td>
          </tr>
          <tr>
            <td><strong>Price</strong></td>
            <td><!--<input name="priceFrom" type="text" class="w100px inp" />-->
              <cfif IsDefined("form.propertyType")>
                <cfset priceFrom=form.priceFrom>
                <cfelse>
                <cfset priceFrom=0>
              </cfif>
              <cfset pricelist="10000,20000,30000,40000,50000,60000,70000,80000,90000,100000">
              <select name="priceFrom" class="w120px inp">
                <option value="">From</option>
                <cfloop list="#pricelist#" index="ListItem" delimiters=",">
                  <cfoutput>
                    <option value="#ListItem#"  <cfif priceFrom eq ListItem>selected="selected" </cfif>>#ListItem#</option>
                  </cfoutput>
                </cfloop>
              </select>
            </td>
          </tr>
          <tr>
            <td></td>
            <td><strong>
              <cfif IsDefined("form.propertyType")>
                <cfset priceTo=form.priceTo>
                <cfelse>
                <cfset priceTo=0>
              </cfif>
              </strong>
              <!--<input name="priceTo" type="text" class="w100px inp" />-->
              <select name="priceTo" class="w120px inp">
                <option value="">To</option>
                <cfloop list="#pricelist#" index="ListItem" delimiters=",">
                  <cfoutput>
                    <option value="#ListItem#" <cfif priceTo eq ListItem>selected="selected" </cfif>>#ListItem#</option>
                  </cfoutput>
                </cfloop>
              </select>
            </td>
          </tr>
          <tr>
            <td></td>
            <td><input name="submit" type="submit" value="Search" class="glue secondary" /></td>
          </tr>
        </table>
		</form>
      </div>
      <!--- SEARCH PANEL--->
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
      <div class="sidePanelSearch checkerLightBG">
        <h1>Enquiry</h1>
        <div class="cboth dottedLineTop h10px"></div>
        <!---<table border="0" cellpadding="3" cellspacing="0" width="100%">
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
        </table>--->
		<form name="f2" action="#application.incPath#email.cfm" method="post">
        <table border="0" cellpadding="1" cellspacing="0" width="100%">
          <tr>
            <td><strong>Name</strong><br />
              <input name="name" type="text" class="w195px inp" /></td>
          </tr>
          <tr>
            <td><strong>Email</strong><br />
              <input name="email" type="text" class="w195px inp" /></td>
          </tr>
          <tr>
            <td><strong>Telephone</strong><br />
              <input name="phone" type="text" class="w195px inp" /></td>
          </tr>
          <tr>
            <td><strong>Message</strong><br />
              <textarea name="msg" cols="50" rows="6"  class="w195px inp"></textarea></td>
          </tr>
          <tr>
            <td align="right"><input name="submitmsg" type="submit" value="Send" class="glue secondary" /><input name="propertyid" type="hidden" value="#propertyid#" /></td>
          </tr>
        </table>
		</form>
      </div>
      <div class="h5px"></div>
    </div>
    <div class="w75p floatL">
      <h1>Photo Gallery</h1>
      <div class="contentHolder" align="center">
        <div class="cboth dottedLineTop"></div>
        <div class="contentHolder">
          <!-- <img src="#application.imgPath#gallery.jpg" />-->
          <!---new gallery--->
          <link rel="stylesheet" href="#application.jsPath#tabs/general.css" type="text/css" media="screen">
          <div id="container_tabs">
            <ul class="menu_tabs">
              <li id="news" class="active">Home Facts</li>
              <li id="tutorials" class="">Location Map</li>
              <li id="links" class="">Photos (#arrayLen(photos)#)</li>
            </ul>
            <span class="clear"></span>
            <div class="tab_content news">
              <!---GALLERY--->
              <cfoutput>
                <link rel="stylesheet" type="text/css" href="#application.jsPath#gallery/jquery.ad-gallery.css">
                <script type="text/javascript" src="#application.jsPath#gallery/jquery.ad-gallery.js"></script>
                <script type="text/javascript">
$(document).ready(function(){


$(function() {
	$('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
	$('img.image1').data('ad-title', 'Title through $.data');
	$('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
	$('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');
	var galleries = $('.ad-gallery').adGallery();
	$('##switch-effect').change(function() {
		galleries[0].settings.effect = $(this).val();
		return false;
	});
	$('##toggle-slideshow').click(function() {
		galleries[0].slideshow.toggle();
		return false;
	});
	$('##toggle-description').click(function() {
		if(!galleries[0].settings.description_wrapper) {
		galleries[0].settings.description_wrapper = true;/*$('##descriptions');*/
		} else {
		galleries[0].settings.description_wrapper = false;
		}
		return false;
	});
});


});
</script>
                <style type="text/css">   
##gallery, ##gallery1 {
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
                <style type="text/css">   
/*new style*/
.gallery1 {
border: 1px solid ##D0CCC9;
border-radius: 5px 5px 5px 5px;
width:300px;
}

.gallery1 .ad-image-wrapper {
height: 300px;
}
/*new style*/
</style>
              </cfoutput>
              <!---GALLERY--->
              <!---NEW GALLERY--->
              <table class="noborder" cellpadding="5">
                <tr>
                  <td width="300"><div id="gallery" class="ad-gallery checkerLightBG gallery1" align="center">
                      <div class="ad-image-wrapper"> </div>
                      <div class="ad-controls"> </div>
                      <div class="ad-nav">
                        <div class="ad-thumbs">
                          <ul class="ad-thumb-list">
                            <cfloop index="i" from="1" to="#arrayLen(photos)#" step="1">
                              <li> <a href="#application.uploadPath##photos[i]#"> <img src="#application.uploadPath##photos[i]#" class="image0" width="100"> </a> </li>
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
                    <!--- <div id="descriptions"></div>--->
                  </td>
                  <td valign="top"><!---DETAILS--->
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
                    <!---DETAILS--->
                  </td>
                </tr>
              </table>
              <!---NEW GALLERY--->
            </div>
            <div class="tab_content tutorials">
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
            <div class="tab_content links">
              <table class="noborder" cellpadding="5" width="100%">
                <tr>
                  <td><div id="gallery1" class="ad-gallery" align="center">
                      <div class="ad-image-wrapper"> </div>
                      <div class="ad-controls"> </div>
                      <div class="ad-nav">
                        <div class="ad-thumbs">
                          <ul class="ad-thumb-list-1" style="width:555px;">
                            <cfloop index="i" from="1" to="#arrayLen(photos)#" step="1">
                              <li> <a href="#application.uploadPath##photos[i]#"> <img src="#application.uploadPath##photos[i]#" class="image0" width="100"> </a> </li>
                            </cfloop>
                          </ul>
                        </div>
                      </div>
                    </div></td>
                </tr>
              </table>
              <!--- <table border="0" cellpadding="5" cellspacing="0" width="100%">
              <tr>
                <td width="55"><strong>Title</strong></td>
                <td>
				
				#qry.title#</td>
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
            </table>--->
            </div>
          </div>
          <script type="text/javascript" src="#application.jsPath#tabs/tabs.js"></script>
          <!---new gallery--->
        </div>
      </div>
      <!---<div class="contentHolder">
        
        <div class="intrested checkerLightBG">
		
		 
		<div class="cboth dottedLineTop"></div>
        <p> Lorem Ipsum is simply dummy text of the prinstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
		 <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tr><th colspan="2"><h1>I am Intrested in #title#</h1></th></tr>
			
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
      </div>--->
    </div>
    <div class="cboth"></div>
  </div>
  <!--Second Page-->
</cfoutput>
<cfinclude template="#application.incPath#footer_2.cfm">
<script language="JavaScript" type="text/javascript">
$(document).ready(function(){
	$("div.news").css("display", "block");
	$("div.tutorials").css("display", "none");
	$("div.links").css("display", "none");
});
</script>
