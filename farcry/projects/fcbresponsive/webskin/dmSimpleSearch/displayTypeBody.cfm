<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Simple Search Type Body --->
<!--- @@author: Justin Carter (justin@daemon.com.au) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="url.q" default="">

<!--- do search --->
<cfset stLocal.qResults = queryNew("objectid")>
<cfif len(url.q)>
	<cfset stLocal.qResults = search(url.q)>
</cfif>

<!--- display search message --->
<cfif len(url.q)>
	<cfoutput>
		<p>Your search for "#url.q#" returned #stLocal.qResults.recordCount# results.</p>
	</cfoutput>
<cfelse>
	<cfoutput>
		<p>To perform a search, type some keywords into the search box and press Enter.</p>
	</cfoutput>
</cfif>

<!--- display results --->
<cfloop query="stLocal.qResults">
	<skin:view objectid="#stLocal.qResults.objectid#" typename="#stLocal.qResults.typename#" webskin="displaySimpleSearchResult" q="#url.q#">
</cfloop>


<cfsetting enablecfoutputonly="false">