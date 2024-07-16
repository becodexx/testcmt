<cfoutput>
	<cfset DataPath="#application.app_path#addins/cf_blog/">
</cfoutput>
<script type="text/javascript" src="../addins/cf_blog/js/colorpickerfuncs.js"></script>

<cfset iniBlogfile="#DataPath#_settings">
<cftry>
<cffile action="Read" file="#iniBlogfile#" variable="temp">
<cfwddx action="WDDX2CFML" input="#temp#" output="iniBlog">
<cfcatch type="any">
</cfcatch>
</cftry>
 
<cfif not IsDefined ('iniBlog.colours')>
	<cfset iniBlog.colours = StructNew ()>
</cfif>

<cfif session.bsblive>
	<cfset structColours = iniBlog.colours>
	<cfif not IsDefined ('iniBlog.style_type')>
		<cfset iniBlog.style_type = StructNew ()>
	</cfif>
	<cfset structStyleType = iniBlog.style_type>
<cfelse>
	<cfset structColours = iniBlog.colours_sb>
	<cfif not IsDefined ('iniBlog.style_type_sb')>
		<cfset iniBlog.style_type_sb = StructNew ()>
	</cfif>
	<cfset structStyleType = iniBlog.style_type_sb>
</cfif>
<cfoutput>
<cfset BlogPath = ExpandPath("../addins/cf_blog")>
<cfset strMenuLabel = Application.obj.SiteSettingFuncs.getMenuLabel ('cf_thread', 'Blog')>
<cfset TabLabel = "Blog Settings">
<cfif trim(len(strMenuLabel))>
	<cfset TabLabel = strMenuLabel & ' Settings'>
<cfelse>
	<cfinvoke component="site_builder_funcs" method="getAppLabelInfo" returnvariable="labelInfo">
		<cfinvokeargument name="dirFullName" value="#BlogPath#">
		<cfinvokeargument name="dirName" value="cf_blog">
		<cfinvokeargument name="fileName" value="name_lbl.xml">
	</cfinvoke>		
	<cfset TabLabel = labelInfo.txtLabel>
</cfif>

<br /><cfoutput><h2>#TabLabel# <font size="-1">(Advanced)</font></h2><br /></cfoutput>
<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td colspan="2" class="DataNoBgnd" align="left"><b>Post</b></td>
</tr>

<cfparam name="structColours.post_bgcolor" default="">
<cfparam name="structStyleType.post_bgcolor_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Background</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.post_bgcolor))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="post_bgcolor_col" class="#disp#" style="background-color:#structColours.post_bgcolor#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_post_bgcolor" id="post_bgcolor" value="#structColours.post_bgcolor#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_post_bgcolor_label" id="post_bgcolor" value="blog post background color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="post_bgcolor_val" name="blog_post_bgcolor_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.post_bgcolor_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.post_text" default="">
<cfparam name="structStyleType.post_text_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Text</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.post_text))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="post_text_col" class="#disp#" style="background-color:#structColours.post_text#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_post_text" id="post_text" value="#structColours.post_text#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_post_text_label" id="post_text" value="blog post font color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="post_text_val" name="blog_post_text_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.post_text_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.post_border" default="">
<cfparam name="structStyleType.post_border_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Border</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.post_border))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="post_border_col" class="#disp#" style="background-color:#structColours.post_border#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_post_border" id="post_border" value="#structColours.post_border#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_post_border_label" id="post_border" value="blog post border color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="post_border_val" name="blog_post_border_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.post_border_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<tr>
	<td colspan="2" class="DataNoBgnd" align="left"><b>Comment</b></td>
</tr>

<cfparam name="structColours.comment_bgcolor" default="">
<cfparam name="structStyleType.comment_bgcolor_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Background</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.comment_bgcolor))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="comment_bgcolor_col" class="#disp#" style="background-color:#structColours.comment_bgcolor#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_comment_bgcolor" id="comment_bgcolor" value="#structColours.comment_bgcolor#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_comment_bgcolor_label" id="comment_bgcolor" value="blog comment background color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="comment_bgcolor_val" name="blog_comment_bgcolor_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.comment_bgcolor_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.comment_text" default="">
<cfparam name="structStyleType.comment_text_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Text</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.comment_text))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="comment_text_col" class="#disp#" style="background-color:#structColours.comment_text#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_comment_text" id="comment_text" value="#structColours.comment_text#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_comment_text_label" id="comment_text" value="blog comment font color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="comment_text_val" name="blog_comment_text_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.comment_text_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.comment_border" default="">
<cfparam name="structStyleType.comment_border_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Border</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.comment_border))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="comment_border_col" class="#disp#" style="background-color:#structColours.comment_border#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_comment_border" id="comment_border" value="#structColours.comment_border#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_comment_border_label" id="comment_border" value="blog comment border color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="comment_border_val" name="blog_comment_border_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.comment_border_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<tr>
	<td colspan="2" class="DataNoBgnd" align="left"><b>Date</b></td>
