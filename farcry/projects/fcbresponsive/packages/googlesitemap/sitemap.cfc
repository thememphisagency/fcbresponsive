<cfcomponent name="SiteMap" extends="farcry.core.packages.googleSiteMap.sitemap" displayname="Site" hint="I am site map and i create site maps for a site">
	
	<cffunction name="generate">
		<cfargument name="stSiteConfig" required="true" default="">
		<cfargument name="siteMapType" required="false" default="siteMap" hint="sitemap or newsSiteMap">
		<cfargument name="types" required="false" default="siteMap" hint="sitemap or newsSiteMap">
		<cfargument name="newstypes" required="false" default="dmNews:publishDate" hint="list of news types in with name of field for publish date">
		<cfargument name="bIncludeNavigation" required="false" default="false">
		
		<!--- first add into sitemap index --->					
		<cfset var oSite=createObject('component', 'farcry.core.packages.googlesitemap.sitemap.Site').init()>
		<cfset var oSiteMapData=createObject('component', 'farcry.core.packages.googlesitemap.sitemap.SiteMapData').init()>
		<!--- now generate xmlData for the site --->
		<cfset var DataGenerator = request.fcbObjectBucket.create(fullPath="#application.customPackagePath#.googleSiteMap.sitemap.SiteDataGenerator").init()>
		
		
		<cfswitch expression="#arguments.siteMapType#">
			<cfcase value="siteMap">
				<!--- set a navigation sitemap --->
				<cfset DataGenerator.setSiteConfig(arguments.stSiteConfig)>
				<cfif arguments.bIncludeNavigation>
					<cfset DataGenerator.setbGenerateNav(true)>
				</cfif>
				<cfif len(arguments.types)>
					<cfset DataGenerator.setTypes(arguments.types)>
				</cfif>
				<cfset xmlData=DataGenerator.generateSiteData()>
				
			</cfcase>
			<cfcase value="newsSiteMap">
				<cfset DataGenerator.setSiteConfig(arguments.stSiteConfig)>
				<cfset DataGenerator.setbGenerateNews(true)>
				<cfset DataGenerator.setNewsTypes(arguments.newstypes)>
				<cfset xmlData=DataGenerator.generateSiteData()>	
			</cfcase>
			<!--- TODO: set up for video --->
		</cfswitch>
		
		<cfset oSiteMapData.setXMLString(xmlData)>
		<cfset oSite.setSiteMapData(oSiteMapData)>
		<cfset oSite.createSiteMap()>
		
		<cfreturn toString(oSite.getSiteMap())>
	</cffunction>
	
</cfcomponent>