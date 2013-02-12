<cfcomponent displayname="Footer Links" extends="farcry.core.packages.rules.rules"
	hint="A rule for adding Footer Links in a way that works Responsively.">

<cfproperty ftSeq="1" ftFieldSet="Heading" name="heading" type="uuid" ftJoin="dmLink,dmNews,dmHTML" hint="Heading link. In mobile view this is all that is shown" ftLabel="Heading" />
<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aPickedObjects" type="array" ftJoin="dmLink,dmNews,dmHTML" arrayProps="webskin:string" ftLabel="Select Objects" />


<!--- <cffunction name="getTypeByObjectId" returntype="string">
	<cfargument name="objectId" required="true" />
	<cfquery name="qRefObjects" datasource="#application.dsn#">
		SELECT typename 
		FROM refObjects 
		WHERE objectId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.objectId#">
		LIMIT 1
	</cfquery>
	<cfif qRefObjects.RecordCount GT 0>
		<cfreturn qRefObjects.typename />
	<cfelse>
		<cfreturn "" />
	</cfif>
</cffunction> --->
</cfcomponent>