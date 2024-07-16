<cfset copyBlogFiles()>

<cffunction name="copyBlogFiles" description="copy blog settings file to original path">
	<cfif directoryExists("#expandpath('../custom/AdminFiles/StartingPoints')#/#template_id#/#template_id#/blog")>
		<cffile action="copy" source="#expandpath('../custom/AdminFiles/StartingPoints')#/#template_id#/#template_id#/blog/_settings.xml" destination="#expandpath('../addins/cf_blog/')#">
	</cfif>
</cffunction>