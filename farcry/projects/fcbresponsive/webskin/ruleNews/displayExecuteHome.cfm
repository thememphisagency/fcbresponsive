<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Latest News listing for Home Page --->
<!--- @@author: Kate York --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- If Archive: Get Maximum Rows in New Table --->
<cfif stObj.bArchive>
	<cfquery datasource="#arguments.dsn#" name="qCount">
		SELECT count(objectID) as total
		FROM #application.dbowner#dmNews
	</cfquery>
	<cfset maximumRows = qCount.total>
<cfelse>
	<cfset maximumRows = stObj.numItems>
</cfif>

<!--- check if filtering by categories --->
<cfif not len(trim(stobj.metadata))><!--- don't filter on categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), orderby="publishdate DESC",maxRows=maximumRows)>
<cfelseif stobj.bMatchAllKeywords><!--- require all categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_eq=stObj.metadata, orderby="publishdate DESC",maxRows=maximumRows)>
<cfelse><!--- any categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_in=stObj.metadata, orderby="publishdate DESC",maxRows=maximumRows)>
</cfif>

	<!--- THIS MEANS PAGINATE --->
	<skin:pagination query="#q#" typename="dmNews" r_stObject="stNews" paginationID="ruleNews" recordsPerPage="#stObj.numItems#" pageLinks="#stObj.numPages#">
		<skin:view objectID="#stNews.objectID#" typename="dmNews" webskin="#stObj.displaymethod#" />
	</skin:pagination>

<cfsetting enablecfoutputonly="false" />