<cfsetting enablecfoutputonly="true">

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
<article>
	<cfif len(stobj.teaserImage)>
		<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" r_html="teaserImageHTML" />
		<cfoutput>
			<skin:buildLink class="thumbnail" objectID="#stobj.objectid#" linktext="#teaserImageHTML#" />
		</cfoutput>
	</cfif>
	<div class="teaser">
		<h3><skin:buildLink objectid="#stobj.objectID#">#stObj.title#</skin:buildLink></h3>
		<p class="byline">#dateformat(stObj.publishDate, "d mmmm yyyy")#</p>
		<p>
			#stObj.teaser# <skin:buildLink objectid="#stobj.objectID#" class="morelink">Read More &rarr;</skin:buildLink>
		</p>
	</div>
</article>
</cfoutput>

<cfsetting enablecfoutputonly="false">