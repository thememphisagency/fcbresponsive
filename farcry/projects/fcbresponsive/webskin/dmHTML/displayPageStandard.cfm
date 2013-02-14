<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Standard Page (2 Col) --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard" breadcrumb="true">

<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="#url.bodyView#" columns="eight medium-six" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" columns="four">

<cfsetting enablecfoutputonly="false">