<!--- @@displayname: Default --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfif len(stobj.heading)>
	<cfset typenameObj = application.fapi.getContentObject(objectid=stobj.heading) />
	<cfif isDefined('typenameObj.label')>
		<cfoutput><h4><ui:buildLink objectid="#stobj.heading#" class="morelink" linkText="#typenameObj.label#" /></h4></cfoutput>
	</cfif>

	<cfif len(stObj.phone) OR len(stObj.fax) OR len(stObj.address)>		
		<cfoutput>
		<ul class="contact">
			<cfif len(stObj.phone)>
				 <li><div data-icon="&##128222;"><span>#stObj.phone#<span></div></li>         
			</cfif>
			<cfif len(stObj.fax)>
				 <li><div data-icon="&##128222;"><span>#stObj.fax#<span></div></li>
			</cfif>
			<cfif len(stObj.email) AND isValid('email', stObj.email)>
				 <li><div data-icon="&##9993;"><span><a href="mailto:#stObj.email#">#stObj.email#</a><span></div></li>
			</cfif>
			<cfif len(stObj.address)>
				<li><div data-icon="&##59172;"><span>#stObj.address#<cfif len(stObj.address2)><br />#stObj.address2#</cfif></span></div></li>  
			</cfif>
		</ul>
		</cfoutput>
	</cfif>
</cfif>
<cfsetting enablecfoutputonly="false" />