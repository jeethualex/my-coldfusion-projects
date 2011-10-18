<cfinclude template="#application.incPath#header_2.cfm">
<cfif IsDefined("form")>
  <cfset qry11 = createObject("component", "#application.commonCFC#").SearchPropertyhome(form)/>
  <!---<cfdump var="#qry11#">--->
</cfif>

<cfoutput>
  <div class="content secondcontent">
  <div class="breadcrumb"><a href="##">Home</a> > <a href="##">Details</a></div>
  <div class="w25p floatL">
    <div class="sidePanelSearch gradient">
      <h1>Search Properties</h1>
      <div class="cboth dottedLineTop h10px"></div>
      <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tr>
          <td width="55"><strong>Location</strong></td>
          <td><input name="location" type="text" class="w120px inp" <cfif IsDefined("form.location")> value="#form.location#" </cfif>  /></td>
        </tr>
        <tr>
          <td><strong>Type</strong></td>
          <td><cfset qry = createObject("component", "#application.commonCFC#").ListCategories()/>
            <cfif IsDefined("form.propertyType")>
              <cfset propertyType=form.propertyType>
              <cfelse>
              <cfset propertyType=0>
            </cfif>
            <select name="propertyType" class="w120px inp">
              <option value="">Select</option>
              <cfloop query="qry">
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
          <td><input name="submit" type="button" value="Search" class="glue secondary" /></td>
        </tr>
      </table>
    </div>
    <!--<div class="sidePanelSearch checkerLightBG">
          <h1>Property Details</h1>
		  <div class="cboth dottedLineTop h10px"></div>
          <table border="0" cellpadding="3" cellspacing="0" width="100%">
            <tr>
              <td width="55"><strong>Location</strong></td>
              <td>Ipsum is simply d</td>
            </tr>
			<tr>
              <td width="55"><strong>Type</strong></td>
              <td>2</td>
            </tr>
           <tr>
              <td width="55"><strong>Bed</strong></td>
              <td>2</td>
            </tr>
			 <tr>
              <td width="55"><strong>Bath</strong></td>
              <td>2</td>
            </tr>
			 <tr>
              <td width="55"><strong>Price</strong></td>
              <td>$4255</td>
            </tr>
          </table>
        </div>-->
  </div>
  <div class="w75p floatL">
  <!-- <h1>Photo Gallery</h1>
	   <div class="contentHolder" align="center">
	    <div class="cboth dottedLineTop"></div>
	   <img src="#application.imgPath#gallery.jpg" />
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
	  
	  
	  </div>-->
  <h1>Search Results</h1>
  <div class="contentHolder">
  <script type="text/javascript">
   	function toggleView(){
	$("##complexview").toggleClass("hide");
	$("##simpleview").toggleClass("hide");
	}
   </script>
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tr>
      <td><p><strong>#qry11.recordcount# Result(s)</strong></p></td>
      <td width="10"><span class="MSIcon gridViewSelectedSmall" onclick="javascript:toggleView();"></span></td>
      <td width="10"><span class="MSIcon listViewStaticSmall" onclick="javascript:toggleView();"></span></td>
    </tr>
  </table>
  <div class="cboth dottedLineTop"></div>
</cfoutput>
<!---LOOP--->
<cfset pagination = createObject("component", "#application.cfcPath#.Pagination").init()/>
<cfset pagination.setQueryToPaginate(qry11) />
<cfset pagination.setItemsPerPage(12) />
<cfset pagination.setUrlPageIndicator("page") />
<cfset pagination.setShowNumericLinks(true) />
<cfset i = 0>
<div  id="complexview"> <cfoutput query="qry11" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
    <cfset i = i+1>
    <cfset qryStr = "id=#id#">
    <div class="w25p floatL">
      <div class="contentHolder" align="center">
        <div class="checkerLightBG imageWrapper polaroids"><img src="#application.uploadPath##ListFirst(qry11.photos)#" class="tbnl1"/></div>
        <p class="at#qry11.currentrow#"><a href="#application.basePath#detail.cfm?#qryStr#">#qry11.title#</a></p>
        <!---<cfsavecontent variable="temp">
			
			<table>
			<tr><td>Price</td><td>#qry11.price#</td></tr>
			<tr><td>Bedrooms</td><td>#qry11.bedrooms#</td></tr>
			<tr><td>Bathrooms</td><td>#qry11.bathrooms#</td></tr>
			<tr><td>Description</td><td>#qry11.description#</td></tr>
			</table>
			
			</cfsavecontent>--->
        <script type="text/javascript">

$(".at#qry11.currentrow#").qtip({
   content: '#qry11.description# <br/> <br/> Price:#qry11.price# <br/> Bedrooms:#qry11.bedrooms# <br/>Bathrooms:#qry11.bathrooms#',
   style: { 
      width: 200,
      padding: 5,
      background: '##cccccc',
      color: '##262626',
      textAlign: 'left',
      border: {
         width: 7,
         radius: 5,
         color: '##262626'
      },
      tip: 'topLeft',
      name: 'dark' // Inherit the rest of the attributes from the preset dark style
   }
});


