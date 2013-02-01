<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Mobile Body --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>

<div id="main-title">
	<h1>#stObj.label#</h1>
</div>

<div id="main">
	<div class="content">
		<cfif structKeyExists(stObj, "body")>
			#stObj.body#
		</cfif>
	</div>
</div>

</cfoutput>

<cfsetting enablecfoutputonly="false">