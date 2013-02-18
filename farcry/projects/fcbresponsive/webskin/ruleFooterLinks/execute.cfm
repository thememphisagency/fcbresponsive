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
		<cfset ulShown= false />
		<cfif arrayLen(stobj.aPickedObjects) GT 0>
			<cfloop from="1" to="#arrayLen(stobj.aPickedObjects)#" index="i">	
				<cfif stobj.aPickedObjects[i].typename EQ 'fcbContact'>							
					<skin:view typename="#stobj.aPickedObjects[i].typename#" objectid="#stobj.aPickedObjects[i].data#" webskin="displayTeaserStandard"/>
				<cfelse>			
					<cfif NOT ulShown>
						<cfoutput><ul></cfoutput>
						<cfset ulShown = true />
					</cfif>				
					<cfset typenameObj = application.fapi.getContentObject(objectid=stobj.aPickedObjects[i].data) />
					<li><ui:buildLink objectid="#stobj.aPickedObjects[i].data#" class="morelink" linkText="#typenameObj.label#" /></li>							
				</cfif>
			</cfloop>
			<cfif ulShown>
				<cfoutput></ul></cfoutput>
			</cfif>			
		</cfif>
		
	</cfif>
</cfif>
<cfsetting enablecfoutputonly="false" />