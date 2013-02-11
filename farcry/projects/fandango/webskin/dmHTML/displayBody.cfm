<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Body --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfparam name="stParam.breadcrumb" default="false">

<cfoutput>
<div class="columns #stParam.columns#">
	<h1>#stObj.title#</h1>
</cfoutput>

<cfif stParam.breadcrumb>
	<skin:breadcrumb separator=" / " includeSelf="true">
</cfif>

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" />

<cfoutput></div><!-- End .columns --></cfoutput>

<cfsetting enablecfoutputonly="false">