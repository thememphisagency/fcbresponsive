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

<!--- 
|| DESCRIPTION || 
$Description: 
News rule publishes news content items in date order, with 
most recently published first.  News content is only visible 
if it is a) approved content; b) time is past the publish date; 
c) time is before the expriy date, and; d) it matches the nominated 
categories.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent displayname="News: Listing Rule" extends="farcry.plugins.farcrycms.packages.rules.ruleNews" 
	hint="News rule publishes news content items in date order, with 
		most recently published first.  News content is only visible 
		if it is a) approved content; b) time is past the publish date; 
		c) time is before the expriy date, and; d) it matches the nominated 
		categories." bObjectBroker="true">

	<cfproperty ftSeq="100" ftFieldset="Rule Details" name="executeDisplay" type="string" hint="Display of rule content" required="true" default="displayExecuteDefault" ftType="webskin" fttypename="ruleNews" ftprefix="displayExecute" ftLabel="Execute Method" ftHint="This determines how each of your rule content will render." />
	
</cfcomponent>