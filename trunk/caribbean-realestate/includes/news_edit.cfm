<cfparam name="page" default="1">
<cfparam name="search" default="">
<cfif IsDefined("url.page")>
  <cfset page = url.page>
</cfif>
<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").UpdateNews(form)/>
</cfif>
<cfinclude template="#application.incPath#header.cfm">
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

<h1>Edit News</h1>
<cfif isDefined("success") and success>
  <cfset urlLoc = "news_list.cfm">
  <cfset urlLoc = urlLoc&"?page=#form.page#">
  <cflocation url="#urlLoc#" addtoken="no">
</cfif>
<cfif IsDefined("url.id")>
  <cfset news = createObject("component", "#application.commonCFC#").GetNews(url.id)/>
</cfif>
</cfoutput>
<cfif isDefined("news.recordcount")>
  <cfoutput query="news">
    <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
    <form action="" method="post" id="aForm" >
      <table class="noborder">
        <tr>
          <td>title</td>
          <td><input name="title" type="text" maxlength="50" class="required" value="#title#"/></td>
        </tr>
        <tr>
          <td>summary</td>
          <td><textarea name="summary" cols="40" rows="5">#summary#</textarea>
          </td>
        </tr>
        <tr>
          <td>detail news</td>
          <td><textarea name="detail" cols="40" rows="8">#detail#</textarea>
          </td>
        </tr>
        <tr>
          <td>posted on</td>
          <td><input name="posted" type="text" class="cal required" readonly="readonly" value="#DateFormat(posted,'mm/dd/yyyy')#"/>
          </td>
        </tr>
        <tr>
          <td>featured</td>
          <td><input name="featured" type="checkbox" value="1"  <cfif featured eq 1> checked="checked" </cfif> >
          </td>
        </tr>
        <tr>
          <td colspan="2"><input name="page" type="hidden" value="#page#" />
            <input name="id" type="hidden" value="#id#" />
            <input name="Submit" type="submit" value="Submit" />
            <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#news_list.cfm?page=#page#');" /></td>
        </tr>
      </table>
    </form>
  </cfoutput>
  <cfelse>
  <cflocation url="news_list.cfm" addtoken="no">
</cfif>
<cfinclude template="#application.incPath#footer.cfm">
