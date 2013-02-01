<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Body --->
<!--- @@author: Justin Carter (justin@daemon.com.au) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfparam name="stParam.breadcrumb" default="false">


<cfif stParam.breadcrumb>
	<skin:breadcrumb separator=" / " includeSelf="true">
</cfif>

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<con:container label="#stObj.objectID#_Body_Bottom" />


<cfsetting enablecfoutputonly="false">