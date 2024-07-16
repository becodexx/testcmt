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
	<cfloop collection="#structColours#" item="key">
		<cfif key neq 'fieldnames'>
			<cfset keyST = '#key#_val'>
			<cfif StructKeyExists (structStyleType, keyST)>
				<cfset iType = structStyleType[#keyST#]>
			<cfelse>
				<cfset iType = 0>
			</cfif> 
			<cfif iType gt 0>
				<cftry>
				<cfset strFormIndex = 'pal_Color#iType#'>
				<cfset strVal = '#form[strFormIndex]#'>
				<cfset structColours[key] = strVal>
				<cfcatch>
				</cfcatch>
				</cftry>
			</cfif>			
		</cfif>
	</cfloop>
</cfoutput>

<cflock scope="SERVER" timeout="10" type="EXCLUSIVE">
<cfwddx action="CFML2WDDX" input="#iniBlog#" output="temp">
<cffile action="Write" file="#inifile#" output="#temp#">
<!--- <cffile action="Write" file="#inifile#.xml" output="#temp#"> --->

<cfsavecontent variable="strBlogStyle">
	<cfinclude template="../cf_thread/css/dyn_blog.cfm">
</cfsavecontent>
<cfif session.bsblive>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog.css" output="#strBlogStyle#">
<cfelse>
	<cffile action="write" file="#application.app_path#addins/cf_blog/dyn_blog_sb.css" output="#strBlogStyle#">
</cfif>
</cflock>
