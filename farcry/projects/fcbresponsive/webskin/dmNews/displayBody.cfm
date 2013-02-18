<cfsetting enablecfoutputonly="true"> 
<!--- @@displayname: News body --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfoutput>
<div class="columns #stParam.columns#">
	<h1>#stObj.title#</h1>
	<p class="byline">#dateformat(stObj.publishDate, "d mmmm yyyy")#</p>
</cfoutput>

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" />

<cfoutput></div><!-- End .columns --></cfoutput>

<cfsetting enablecfoutputonly="false">
