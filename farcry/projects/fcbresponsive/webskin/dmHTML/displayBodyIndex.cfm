<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Index Body View --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<cfparam name="stParam.columns" default="twelve">

<cftry>
<cfset oNav = CreateObject("component", application.stcoapi.dmNavigation.packagepath) />

<!--- get the children of this object --->
<cfset qGetChildren = application.factory.oTree.getChildren(objectid=request.navid) />

<cfoutput>
<div class="columns #stParam.columns#">
	<h1>#stObj.title#</h1>
</cfoutput>

<con:container label="#stObj.objectID#_Body_Top" lRules="#application.config.fcbWebsite.lFarcryRules#" />

<cfif structKeyExists(stObj, "body") AND len(stObj.body)>
	<cfoutput>#stObj.body#</cfoutput>
</cfif>

<cfoutput><div class="index"></cfoutput>

<cfif qGetChildren.recordcount GT 0>
    <!--- loop over children --->
    <cfloop query="qGetChildren">

        <!--- get child nav details --->
        <cfset stCurrentNav = oNav.getData(objectid=qGetChildren.objectID) />

        <!--- check for sim link --->
        <cfif len(stCurrentNav.externalLink)>
            <!--- get sim link details --->
            <cftry>
                <cfset stCurrentNav = oNav.getData(objectid=stCurrentNav.externalLink) />

                <cfcatch><!--- Ignore if the object doesnt exist ---></cfcatch>
            </cftry>
        </cfif>

        <cfquery datasource="#application.dsn#" name="qNavPages">
        SELECT * FROM dmNavigation_aObjectIDs
        where parentid = '#stCurrentNav.objectid#'
        order by seq
        </cfquery>

        <cfif qNavPages.recordCount>
            <!--- loop over child/sim link nav node --->
            <cfloop query="qNavPages">
                <cfset o = request.fcbObjectBucket.create(typename=qNavPages.typename) />

                <cfset stObjTemp = o.getData(objectid=qNavPages.data) />

                <!--- request.lValidStatus is approved, or draft, pending, approved in SHOWDRAFT mode --->
                <cfif StructKeyExists(stObjTemp,"status") AND ListContains(request.mode.lValidStatus, stObjTemp.status) AND StructKeyExists(stObjTemp,"displayMethod")>

                    <!--- if in draft mode grab underlying draft page --->
                    <cfif IsDefined("stObjTemp.versionID") AND request.mode.showdraft>
                        <cfquery datasource="#application.dsn#" name="qHasDraft">
                            SELECT objectID,status from #application.dbowner##stObjTemp.typename# where versionID = '#stObjTemp.objectID#'
                        </cfquery>

                        <cfif qHasDraft.recordcount gt 0>
                            <cfset stObjTemp = o.getData(objectid=qHasDraft.objectid) />
                        </cfif>
                    </cfif>

                    <skin:view objectid="#stObjTemp.objectid#" webskin="displayTeaserStandard" />

                    <cfbreak>
                </cfif>
            </cfloop>
        <cfelse>
            <skin:view objectid="#stCurrentNav.objectid#" webskin="displayTeaserStandard" alternateHTML="" />
        </cfif>

    </cfloop>
</cfif>

<cfoutput></div><!-- End .index --></cfoutput>

<con:container label="#stObj.objectID#_Body_Bottom" lRules="#application.config.fcbWebsite.lFarcryRules#" />

<cfoutput></div><!-- End .columns --></cfoutput>

    <cfcatch type="any"> <cfdump var="#cfcatch#" /> </cfcatch>

</cftry>

<cfsetting enablecfoutputonly="false">
