<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Home Page News Teasers--->
<!--- @@author: Kate York --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
	<article class="four columns medium-three teaser">
            <h2>#stObj.Title#</h2>
	</cfoutput>

		<cfif len(stobj.teaserImage)>
			<skin:view objectid="#stobj.teaserImage#" typename="dmImage" class="wrap-left" template="displayThumbnailImage" />
		</cfif>
		
	<cfoutput>
			<p>#stObj.Teaser#</p>
			<skin:buildLink objectid="#stobj.objectID#">Read more</skin:buildLink>
	</article><!-- END .teaser -->
</cfoutput>
