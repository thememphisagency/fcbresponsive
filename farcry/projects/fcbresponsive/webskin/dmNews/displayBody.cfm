<cfsetting enablecfoutputonly="true"> 
<!--- @@displayname: News body --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
	<p class="byline">#dateformat(stObj.publishDate, "d mmmm yyyy")#</p>
	#stObj.body#
</cfoutput>

<cfsetting enablecfoutputonly="false">