<cfcomponent name="SiteDataGenerator" extends="farcry.core.packages.googleSiteMap.sitemap.siteDataGenerator" displayname="SiteDataGenerator" hint="I generate site map xml strings">

	<cffunction name="getNavigationData" returntype="query" access="public" hint="a query to get all naviagtion nodes">
		
		<cfset var navFilter=arrayNew(1)>
		<cfset var qNavUnsorted="">
		
		<!--- g.s this code is copied from an existing site map generator please see http://groups.google.com/group/farcry-dev/browse_thread/thread/2d8e81c4f3b65620--->
		<cfset navfilter[1]="status IN ('approved')">
		<cfset qNavUnsorted = application.factory.oTree.getDescendants(objectid=variables.SiteConfig.startPoint, depth=variables.SiteConfig.depth, bIncludeSelf="0", afilter=navFilter, lcolumns="externallink,datetimelastupdated")>
        <!--- VE: sort query through a requery; externallink may not be 
			filled because we would get double URL's in the sitemap this is 
			prohibited by google.---> 
			
			<cfset lNav = valueList(qNavUnsorted.objectId) />
			<cfset lExcludedIds = "" />
			
			<cfloop index="ListElement" list="#lNav#">
				<cfif application.security.checkPermission(object=ListElement,permission="View") EQ 0>
					<cfset lExcludedIds = listAppend(lExcludedIds,ListElement) />
				</cfif>
			</cfloop>
		
        <cfquery name="qNavSorted" dbtype="query"> 
			SELECT DISTINCT objectid,nlevel,nleft,datetimelastupdated,externallink 
            FROM qNavUnsorted 
            WHERE (externallink = '' OR externallink IS NULL)
			AND objectid NOT IN (<cfqueryparam cfsqltype="cf_sql_varchar" list="true" value="#lExcludedIds#" />)
            ORDER BY nLeft,objectName ASC 
        </cfquery>
	
		<cfreturn qNavSorted>
	</cffunction>
	
</cfcomponent>