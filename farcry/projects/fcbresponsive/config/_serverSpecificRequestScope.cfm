<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry.

    FarCry is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry.  If not, see <http://www.gnu.org/licenses/>.
--->
<!--- 
|| DESCRIPTION || 
$Description: 	
	This file is run after /core/tags/farcry/_requestScope.cfm
	It enables us to both override the default farcry request scope variables and also add our own
	
	// Developer Mode
	Turning on developer mode will reinitialise the application every page request.  Useful
	if you are constantly changing application metadata, but disastrous on performance.
$

|| DEVELOPER ||
$Developer: Mat Bryant (m.bryant@daemon.com.au)$
--->
	
<cfimport taglib="/farcry/core/tags/farcry" prefix="farcry" />


<!--------------------------------- 
PUT PRODUCTION OR DEFAULT CODE HERE
 --------------------------------->
<!--- Initialise Object Bucket --->
<cfset fcbObjectBucket = createObject("component","farcry.plugins.fcblib.packages.fcb.fcbObjectBucket") />
<cfset fcbObjectBucket.init() />


<!--------------------------------------------------- 
PUT DEVELOPER OR STAGING/TESTING SPECIFIC CODE BELOW
 --------------------------------------------------->

<!--- Only the developers comp are set as staging site --->
<farcry:machineSpecific name="pollock,bodoni,alessi,davinci,kandinsky,vangogh,mccurry,warhol">
	<cfset request.fcbStaging = true />
</farcry:machineSpecific>

	
<cfsetting enablecfoutputonly="no">