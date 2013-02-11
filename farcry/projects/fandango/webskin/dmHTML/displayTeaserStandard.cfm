<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
<div class="teaser">
	<h3>#stObj.Title#</h3>
	<p>
	</cfoutput>

		<cfif len(stobj.teaserImage)>
			
			<cfoutput><span class="thumbnail"></cfoutput>
			
			<skin:buildLink objectID="#stobj.objectid#">
				<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" />
			</skin:buildLink>
			
			<cfoutput></span></cfoutput>
			
		</cfif>
		
	<cfoutput>
		#stObj.Teaser#
		<skin:buildLink objectid="#stobj.objectID#" class="morelink">Learn More</skin:buildLink>
	</p>
	<span data-icon="&##8862;"></span>
</div><!-- END .teaser -->
</cfoutput>

<cfsetting enablecfoutputonly="false" />