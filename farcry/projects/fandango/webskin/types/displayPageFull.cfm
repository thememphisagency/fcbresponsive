<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Standard Page Full --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="#url.bodyView#" columns="twelve" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" multiplecol="false">

<cfsetting enablecfoutputonly="false">