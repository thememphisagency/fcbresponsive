<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: The Memphis Agency 2013, http://www.thememphisagency.com --->
<!--- @@Author: Kate York --->
<!--- Genernates content for the ajax call from search --->

<cfset oJson = CreateObject("component", "farcry.plugins.fcbLib.packages.custom.json") />
<cfimport taglib="/farcry/plugins/fcblib/tags/ajaxPagination" prefix="ajaxPag" />

<cfparam name="url.criteria" type="string" default="" />
<cfparam name="url.perPage" type="string" default="" />
<cfparam name="url.currentPage" type="string" default="" />

<cfsavecontent variable="sHTML">
	<ajaxPag:searchResults criteria="#url.criteria#" perPage="#url.perPage#" currentPage="#url.currentPage#" />
</cfsavecontent>

<cfset stReturn.sHTML = trim(replace(sHTML,"'","&##39;","all")) />
<cfset stReturn.hash = 'criteria=#url.criteria#&currentPage=#url.currentPage#&perPage=#url.perPage#' />

<!--- OUTPUT THE RESULT --->
<cfset sReturn = oJson.encode(data=stReturn) />
<cfoutput>#sReturn#</cfoutput>

<cfsetting enablecfoutputonly="false" />