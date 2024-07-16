
<cfset copyBlogFiles()>

<cffunction name="copyBlogFiles" description="copy blog settings file to starting points folder">
	<cfif NOT directoryExists("#expandpath('../custom/AdminFiles/StartingPoints')#/#template_id#/#template_id#/sitecontent/blog")>
		<cfdirectory action="create" directory="#expandpath('../custom/AdminFiles/StartingPoints')#/#template_id#/#template_id#/sitecontent/blog">
	</cfif>
	<cfif fileexists("#expandpath('../addins/cf_blog/_settings.xml')#")>
		<cffile action="copy" destination="#expandpath('../custom/AdminFiles/StartingPoints')#/#template_id#/#template_id#/sitecontent/blog" source="#expandpath('../addins/cf_blog/_settings.xml')#">
	</cfif>
</cffunction>