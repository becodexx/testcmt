<cfset ColPal = xmlSearch(xmlObject,'/layout_theme/color_palette')>
<cfset Palette = xmlparse(ColorPalette[1]) />
<cfset DataPath="#application.app_path#addins/cf_blog/">
<cfset inifile="#DataPath#_settings">
<cffile action="Read" file="#inifile#" variable="temp">
<cfwddx action="WDDX2CFML" input="#temp#" output="iniBlog">

<cfif session.bsblive>
	<cfset structColours = iniBlog.colours>
	<cfset stuctOrgColours = iniBlog.org_colours>
	<cfif not IsDefined ('iniBlog.style_type')>
		<cfset iniBlog.style_type = StructNew ()>
	</cfif>
	<cfset structStyleType = iniBlog.style_type>
<cfelse>
	<cfset structColours = iniBlog.colours_sb>
	<cftry>
	<cfset stuctOrgColours = iniBlog.org_colours_sb>
	<cfcatch type="any">
	<cfset iniBlog.org_colours_sb = StructNew ()>
	<cfset stuctOrgColours = iniBlog.org_colours>
	<cfset iniBlog.org_colours_sb = iniBlog.org_colours>
	</cfcatch>
	</cftry>
	<cfif not IsDefined ('iniBlog.style_type_sb')>
		<cfset iniBlog.style_type_sb = StructNew ()>
	</cfif>
	<cfset structStyleType = iniBlog.style_type_sb>
</cfif>

<cfloop collection="#structStyleType#" item="keyST">
	<cfif keyST neq 'fieldnames'>
		<cfset key =  Left (keyST, len(trim(keyST)) - 4)>
		<cfif StructKeyExists (structStyleType, keyST)>
			<cfset iType = structStyleType[#keyST#]>
			<cfif iType gt 0>
				<cfset strColId = "Color#iType#">
				<cfset valCol = Palette.color_palette[strColId].xmltext>
			</cfif>
		<cfelse>
			<cfset iType = -2>
		</cfif> 
		<cfif iType gt 0>
			<cfset structColours[key] = valCol>
			<cfset stuctOrgColours[key] = valCol>
		</cfif>			
	</cfif>
</cfloop>

<cflock scope="SERVER" timeout="10" type="EXCLUSIVE">
<cfwddx action="CFML2WDDX" input="#iniBlog#" output="temp">
<cffile action="Write" file="#inifile#" output="#temp#">
</cflock>

