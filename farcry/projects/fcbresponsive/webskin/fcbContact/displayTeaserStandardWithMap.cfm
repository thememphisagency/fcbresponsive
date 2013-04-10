<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License: --->
<!--- @@displayname: Contact with Map --->
<!--- @@author: --->

<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

	<cfif NOT structKeyExists(request, 'googlemap') AND stobj.bShowMap>
		<cfset googleAPIKey = request.fcbObjectBucket.create(type="fcbGoogleMapAPIKeys").getAPIKey(CGI.HTTP_HOST)>
		<cfoutput>
			<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=#googleAPIKey#" type="text/javascript"></script>
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=#googleAPIKey#&amp;sensor=true"></script>
		</cfoutput>

		<cfset request.googlemap = 1 />
	</cfif>

	<cfset sAddress = '' />
	<cfif len(stObj.locationStreet1) GT 0 OR len(stObj.locationStreet2) GT 0>
		<cfset sAddress = trim(stObj.locationStreet1 & ' ' & stObj.locationStreet2 & ' ' & stObj.locationSuburb & ' ' & stObj.locationState & ' ' & stObj.locationPostcode) />
	</cfif>

	<cfset sPostalAddress = '' />
	<cfif len(stObj.postalStreet1) GT 0 OR len(stObj.postalStreet2) GT 0>
		<cfset sPostalAddress = trim(stObj.postalStreet1 & ' ' & stObj.postalStreet2 & ' ' & stObj.postalSuburb & ' ' & stObj.postalState & ' ' & stObj.postalPostcode) />
	</cfif>
	
	<cfset sObjectid = trim(replaceNoCase(stObj.objectid, '-', '', 'all')) />

	<cfoutput>
	<div class="contacts">
		<h3 id="p#sObjectid#">#stObj.label#</h3>
		<cfif len(trim(stObj.subLabel)) GT 0>
			<p class="subLabel"><strong>#stObj.subLabel#</strong></p>
		</cfif>
		<cfif len(sPostalAddress) GT 1>
			<p><strong>Mail:</strong> #sPostalAddress#</p>
		</cfif>		
		<cfif len(sAddress) GT 1>
			<p><strong>Add:</strong> #sAddress#</p>
		</cfif>
		<p class="contact">
			<cfif len(trim(stObj.phone)) GT 0>
				<span>T</span>#stObj.phone# <br />
			</cfif>
			<cfif len(trim(stObj.fax)) GT 0>
				<span>F</span>#stObj.fax# <br />
			</cfif>
			<cfif len(trim(stObj.email)) GT 0>
				<span>E</span><a href="mailto:#stObj.email#">#stObj.email#</a>
			</cfif>
		</p>
		
		<cfif len(sAddress) GT 0 AND stObj.bShowMap>
			
			<cfset sCallbackFunction = 's#sObjectid#_callback' />
			<cfsavecontent variable="sMapDiv"><div id="s#sObjectid#_map" class="googlemap"><\/div></cfsavecontent>
			
			<script type="text/javascript">
				
				jQuery(document).ready(function (){
					
					jQuery('##p#sObjectid#').after('#trim(sMapDiv)#');


					function initialize() {
				        var mapOptions = {
				          center: new google.maps.LatLng(-34.397, 150.644),
				          zoom: 8,
				          mapTypeId: google.maps.MapTypeId.ROADMAP
				        };
				        var map = new google.maps.Map(document.getElementById("map-canvas"),
				            mapOptions);
				    }
			      	google.maps.event.addDomListener(window, 'load', initialize);
					
					/*
 					if (GBrowserIsCompatible()) {
						geocoder.getLatLng("#sAddress#", 
						function (point) {
		 			    	var map = new GMap2(document.getElementById('s#sObjectid#_map'));					    	
							if (!point) {
								jQuery('##s#sObjectid#_map').hide();
							} 
							else {
								map.setCenter(point, 16);
								var marker = new GMarker(point);
								map.addOverlay(marker);
								map.addControl(new GSmallMapControl());		
							}
			    		});
					} */				
				});
			</script>
		
		</cfif>
				
	</div>
	
	</cfoutput>

<cfsetting enablecfoutputonly="false" />