<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfset sAnchor = 'href="#stObj.link#"'>
<cfif stObj.displayMethod EQ 'displayPageEmail'>
	<cfset sAnchor = 'href="mailto:#stObj.link#"'>
<cfelseif stObj.displayMethod EQ 'displayPageNewWindow'>	
	<cfset sAnchor = 'href="#stObj.link#" target="_blank"'>
</cfif>

<cfoutput>
<div class="teaser">
	<h3>#stObj.Title#</h3>
	</cfoutput>

		<cfif len(stobj.teaserImage)>
			<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" r_html="sTeaserImage" />
			<cfoutput><div class="thumbnail"><a #sAnchor#>#trim(sTeaserImage)#</a></div></cfoutput>			
		</cfif>
		
<cfoutput>
		<div class="teaserBody <cfif NOT len(stobj.teaserImage)>teaserBodyNoImg</cfif>"><p>#stObj.Teaser#</p></div>
		<a #sAnchor# class="morelink"><i class="icon-plus-squared"></i></a>
</div><!-- END .teaser -->
</cfoutput>

<cfsetting enablecfoutputonly="false" />