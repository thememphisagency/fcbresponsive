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
			 <li><div data-icon="&##128222;"><span>#stObj.phone#</span></div></li>         
		</cfif>
		<cfif len(stObj.fax)>
			 <li><div data-icon="&##59158;"><span>#stObj.fax#</span></div></li>
		</cfif>
		<cfif len(stObj.email) AND isValid('email', stObj.email)>
			 <li><div data-icon="&##9993;"><span><a href="mailto:#stObj.email#">#stObj.email#</a></span></div></li>
		</cfif>
		<cfif len(sLocationAddress)>
			<li><div data-icon="&##59172;"><span>#sLocationAddress#</span></div></li>  
		</cfif>
	</ul>
	</cfoutput>

<cfsetting enablecfoutputonly="false" />