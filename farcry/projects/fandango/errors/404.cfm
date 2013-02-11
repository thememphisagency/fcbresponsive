<cfsetting enablecfoutputonly="yes">
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset stObj = structNew() />
<cfset stobj.title = "Page not found" />
<cfset stobj.label = "Page not found" />
<cfset stobj.objectid = application.fc.utils.createJavaUUID() />
<cfset request.navid = application.navid.home />
<cfset stObj.typename = 'dmHTML' />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayHeaderStandard" pageTitle="Page not found" />

<cfset searchLink = '##' />
<cfif StructKeyExists(application.navid, 'search')>
   <cfset searchLink = '#application.url.webroot#/index.cfm?objectid=#application.navid.search#' />
</cfif>

<cfoutput>
	<div class="columns eight">
	<h1>#stObj.title#</h1>
	
		<p>We're sorry, but the link you clicked, or the URL you typed into your browser, didn't work for some reason.</p>
	
		<h3>So now what? </h3>
		<ul>
			<li>If you have a keyword or two, you might <a href="#searchLink#">try a search</a></li>
			<li>If you know where you want to go, perhaps you can look through our sitemap to find what you're looking for.</li>
		</ul>
		<cfinclude template="/farcry/projects/#application.applicationname#/includedObj/_siteMap.cfm" />
	</div>
</cfoutput>


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayFooterStandard" />

<cfsetting enablecfoutputonly="no">