/*$(".at").qtip({
   content: 'Dark themes are all the rage!',
   style: { 
      name: 'dark' // Inherit from preset style
   }
});*/
	
	/*$(".at").qtip({
	   content: 'I\'m at the top right of my target'
	});
*/
</script>
      </div>
    </div>
    <cfif ( i mod 4 eq 0 )>
      <div class="cboth"></div>
    </cfif>
  </cfoutput> </div>
<!---LOOP--->
<!---LOOP1--->
<div id="simpleview" class="hide"> <cfoutput query="qry11" startrow="#pagination.getStartRow()#" maxrows="#pagination.getMaxRows()#">
    <div class="cboth">
      <div class="contentHolder" align="center">
        <div class="w25p floatL">
          <div class="checkerLightBG imageWrapper polaroids"><img src="#application.uploadPath##ListFirst(qry11.photos)#" class="tbnl1"/></div>
          <p class="at#qry11.currentrow#"><a href="#application.basePath#detail.cfm?#qryStr#">#qry11.title#</a></p>
        </div>
        <div class="w75p floatL" align="left">
          <table>
            <tr>
              <td style="padding:5px">title</td>
              <td style="padding:5px">#qry11.title#</td>
            </tr>
            <tr>
              <td style="padding:5px">description</td>
              <td style="padding:5px">#qry11.description#</td>
            </tr>
            <tr>
              <td style="padding:5px">price</td>
              <td style="padding:5px">#qry11.price#</td>
            </tr>
            <tr>
              <td style="padding:5px">bedrooms</td>
              <td style="padding:5px">#qry11.bedrooms#</td>
            </tr>
            <tr>
              <td style="padding:5px">bathrooms</td>
              <td style="padding:5px">#qry11.bathrooms#</td>
            </tr>
          </table>
        </div>
        <div class="cboth"></div>
      </div>
    </div>
  </cfoutput> </div>
<!---LOOP1--->
<cfoutput>
  <div class="cboth"></div>
  <p>#pagination.getRenderedHTML()#</p>
</cfoutput>
<!---  
	  
	  
	  <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1"/></div>
            <p class="at"><a href="##">Ipsum is simply dummy</a></p>
            <script type="text/javascript">

$(".at").qtip({
   content: 'Presets, presets and more presets. Let\'s spice it up a little with our own style!',
   style: { 
      width: 200,
      padding: 5,
      background: '##cccccc',
      color: '##262626',
      textAlign: 'center',
      border: {
         width: 7,
         radius: 5,
         color: '##262626'
      },
      tip: 'topLeft',
      name: 'dark' // Inherit the rest of the attributes from the preset dark style
   }
});


/*$(".at").qtip({
   content: 'Dark themes are all the rage!',
   style: { 
      name: 'dark' // Inherit from preset style
   }
});*/
	
	/*$(".at").qtip({
	   content: 'I\'m at the top right of my target'
	});
*/
</script>
          </div>
        </div>
	  
	  
	  
	  
	  
	  <div class="w25p floatL"> 
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa1.jpg" class="tbnl1"/></div>
            <p><a href="##">Ipsum is simply dummy</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa2.jpg" class="tbnl1"/></div>
            <p><a href="##">Ipsum is simply dummyg</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1"/></div>
            <p><a href="##">Sub Ipsum is simply dummy</a></p>
          </div>
        </div>
        <div class="cboth"></div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1"/></div>
            <p><a href="##">Ipsum is simply dummy Heading</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa1.jpg" class="tbnl1" /></div>
            <p><a href="##">Sub Ipsum is simply dummy</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa2.jpg" class="tbnl1" /></div>
            <p><a href="##">Ipsum is simply dummy Heading</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1" /></div>
            <p><a href="##">Sub HeIpsum is simply dummying</a></p>
          </div>
        </div>
        <div class="cboth"></div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1" /></div>
            <p><a href="##">Ipsum is simply dummy Heading</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa1.jpg" class="tbnl1" /></div>
            <p><a href="##">Sub Ipsum is simply dummy</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa2.jpg" class="tbnl1" /></div>
            <p><a href="##">Ipsum is simply dummy Heading</a></p>
          </div>
        </div>
        <div class="w25p floatL">
          <div class="contentHolder" align="center">
            <div class="checkerLightBG imageWrapper polaroids"><img src="#application.imgPath#villa.jpg" class="tbnl1" /></div>
            <p><a href="##">Sub HeIpsum is simply dummying</a></p>
          </div>
        </div>--->
<!--- <div class="pagination"> <a href="##" class="selected">1</a> <a href="##">2</a> <a href="##">3</a> ... <a href="##" class="but">&laquo; Prev</a> <a href="##" class="but but1">Next &raquo;</a> </div>--->
</div>
</div>
<div class="cboth"></div>
</div>
<!--Second Page-->
<cfinclude template="#application.incPath#footer_2.cfm">
