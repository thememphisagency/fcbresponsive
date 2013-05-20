<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: The Memphis Agency 2013, http://www.thememphisagency.com --->
<!--- @@Author: Kate York --->
<!--- Genernates content for the ajax call from rules --->

<cfset oJson = CreateObject("component", "farcry.plugins.fcbLib.packages.custom.json") />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfparam name="url.objectid" type="string" default="" />
<cfparam name="url.objectTypename" type="string" default="" />

<cfset oType = request.fcbObjectBucket.create(fullPath=url.objectTypename) />
<cfset stObj = oType.getData(objectid=url.objectId) />

<cfsavecontent variable="sHTML">
	<skin:view objectID="#stObj.objectid#" typename="#stobj.typename#" webskin="#stobj.executeDisplay#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" />
</cfsavecontent>

<cfset stReturn.sHTML = trim(replace(sHTML,"'","&##39;","all"))>

<!--- OUTPUT THE RESULT --->
<cfset sReturn = oJson.encode(data=stReturn) />
<cfoutput>#sReturn#</cfoutput>

<cfsetting enablecfoutputonly="false" />