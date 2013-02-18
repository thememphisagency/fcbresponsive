<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
<div class="teaser">
	<h3>#stObj.Title#</h3>
	</cfoutput>

		<cfif len(stobj.teaserImage)>
			
			<cfoutput><div class="thumbnail"></cfoutput>
			
			<skin:buildLink objectID="#stobj.objectid#">
				<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" />
			</skin:buildLink>
			
			<cfoutput></div></cfoutput>
			
		</cfif>
		
	<cfoutput>
		<div class="teaserBody <cfif NOT len(stobj.teaserImage)>teaserBodyNoImg</cfif>"><p>#stObj.Teaser#</p></div>
	<skin:buildLink objectid="#stobj.objectID#" class="morelink"><span data-icon="&##8862;"></span></skin:buildLink>
</div><!-- END .teaser -->
</cfoutput>

<cfsetting enablecfoutputonly="false" />