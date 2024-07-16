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

<cfloop collection="#form#" item="keyAll">
	<cfif FindNoCase ('blog_', keyAll)>
		<cfset key = right(keyAll, len(keyAll)-5)>
		<cfif FindNoCase ('_label', key)>
			<cfset key1 = left(key, len(key)-6)&'_VAL'>
			<cfset iniBlog.style_label[#key1#] = form[#keyAll#]>
		<cfelseif session.bsblive>
			<cfif not FindNoCase ('_val', key)>
				<cfset iniBlog.colours[#key#] = form[#keyAll#]>
			<!--- <cfelse>
				<cfset iniBlog.style_type[#key#] = form[#keyAll#]> --->
			</cfif>
		<cfelse>
			<cfif not FindNoCase ('_val', key)>
				<cfset iniBlog.colours_sb[#key#] = form[#keyAll#]>
			<!--- <cfelse>
				<cfset iniBlog.style_type_sb[#key#] = form[#keyAll#]> --->
			</cfif>
		</cfif>
	</cfif>
</cfloop>	
<cflock scope="SERVER" timeout="10" type="EXCLUSIVE">
<cfwddx action="CFML2WDDX" input="#iniBlog#" output="temp">
<cffile action="Write" file="#inifile#" output="#temp#">
<!--- <cffile action="Write" file="#inifile#.xml" output="#temp#"> --->

<cfsavecontent variable="strBlogStyle">
	<cfinclude template="../cf_thread/css/dyn_blog_temp.cfm">
</cfsavecontent>
<cfif session.bsblive>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog.css" output="#strBlogStyle#">
<cfelse>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog_sb.css" output="#strBlogStyle#">
</cfif>
</cflock>
