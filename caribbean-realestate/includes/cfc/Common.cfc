<cfcomponent>
<cffunction name="InsertUser" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO users (username,password,privilege,email,phone,expiry) VALUES(
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.username#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.password#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.privilege#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.email#">
    ,
    <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.frm.phone#">
    ,
    <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.frm.expiry#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="ListUsers" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from users order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="GetUser" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from users where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchUser" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from users where #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="DeleteUser" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from users where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="CheckUser" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from users where username =
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.username#">
  AND
  password =
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.password#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchCategory" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from categories where #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="ListCategories" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from categories order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertCategory" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO categories (name) VALUES(
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.name#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="UpdateCategory" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE categories SET 
    name=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.name#">
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetCategory" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from categories where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="DeleteCategory" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from categories where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="ListProperties" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from properties order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchProperty" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from properties where #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertProperty" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO properties (title,description,category_id,bedrooms,bathrooms,size,price,location,aminities,photos,featured,status,posted) VALUES(
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.title#">
    ,
    <cfqueryparam cfsqltype="cf_sql_mediumtext" value="#arguments.frm.description#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.category#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bedrooms#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bathrooms#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.size#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.price#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.location#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.aminities#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.photos#">
    ,
    <cfqueryparam cfsqltype="cf_sql_tinyint" value="#arguments.frm.featured#">
    ,
    <cfqueryparam cfsqltype="cf_sql_tinyint" value="#arguments.frm.status#">
    ,
    <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now(),'mm/dd/yyyy')#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="UpdateProperty" access="public" returntype="boolean" output="true">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE properties SET 
    title=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.title#">
    ,
    description=
    <cfqueryparam cfsqltype="cf_sql_mediumtext" value="#arguments.frm.description#">
    ,
    category_id=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.category#">
    ,
    bedrooms=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bedrooms#">
    ,
    bathrooms=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bathrooms#">
    ,
    size=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.size#">
    ,
    price=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.price#">
    ,
    location=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.location#">
    ,
    aminities=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.aminities#">
    ,
    photos=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.photos#">
    <cfif IsDefined("arguments.frm.featured")>
,featured=
      <cfqueryparam cfsqltype="cf_sql_tinyint" value="#arguments.frm.featured#">
      <cfelse>
      ,featured= 0
    </cfif>
    <cfif IsDefined("arguments.frm.status")>
