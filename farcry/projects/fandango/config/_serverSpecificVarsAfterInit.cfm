<cfsetting enablecfoutputonly="yes">
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

<!--- THIS WILL BE INCLUDED AFTER THE FARCRY INIT HAS BEEN RUN BUT ONLY ON APPLICATION INITIALISATION. --->


<!---------------------------------
 IMPORT TAG LIBRARIES
 --------------------------------->
<cfimport taglib="/farcry/core/tags/farcry" prefix="farcry" />



<!--------------------------------- 
PUT PRODUCTION OR DEFAULT CODE HERE
 --------------------------------->



<!--------------------------------------------------- 
PUT DEVELOPER OR STAGING/TESTING SPECIFIC CODE BELOW
 --------------------------------------------------->

<farcry:machineSpecific name="DEVELOPER_1_MACHINE_NAME_HERE">
	<!--- DEVELOPER SPECIFIC OVERRIDING CODE HERE --->
</farcry:machineSpecific>	


<farcry:machineSpecific name="DEVELOPER_2_MACHINE_NAME_HERE">
	<!--- DEVELOPER SPECIFIC OVERRIDING CODE HERE --->
</farcry:machineSpecific>	


<farcry:machineSpecific name="DEVELOPER_3_MACHINE_NAME_HERE">
	<!--- DEVELOPER SPECIFIC OVERRIDING CODE HERE --->
</farcry:machineSpecific>	


<cfsetting enablecfoutputonly="no">