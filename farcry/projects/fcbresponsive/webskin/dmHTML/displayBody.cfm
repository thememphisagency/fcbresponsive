<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Body --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfoutput>
<div class="columns #stParam.columns# bodyContent">
	<h1>#stObj.title#</h1>
</cfoutput>

<con:container label="#stObj.objectID#_Body_Top" />

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" />

<cfoutput></div><!-- End .columns --></cfoutput>

<cfsetting enablecfoutputonly="false">