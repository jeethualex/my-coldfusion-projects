<cfoutput>
</div>
<div class="content tabcontent checkerLightBG">
  <table border="0" cellpadding="2" cellspacing="0" class="categories">
    <tr>
      <cfset myQuery2 = obj.ListFCategories()/>
        <cfloop query="myQuery2">
          <td width="100" <cfif currentrow gt 1>class="dottedLineLt"<cfelse><cfset FirstCategoryId = category_id></cfif> align="center"><a href="##" onclick="javascript:$('.loadArea').load('#application.incPath#ajax_featured_category.cfm?catid=#category_id#&items=3');">#obj.GetCategory(category_id).name#</a></td>
        </cfloop>
	 
	 <!--- <td width="100" align="center"><a href="##">Category 1</a></td>
      <td width="100" class="dottedLineLt" align="center"><a href="##">Category 2</a></td>
      <td width="100" class="dottedLineLt" align="center"><a href="##">Category 3</a></td>
      <td width="100" class="dottedLineLt" align="center"><a href="##">Category 4</a></td>--->
    </tr>
  </table>
</div>
<div class="content">
  <!---<h1>Search Properties</h1>
	<div class="contentHolder">
	<div class="cboth dottedLine"></div>
	</div>--->
  <!-- <h1>Featured Content</h1>
    <div class="cboth"></div>
    <div class="w50p floatL">
      <div class="contentHolder"> <img src="#application.imgPath#villa.jpg" class="tbnl" align="left" />
        <h1><a href="##">Scrambled it</a></h1>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
        <p> <a href="##">Read More</a></p>
      </div>
    </div>
    <div class="w50p floatL">
      <div class="contentHolder"> <img src="#application.imgPath#villa1.jpg" class="tbnl" align="left" />
        <h1><a href="##">Lorem Ipsum has been</a></h1>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
        <p> <a href="##">Read More</a></p>
      </div>
    </div>
    <div class="cboth"></div>-->
	 <div class="loadArea"><img src="#application.imgPath#loading.gif" width="35" height="35" /></div>
    <script language="JavaScript" type="text/javascript">
	$(document).ready(function() {
$('.loadArea').load('#application.incPath#ajax_featured_category.cfm?catid=#FirstCategoryId#&items=3');
});
	
	

</script>
  <!---<h1>Category 1 - Featured Properties</h1>
  <div class="cboth"></div>
  <div class="w33p floatL">
    <div class="contentHolder"> <img src="#application.imgPath#villa.jpg" class="tbnl" align="left" />
      <h1><a href="##">Scrambled it</a></h1>
      <p>Lorem Ipsum is simply dummy text of the printing and then an unknown printer took a galley of type and make  not only five centuries Lorem Ipsum.</p>
      <p> <a href="##">&raquo; See Details</a></p>
    </div>
  </div>
  <div class="w33p floatL">
    <div class="contentHolder"> <img src="#application.imgPath#villa1.jpg" class="tbnl" align="left" />
      <h1><a href="##">Scrambled it</a></h1>
      <p>Lorem Ipsum is simply dummy text of the printing  printer  and scrambled it to make a tysurvived not only five centuries Lorem Ipsum.</p>
      <p> <a href="##">&raquo; See Details</a></p>
    </div>
  </div>
  <div class="w33p floatL">
    <div class="contentHolder"> <img src="#application.imgPath#villa2.jpg" class="tbnl" align="left" />
      <h1><a href="##">Scrambled it</a></h1>
      <p>Lorem Ipsum is simply dummy text of the printinprinter took a galley a type specimen book. It has survived not only five centuries Lorem Ipsum.</p>
      <p> <a href="##">&raquo; See Details</a></p>
    </div>
  </div>--->
  <div class="cboth h5px"></div>
</div>
<div class="footer checkerLightBG">
  <p>Copyright © 2011-2012 BuyRentSellCaribbean Inc. All Rights Reserved </p>
</div>
</div>
<div class="h10px"></div>
</body></html>
</cfoutput>