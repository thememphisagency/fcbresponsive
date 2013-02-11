<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

	<!--- IMPORT TAG LIBRARIES --->
	<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
	
	
	<cfset this.name = "FCBResponsive" />
	<cfset this.description = "Responsive Skeleton Based on Farcry 6.2.6" />
	<cfset this.lRequiredPlugins = "farcrycms,fcblib" />
	<!--- <cfset addSupportedCore(majorVersion="5", minorVersion="0", patchVersion="0") /> --->
		
	
	<cffunction name="install" output="true">
		
		<cfset var result = "DONE" />
		
		<cfset result = createContent(argumentCollection=arguments) />
				
		
		<cfreturn result />
	</cffunction>
	
		
	

</cfcomponent>

