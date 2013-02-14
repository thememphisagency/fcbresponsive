<cfsetting enablecfoutputonly="true">

		<cfset oSiteMap = request.fcbObjectBucket.create(fullPath="#application.customPackagePath#.googlesitemap.SiteMap").init() />
		
		<cfset stSiteConfig = structNew() />
		<cfset stSiteConfig.domainName = cgi.server_name />
		<cfset stSiteConfig.startPoint = application.navid.home />
	
		<cfset xml = oSiteMap.generate(stSiteConfig=stSiteConfig,siteMapType="siteMap", types="dmNavigation") />

		<CFHEADER NAME="content-disposition" VALUE="inline; filename=dmnavigation.#now()#">
		<cfheader name="Content-Type" value="text/xml">
		<cfoutput>#trim(xml)#</cfoutput>

<cfsetting enablecfoutputonly="false">