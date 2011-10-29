<cfset IsSecurePage = ListFindNoCase("detail.cfm",listlast(cgi.script_name,"/\") , ",") neq 0>
<cfset IsLoginPrivilege = IsDefined("session.privilege")>
<cfif IsSecurePage>
  <cfif not IsLoginPrivilege>
  <cfset session.urlpath="#cgi.SCRIPT_NAME#">
    <cflocation url="#application.incPath#logout1.cfm?err=1" addtoken="no">
  </cfif>
</cfif>

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Real Estate Project</title>
<link href="#application.cssPath#style_1.css" rel="stylesheet" type="text/css" />
<script src="#application.jsPath#jquery.min.js"></script>
<script src="#application.jsPath#jquery.cross-slide.js"></script>
</head>
<body>
<cfinclude template="popup.cfm">
<div class="header">
  <div class="wrap">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><p>
		
		<a href="#application.basePath#index.cfm" class="heading">CARIBBEANREALESTATE.com</a>
		
		 <a href="##" class="glue">Sign up</a> 
		
		<cfif not IsLoginPrivilege>
		
		<a href="##" class="blueColor" onclick="Show_Popup();">Login</a> 
		<cfelse>
		<a href="#application.incPath#logout1.cfm" class="blueColor">Logout</a> 
		</cfif>
		
		
		<a href="##">News</a>
            <!--<a href="##">Browse</a> <a href="##">Music</a> <a href="##">Topics</a> <a href="##">Video Games</a>-->
          </p></td>
        <td align="right" width="300"><table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#111.png" align="left" border="0"/></a></td>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#222.png" align="left" border="0"/></a></td>
              <td><a href="##" class="nomargin noradious"><img src="#application.imgPath#333.png" align="left" border="0"/></a></td>
            </tr>
          </table>
          <!-- <td align="right"><input type="text" name="q" id="q" class="q"></td>
        <td width="60"><input name="Search" type="button" value="GO" class="qs" onclick="javascript:alert('Clicked');" />-->
        </td>
      </tr>
    </table>
  </div>
</div>
<div class="outer">
<div class="banner">
  <div class="w70p floatL">
    <div class="Banner1"> </div>
  </div>
  <div class="w30p floatL">
    <div class="Banner2">
      <!--SLIDESHOW-->
      <div style="position:relative; z-index:10000"> <img src="#application.imgPath#house-tile.png"  style="position:absolute; top:0; left:0;" /> </div>
      <div id="aaa" style="width:292px; height:235px;"></div>
      <script language="JavaScript" type="text/javascript">
			$('##aaa').crossSlide({
			speed: 45,
			fade: 1
			}, [
			{ src: '#application.imgPath#house.jpg', dir: 'up'   },
			{ src: '#application.imgPath#house.jpg', dir: 'right'   },
			{ src: '#application.imgPath#house1.jpg',   dir: 'down' },
			{ src: '#application.imgPath#house1.jpg',   dir: 'left' }
			]);
			</script>
      <!--SLIDESHOW-->
    </div>
  </div>
  <div class="cboth"></div>
  <div class="w70p floatL">
    <div class="Banner3 checkerLightBG">
      <h1 class="featured">Popular Locations</h1>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <cfset obj = createObject("component", "#application.commonCFC#")>
        <cfset myQuery = obj.ListPLocations()/>
        <cfset i = 0>
        <cfloop query="myQuery">
          <cfif i eq 0 >
            <tr>
            
          </cfif>
          <cfif i eq 2 >
            <cfset i = 0>
            <cfelse>
            <cfset i = i+1>
          </cfif>
          <td width="33%"><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">#obj.GetLocation(location_id).name#</a> </td>
            <cfif i eq 0 >
              </tr>
            </cfif>
        </cfloop>
      </table>
      <!---	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
 		<tr>
          <td width="33%"><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Lorem Ipsum Hills</a> </td>
          <td width="33%"><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Beverly Hills</a> </td>
          <td width="33%"><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Orem Ipsum</a> </td>
        </tr>
        <tr>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Beverly Hills</a> </td>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Orem Ipsum Lorem</a> </td>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Lorem Ipsum</a> </td>
        </tr>
        <tr>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Beverly Hills Ipsum</a> </td>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Beverly Hills</a> </td>
          <td><img src="#application.imgPath#star_fav.png" class="star"/> <a href="##"  class="popular">Beverly Hills</a> </td>
        </tr>
      </table>--->
    </div>
  </div>
  <div class="w30p floatL">
    <div class="Banner4">
      <script language="JavaScript" type="text/javascript" src="#application.jsPath#jquery.marquee.js"></script>
      <h1 class="featured">Real Estate News</h1>
      <marquee behavior="scroll" direction="up" scrollamount="1" height="130" width="100%" onmouseover="this.stop();" onmouseout="this.start();">
      <cfset myQuery1 = obj.ListNews()/>
      <cfloop query="myQuery1">
        <p><img src="#application.imgPath#hot-icon.png" align="left" class="hot" /> <strong>#title# (#DateFormat(posted,"dd-mmm-yyyy")#)</strong></p>
        <p>#summary#</p>
        <p> <a href="##"> &raquo; Read More</a></p>
        <br />
      </cfloop>
      </marquee>
      <!---  <h1 class="featured">Real Estate News</h1>
      <p><img src="#application.imgPath#hot-icon.png" align="left" class="hot" /> <strong>12-june-2011</strong></p>
      <p>Lorem Ipsum is simply dummy text of the prinstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
      <p> <a href="##"> &raquo; Read More</a></p>--->
    </div>
  </div>
  <div class="cboth"></div>
</div>
<div class="content searchcontent gradient">
  <div class="cboth"></div>
  <div class="w70p floatL">
    <div class="contentHolder">
      <h1>Search Properties</h1>
      <div class="contentHolder">
        <form name="f1" action="list.cfm" method="post">
          <table border="0" cellpadding="3" cellspacing="0" class="searchPanel">
            <tr>
              <td><strong>Location</strong></td>
              <td><strong>Type</strong></td>
              <td><strong>Bed</strong></td>
              <td><strong>Bath</strong></td>
              <td><strong>Price</strong></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><input name="location" type="text" class="w100px inp" /></td>
              <td><cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
                <select name="propertyType" class="w100px inp" style="width:120px;">
                  <option value="">Select</option>
                  <cfloop query="qry">
                    <option value="#id#">#name#</option>
                  </cfloop>
                </select></td>
              <td><select name="bed" class="w100px inp">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                </select></td>
              <td><select name="bath" class="w100px inp">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                </select></td>
              <td><!--<input name="priceFrom" type="text" class="w100px inp" />-->
                <cfset pricelist="10000,20000,30000,40000,50000,60000,70000,80000,90000,100000">
                <select name="priceFrom"  id="priceFrom" class="w100px inp">
                  <option value="">From</option>
                  <cfloop list="#pricelist#" index="ListItem" delimiters=",">
                    <option value="#ListItem#">#ListItem#</option>
                  </cfloop>
                </select>
              </td>
              <td><!--<input name="priceTo" type="text" class="w100px inp" />-->
                <select name="priceTo" id="priceTo" class="w100px inp" onchange="javascript:if($('##priceFrom').val() > $('##priceTo').val() ){alert('Price From should be lesser than Price To');$('##priceTo').val('');}">
                  <option value="">To</option>
                  <cfloop list="#pricelist#" index="ListItem" delimiters=",">
                    <option value="#ListItem#">#ListItem#</option>
                  </cfloop>
                </select>
              </td>
              <td><input name="submit" type="submit" value="Search" class="glue secondary" /></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
  <div class="w30p floatL">
    <div class="contentHolder dottedLineLt">
      <h1>Email Alert</h1>
      <div class="contentHolder">
        <table border="0" cellpadding="3" cellspacing="0" class="searchPanel">
          <tr>
            <td><strong>Email Address</strong></td>
            <td></td>
          </tr>
          <tr>
            <td><input name="location" type="text" class="w130px inp" /></td>
            <td><input name="submit" type="button" value="Go" class="glue secondary"  /></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <div class="cboth"></div>
</div>
</cfoutput> 
