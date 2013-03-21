<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<!--- @@displayname: ruleNews execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<cfparam name="request.mode.lValidStatus" default="approved">

<skin:view objectID="#stobj.objectid#" typename="#stobj.typename#" webskin="#stobj.executeDisplay#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" stParam="#stParam#" />

<cfsetting enablecfoutputonly="false" />