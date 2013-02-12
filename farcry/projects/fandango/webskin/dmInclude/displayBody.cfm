<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Body --->
<!--- @@author: Kate York --->

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

<cfif structKeyExists(stobj, "webskinTypename") AND structKeyExists(stobj, "webskin") AND len(stobj.webskinTypename) AND len(stobj.webskin)>	
	<skin:view typename="#stobj.webskinTypename#" webskin="#stobj.webskin#" stInclude="#stobj#" />
<cfelseif len(stobj.include)>
	<!--- USE skin:include tag to include the file. --->
	<skin:include template="#stObj.include#" />
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" />

<cfoutput></div><!-- End .columns --></cfoutput>



<cfsetting enablecfoutputonly="false">