</tr>

<cfparam name="structColours.date_border" default="">
<cfparam name="structStyleType.date_border_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Border</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.date_border))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="date_border_col" class="#disp#" style="background-color:#structColours.date_border#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_date_border" id="date_border" value="#structColours.date_border#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_date_border_label" id="date_border" value="blog date border color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="date_border_val" name="blog_date_border_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.date_border_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.month_bgcolor" default="">
<cfparam name="structStyleType.month_bgcolor_val" default="0">
<tr><td colspan="2" class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Month</td></tr>
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Background</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.month_bgcolor))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="month_bgcolor_col" class="#disp#" style="background-color:#structColours.month_bgcolor#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_month_bgcolor" id="month_bgcolor" value="#structColours.month_bgcolor#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_month_bgcolor_label" id="month_bgcolor" value="blog month background color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="month_bgcolor_val" name="blog_month_bgcolor_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.month_bgcolor_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.month_text" default="">
<cfparam name="structStyleType.month_text_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Text</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.month_text))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="month_text_col" class="#disp#" style="background-color:#structColours.month_text#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_month_text" id="month_text" value="#structColours.month_text#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_month_text_label" id="month_text" value="blog month font color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="month_text_val" name="blog_month_text_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.month_text_val#">
			</cfinvoke>
		</select>
	</td>
</tr>
<tr>
	<td colspan="2" class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Day</td>
</tr>

<cfparam name="structColours.day_bgcolor" default="">
<cfparam name="structStyleType.day_bgcolor_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Background</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.day_bgcolor))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="day_bgcolor_col" class="#disp#" style="background-color:#structColours.day_bgcolor#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_day_bgcolor" id="day_bgcolor" value="#structColours.day_bgcolor#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_day_bgcolor_label" id="day_bgcolor" value="blog day background color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="day_bgcolor_val" name="blog_day_bgcolor_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.day_bgcolor_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.day_text" default="">
<cfparam name="structStyleType.day_text_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Text</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.day_text))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="day_text_col" class="#disp#" style="background-color:#structColours.day_text#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_day_text" id="day_text" value="#structColours.day_text#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_day_text_label" id="day_text" value="blog day font color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="day_text_val" name="blog_day_text_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.day_text_val#">
			</cfinvoke>
		</select>
	</td>
</tr>
<tr>
	<td colspan="2" class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;Year</td>
</tr>

<cfparam name="structColours.year_bgcolor" default="">
<cfparam name="structStyleType.year_bgcolor_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Background</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.year_bgcolor))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="year_bgcolor_col" class="#disp#" style="background-color:#structColours.year_bgcolor#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_year_bgcolor" id="year_bgcolor" value="#structColours.year_bgcolor#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_year_bgcolor_label" id="year_bgcolor" value="blog year background color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="year_bgcolor_val" name="blog_year_bgcolor_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.year_bgcolor_val#">
			</cfinvoke>
		</select>
	</td>
</tr>

<cfparam name="structColours.year_text" default="">
<cfparam name="structStyleType.year_text_val" default="0">
<tr>
    <td class="DataNoBgnd" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Text</td>
    <td class="DataNoBgnd" align="left">
		<cfif len(trim(structColours.year_text))><cfset disp='colorDisp'><cfelse><cfset disp='colorNoDisp'></cfif>
		<span id="year_text_col" class="#disp#" style="background-color:#structColours.year_text#;" >&nbsp;&nbsp;&nbsp;</span>
		<cfinput type="Text" name="blog_year_text" id="year_text" value="#structColours.year_text#" required="no" size="8" maxlength="8">
		<cfinput type="hidden" name="blog_year_text_label" id="year_text" value="blog year font color" >
	</td>
	<td class="DataNoBgnd" align="left">
		<select id="year_text_val" name="blog_year_text_val" class="ColorPalSel" title="#strColTypeInstr#" >
			<cfinvoke component="style_manager" method="ColorType">
				<cfinvokeargument name="ColorVal" value="#structStyleType.year_text_val#">
			</cfinvoke>
		</select>
	</td>
</tr>
</table>
</cfoutput>
