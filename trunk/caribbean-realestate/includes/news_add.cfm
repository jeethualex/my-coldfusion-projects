<cfif IsDefined("form.Submit")>
  <cfset success = createObject("component", "#application.commonCFC#").InsertNews(form)/>
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
  
  <h1>Add News</h1>
  <cfif isDefined("success") and success>
    <cflocation url="news_list.cfm" addtoken="no">
  </cfif>
  <!--onsubmit="javascript:if(!$('##aForm').valid()) return false;"-->
  <form action="" method="post" id="aForm" >
    <table class="noborder">
      <tr>
        <td>title</td>
        <td><input name="title" type="text" maxlength="50" class="required"/></td>
      </tr>
      <tr>
        <td>summary</td>
        <td><textarea name="summary" cols="40" rows="5"></textarea>
        </td>
      </tr>
      <tr>
        <td>detail news</td>
        <td><textarea name="detail" cols="40" rows="8"></textarea>
        </td>
      </tr>
      <tr>
        <td>posted on</td>
        <td><input name="posted" type="text" class="cal required" readonly="readonly" value="#DateFormat(now(),'mm/dd/yyyy')#" /></td>
      </tr>
      <tr>
        <td>featured</td>
        <td><input name="featured" type="checkbox" value="1" /></td>
      </tr>
      <tr>
        <td colspan="2"><input name="Submit" type="submit" value="Submit" />
          <input name="cancel" type="button" value="Cancel" onclick="javascript:$(location).attr('href','#application.incPath#news_list.cfm');" />
        </td>
      </tr>
    </table>
  </form>
</cfoutput>
<cfinclude template="#application.incPath#footer.cfm">
