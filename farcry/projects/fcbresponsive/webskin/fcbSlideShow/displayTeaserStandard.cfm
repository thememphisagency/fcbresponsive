<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: The Memphis Agency--->
<!--- @@License: --->
<!--- @@displayname: Slideshow (Please only place on home page) --->

<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

<cfset oImage = CreateObject("component",application.stcoapi['dmImage'].packagepath)>
<cfset aImageData = ArrayNew(1) />

<cfif arrayLen(stObj.aObjectIDs)>
	<cfloop array="#stObj.aObjectIDs#" index="i">

		<cfset stImage = oImage.getData(objectid=i) />
		<cfsavecontent variable="dataLayer">
			<cfoutput>
			<div class="bannerImageHome">
				<div class="bannerImageContent">
					<div class="bannerImageInner">							
						<div class="bannerHeading"></div>
						<div class="bannerSubHeading"></div>				
						<div class="bannerReadMore">						
						</div>
					</div>
				</div>
			</div>
			</cfoutput> 
		</cfsavecontent>

		<cfset stData = StructNew() />
		<cfset stData['layer'] = dataLayer/>
		<cfset stData['image'] = "#application.url.imageroot##stImage.SourceImage#" />
		<cfset ArrayAppend(aImageData, stData) />			
	</cfloop>

	<!--- Build Image slideshow settings --->
	<cfoutput>			

		<div class="bannerRotator">
			<script>
			window.onload = function() {

		    	var imageData = #SerializeJSON(aImageData)#;	
		    	var r = (jQuery.browser.msie)? "?r=" + Math.random(10000) : "";			    	
			 	Galleria.loadTheme('#application.url.webroot#/js/lib/galleria/themes/dots/galleria.dots.js', r);
			    Galleria.run('.banner',
			    {
			    	responsive:true,
			    	lightbox: false,
			    	showInfo: false,
			    	showCounter: false,
			    	dataSource: imageData
			    });
			    Galleria.configure({
			    	imageCrop: true,
			    	transition: 'fade',
			    	dummy: '#application.url.webroot#/wsimages/defaultBanner.jpg'
				}); 
			}
			</script>
			<div class="banner"></div>
		</div>

	</cfoutput>
</cfif>
<cfsetting enablecfoutputonly="false" />