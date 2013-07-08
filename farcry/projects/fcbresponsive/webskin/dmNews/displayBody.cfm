<cfsetting enablecfoutputonly="true">
<!--- @@displayname: News body --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfoutput>
<div class="columns #stParam.columns#" bodyContent>
	<h1>#stObj.title#</h1>
	<p class="byline">#dateformat(stObj.publishDate, "d mmmm yyyy")#</p>
</cfoutput>

<con:container label="#stObj.objectID#_Body_Top" lRules="#application.config.fcbWebsite.lFarcryRules#" />

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" lRules="#application.config.fcbWebsite.lFarcryRules#" />

<cfoutput></div><!-- End .columns --></cfoutput>

<cfsetting enablecfoutputonly="false">
