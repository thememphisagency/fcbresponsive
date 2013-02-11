<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Index Page (2 Col) --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="displayBodyIndex" columns="eight" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" columns="four">

<cfsetting enablecfoutputonly="false">