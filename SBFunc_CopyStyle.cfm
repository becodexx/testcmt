<cfif form.action_type eq 's'><cfset bLive = 0><cfelse><cfset bLive = 1></cfif>
<cfset bOrgValue = session.bsblive>
<!--- Only copy to live --->
<cfset bLive = 1>
<cflock timeout=20 scope="Session" type="Exclusive"><cfset session.bsblive = bLive></cflock>

<cfset DataPath="#application.app_path#addins/cf_blog/">
<cfset inifile="#DataPath#_settings">
<cftry>
<cffile action="Read" file="#inifile#" variable="temp">
<cfwddx action="WDDX2CFML" input="#temp#" output="iniBlog">
<cfcatch type="any">
</cfcatch>
</cftry>

<cfif not IsDefined ('iniBlog.colours')>
	<cfset iniBlog.colours = StructNew ()>
</cfif>
<cfif not IsDefined ('iniBlog.colours_sb')>
	<cfset iniBlog.colours_sb = StructNew ()>
</cfif>
<cfif not IsDefined ('iniBlog.style_type')>
	<cfset iniBlog.style_type = StructNew ()>
</cfif>
<cfif not IsDefined ('iniBlog.style_type_sb')>
	<cfset iniBlog.style_type_sb = StructNew ()>
</cfif>
<cfif not IsDefined ('iniBlog.style_label')>
	<cfset iniBlog.style_label = StructNew ()>
</cfif>

<cfif !bLive>
	<cfset iniBlog.colours_sb = duplicate (iniBlog.colours)>
	<cfset iniBlog.style_type_sb = duplicate (iniBlog.style_type)>
<cfelse>
	<cfset iniBlog.colours = duplicate (iniBlog.colours_sb)>
	<cfset iniBlog.style_type = duplicate (iniBlog.style_type_sb)>
</cfif>
<cflock scope="SERVER" timeout="10" type="EXCLUSIVE">
<cfwddx action="CFML2WDDX" input="#iniBlog#" output="temp">
<cffile action="Write" file="#inifile#" output="#temp#">

<cfsavecontent variable="strBlogStyle">
	<cfinclude template="../cf_thread/css/dyn_blog_temp.cfm">
</cfsavecontent>
<cflock timeout=20 scope="Session" type="Exclusive"><cfset session.bsblive = bOrgValue></cflock>
<cfif bLive>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog.css" output="#strBlogStyle#">
<cfelse>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog_sb.css" output="#strBlogStyle#">
</cfif>
</cflock>