,status=
      <cfqueryparam cfsqltype="cf_sql_tinyint" value="#arguments.frm.status#">
      <cfelse>
      ,status= 0
    </cfif>
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfdump var="#cfcatch#">
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetProperty" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from properties where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="ListCountries" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '0' order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertLocation" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO locations (name,type,parent_id) VALUES(
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.name#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.type#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.parent_id#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="UpdateLocation" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE locations SET 
    name=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.name#">
    ,
    type=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.type#">
    ,
    parent_id=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.parent_id#">
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetLocation" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="DeleteLocation" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from locations where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="SearchCountry" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '0' AND #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="ListStates" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '1' order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="GetStates" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '1'
  AND parent_id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  order by name asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="GetCities" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '2'
  AND parent_id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  order by name asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="GetCountries" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '0'
  order by name asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="GetState" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '1'
  AND id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  order by name asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchState" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '1' AND  #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="ListCities" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '2' order by id desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchCity" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from locations where type = '2' AND  #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="DeleteProperty" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from properties where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="ListFCategories" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from featured_categories order by ordernum asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertFCategory" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO featured_categories (category_id,ordernum) VALUES(
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.category_id#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.ordernum#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="UpdateFCategory" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE featured_categories SET 
    category_id=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.category_id#">
    ,
    ordernum=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.ordernum#">
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetFCategory" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from featured_categories where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="DeleteFCategory" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from featured_categories where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="ListPLocations" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from popular_locations order by ordernum asc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertPLocation" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO popular_locations (location_id,ordernum) VALUES(
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.plocation_id#">
    ,
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.ordernum#">
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetPLocation" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from popular_locations where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="UpdatePLocation" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE  popular_locations SET 
    location_id=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.plocation_id#">
    ,
    ordernum=
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.ordernum#">
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="DeletePLocation" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from popular_locations where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="ListNews" access="public" returntype="any">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from  news order by posted desc;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchNews" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from news where #arguments.frm.type# LIKE
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.keyword#%">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="InsertNews" access="public" returntype="boolean">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
INSERT INTO news (title,summary,detail,posted,featured) VALUES(
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.title#">
    ,
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.summary#">
    ,
    <cfqueryparam cfsqltype="cf_sql_mediumtext" value="#arguments.frm.detail#">
    ,
    <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.frm.posted#">
    ,
    <cfif IsDefined("arguments.frm.featured")>
      <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.featured#">
      <cfelse>
      0
    </cfif>
    );
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetNews" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from news where id =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="UpdateNews" access="public" returntype="boolean" output="true">
  <cfargument name="frm" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
UPDATE news SET 
    title=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.title#">
    ,
    summary=
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.summary#">
    ,
    detail=
    <cfqueryparam cfsqltype="cf_sql_mediumtext" value="#arguments.frm.detail#">
    ,
    posted=
    <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.frm.posted#">
    <cfif IsDefined("arguments.frm.featured")>
,featured=
      <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.featured#">
      <cfelse>
      ,featured= 0
    </cfif>
    WHERE id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfdump var="#cfcatch#">
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="DeleteNews" access="public" returntype="boolean">
  <cfargument name="id" type="any" required="yes">
  <cftry>
    <cfquery name="myQuery" datasource="#application.dsn#">
DELETE from news where id =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
    ;
    </cfquery>
    <cfcatch>
      <cfreturn false>
    </cfcatch>
  </cftry>
  <cfreturn true>
</cffunction>
<cffunction name="GetFProperty" access="public" returntype="any">
  <cfargument name="id" type="any" required="yes">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT * from properties where category_id  =
  <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.id#">
  AND 
  featured='1' 
  order by id desc
  ;
  </cfquery>
  <cfreturn myQuery>
</cffunction>
<cffunction name="SearchPropertyhome" access="public" returntype="any">
  <cfargument name="frm" type="any" required="yes">
  
  <cfif IsDefined("arguments.frm.location") and arguments.frm.location neq "">
  <cfquery name="myQuery" datasource="#application.dsn#">
SELECT id 
  FROM  locations
  WHERE UPPER( name ) = UPPER(
  <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.frm.location#">
  )
  </cfquery>
 <cfset locationId = myQuery.id>
 </cfif>
  <cfquery name="myQuery1" datasource="#application.dsn#">
SELECT * 
  FROM  properties
  WHERE status = '1'
  <cfif IsDefined("locationId")>
AND FIND_IN_SET( '#locationId#', location)
  </cfif>
  <cfif IsDefined("arguments.frm.propertyType") and arguments.frm.propertyType neq "">
AND category_id = 
<cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.propertyType#">
  </cfif>
  <cfif IsDefined("arguments.frm.bed") and arguments.frm.bed neq "">
AND bedrooms =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bed#">
  </cfif>
  <cfif IsDefined("arguments.frm.bath") and arguments.frm.bath neq "">
AND bathrooms =
    <cfqueryparam cfsqltype="cf_sql_smallint" value="#arguments.frm.bath#">
  </cfif>
  
  <cfif IsDefined("arguments.frm.priceFrom") and IsDefined("arguments.frm.priceTo")>
  <cfif arguments.frm.priceFrom neq "" and arguments.frm.priceTo neq "">
AND CONVERT(price, DECIMAL) Between <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.frm.priceFrom#"> and <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.frm.priceTo#">
    <cfelseif arguments.frm.priceFrom neq "" and arguments.frm.priceTo eq "">
    AND CONVERT(price, DECIMAL) >=
    <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.frm.priceFrom#">
    <cfelseif arguments.frm.priceFrom eq "" and arguments.frm.priceTo neq "">
    AND CONVERT(price, DECIMAL) <=
    <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.frm.priceTo#">
  </cfif>
  </cfif>
  ;
  </cfquery>
  <cfreturn myQuery1>
</cffunction>
</cfcomponent>
