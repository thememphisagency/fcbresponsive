<!--- @@displayname: Default --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfif len(stobj.heading)>
	<cfset typenameObj = application.fapi.getContentObject(objectid=stobj.heading) />
	<cfif isDefined('typenameObj.label')>
		<cfoutput><h4><ui:buildLink objectid="#stobj.heading#" class="morelink" linkText="#typenameObj.label#" /></h4></cfoutput>
	</cfif>
	<cfif arrayLen(stobj.aPickedObjects)>

		<cfset request.iRuleTotalItems = arrayLen(stobj.aPickedObjects) />
		<cfif arrayLen(stobj.aPickedObjects) GT 0>
			<ul>
			<cfloop from="1" to="#arrayLen(stobj.aPickedObjects)#" index="i">				
				<cfset typenameObj = application.fapi.getContentObject(objectid=stobj.aPickedObjects[i].data) />
				<li><ui:buildLink objectid="#stobj.aPickedObjects[i].data#" class="morelink" linkText="#typenameObj.label#" /></li>			
			</cfloop>
			</ul>
		</cfif>
		
	</cfif>
</cfif>
<cfsetting enablecfoutputonly="false" />