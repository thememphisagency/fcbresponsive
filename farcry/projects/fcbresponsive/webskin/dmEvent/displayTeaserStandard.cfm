<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Sandy Trinh --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
<div class="teaser">
	<cfif len(stobj.teaserImage)>
		
		<cfoutput><div class="thumbnail"></cfoutput>
		
		<skin:buildLink objectID="#stobj.objectid#">
			<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" />
		</skin:buildLink>
		
		<cfoutput></div></cfoutput>
		
	</cfif>
	<div class="teaserBody <cfif NOT len(stobj.teaserImage)>teaserBodyNoImg</cfif>">
	<h3>#stObj.Title#</h3>
	<div class="newsDate">#dateformat(stObj.startDate, "dd mmm yyy")# 
		<cfif showFarcryDate(stobj.endDate)>
			until #dateformat(stObj.endDate, "dd mmm yyy")#
		</cfif>
	</div>
	</cfoutput>

	
		
	<cfoutput>
		<p>#stObj.Teaser#</p>
			<skin:buildLink objectid="#stobj.objectID#" class="morelink">Read more</skin:buildLink>
		</div>		
	
</div><!-- END .teaser -->
</cfoutput>
