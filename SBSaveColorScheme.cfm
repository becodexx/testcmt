<cfset DataPath="#application.app_path#addins/cf_blog/">
<cfset inifile="#DataPath#_settings">
<cffile action="Read" file="#inifile#" variable="temp">
<cfwddx action="WDDX2CFML" input="#temp#" output="ini">

<cfif session.bsblive>
	<cfset structColours = ini.colours>
	<cfif not IsDefined ('ini.style_type')>
		<cfset ini.style_type = StructNew ()>
	</cfif>
	<cfset structStyleType = ini.style_type>
<cfelse>
	<cfset structColours = ini.colours_sb>
	<cfif not IsDefined ('ini.style_type_sb')>
		<cfset ini.style_type_sb = StructNew ()>
	</cfif>
	<cfset structStyleType = ini.style_type_sb>
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
			
			<style>
				<cfset strValue = structColours[#key#]>
				<setting_name>#key#</setting_name>
				<setting_value><cfif len(trim(strValue))>#strValue#<cfelse> </cfif></setting_value>
				<style_type>#iType#</style_type>
			</style>
		</cfif>
	</cfloop>
</cfoutput>
