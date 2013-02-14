<cfsetting enablecfoutputonly="yes" />
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
$Description: Friendly URL interstitial file for processing friendly urls to parameterised urls $

|| DEVELOPER ||
$Developer: Guy Phanvongsa (guy@daemon.com.au) $
--->

<!--- TODO: using local invocation, move to factory scope when done --->
<cfif StructKeyExists(url,"path")>
	<cfset objFU = CreateObject("component","#application.packagepath#.farcry.fu")>
	<cfset returnFU = objFU.fGetFUData(url.path)>
	<cfif returnFU.bSuccess>
		<!--- check if this friendly url is a retired link.: if not then show page --->
		<cfif returnFU.redirectFUURL NEQ "">
			<cfheader statuscode="301" statustext="Moved permanently">
			<cfheader name="Location" value="#returnFU.redirectFUURL#">
			<cfabort>
		<cfelse>
			<cfset url.objectid = returnFU.refobjectid>
			<cfloop index="iQstr" list="#returnFU.query_string#" delimiters="&">
				<cfset url["#listFirst(iQstr,'=')#"] = listLast(iQstr,"=")>
			</cfloop>
	
			<cfinclude template="#application.url.conjurer#">
		</cfif>
	<cfelse>
		<cfinclude template="404.cfm">
	</cfif>
</cfif>

<cfsetting enablecfoutputonly="no" />