<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License: --->
<!--- @@displayname: Standard (Footer Links)--->
<!--- @@author: --->

<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfset sLocationAddress = '#stObj.locationStreet1# #stObj.locationStreet2#<br />#stObj.locationSuburb# #stObj.locationState# #stObj.locationPostcode#' />
	
	<cfoutput>
	<ul class="contact">
		<cfif len(stObj.phone)>
			 <li><i class="icon-phone"></i><span>#stObj.phone#</span></li>         
		</cfif>
		<cfif len(stObj.fax)>
			 <li><i class="icon-print"></i><span>#stObj.fax#</span></li>
		</cfif>
		<cfif len(stObj.email) AND isValid('email', stObj.email)>
			 <li><i class="icon-mail"></i><span><a href="mailto:#stObj.email#">#stObj.email#</a></span></li>
		</cfif>
		<cfif len(sLocationAddress)>
			<li><i class="icon-location"></i><span>#sLocationAddress#</span></li>  
		</cfif>
	</ul>
	</cfoutput>

<cfsetting enablecfoutputonly="false" />