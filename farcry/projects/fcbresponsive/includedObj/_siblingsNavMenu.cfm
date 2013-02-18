<cfsetting enablecfoutputonly="yes">
<!--- @@Copyright: The Memphis Agency 2004-2013 www.thememphisagency.com --->
<!--- @@License:--->
<!--- @@displayname: Siblings Nav Menu--->

<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfoutput>
	<cfset parentid =application.factory.oTree.getParentID(request.navid).parentID[1] />
	<cfif len(parentid) AND isValid('uuid', parentid)>		
	<div class="subNavigation">
		<ui:GenericNav navID="#parentid#"
		id="subNav"
		depth="1"
		bActive="true"               
		class="subNav"
		>
	</div>
	</cfif>
</cfoutput>
<cfsetting enablecfoutputonly="no">