<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Simple Search Result teaser --->
<!--- @@author: Justin Carter (justin@daemon.com.au) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="stParam.q" default="">


<!--- get title --->
<cfif structKeyExists(stObj, "title") AND len(stObj.title)>
	<cfset stLocal.title = stObj.title>
<cfelse>
	<cfset stLocal.title = stObj.label>
</cfif>

<!--- get teaser --->
<cfif structKeyExists(stObj, "teaser") AND len(stObj.teaser)>
	<cfset stLocal.cleanTeaser = stObj.teaser>
<cfelse>
	<cfset stLocal.cleanTeaser = stObj.body>
</cfif>
<cfset stLocal.teaser = left(reReplaceNoCase(stLocal.cleanTeaser, "<[^>]*>", "", "all"), 250)>
<cfif len(stLocal.teaser) eq 250>
	<cfset stLocal.teaser &= "...">
</cfif>

<!--- highlight search terms --->
<cfif len(stParam.q)>
	<cfset stLocal.teaser = reReplaceNoCase(stLocal.teaser, "(#url.q#)", "<strong>\1</strong>", "all")>
</cfif>


<cfoutput>
	<div class="search-result">
		<p class="title"><skin:buildLink typename="#stObj.typename#" objectid="#stObj.objectid#">#stLocal.title#</skin:buildLink></p>
		<p>#stLocal.teaser# <skin:buildLink typename="#stObj.typename#" objectid="#stObj.objectid#">Read More</skin:buildLink></p>
	</div>
</cfoutput>


<cfsetting enablecfoutputonly="false">