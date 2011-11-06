<cfoutput>
  <p class="menu"> <a href="#application.basePath#admin.cfm">Home</a> |
    <cfif IsAdminPrivilege>
      <a href="#application.incPath#country_list.cfm">Countries</a> | <a href="#application.incPath#state_list.cfm">States</a> | <a href="#application.incPath#city_list.cfm">Cities</a> |
	  <a href="#application.incPath#user_list.cfm">Users</a> | <a href="#application.incPath#category_list.cfm">Categories</a> |
    </cfif>
    <a href="#application.incPath#featured_category_list.cfm">Featured Categories</a> |
	 <a href="#application.incPath#popular_locations_list.cfm">Popular Locations</a> |
	<a href="#application.incPath#property_list.cfm">Properties</a> | 
	<a href="#application.incPath#news_list.cfm">News</a> |
	<a href="#application.incPath#logout.cfm">Logout</a> </p>
</cfoutput>