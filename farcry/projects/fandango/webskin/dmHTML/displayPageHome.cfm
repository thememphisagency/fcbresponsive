<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Home Page --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/container" prefix="con" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<cfoutput>
<!-- Banner -->
<div class="banner">
    <h3>Hero Banner</h3>
</div>
</cfoutput>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard">

	
<cfsetting enablecfoutputonly="false">