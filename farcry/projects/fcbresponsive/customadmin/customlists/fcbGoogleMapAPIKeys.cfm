<cfsetting enablecfoutputonly="yes">

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />

<!--- set up page header --->
<admin:header title="Google Maps API Keys" />

<ft:objectAdmin 
	title="Google Maps API Keys" 
	typename="fcbGoogleMapAPIKeys" 
	ColumnList="siteURL,datetimelastUpdated,lastupdatedby"
	SortableColumns="siteURL,datetimelastUpdated,lastupdatedby"
	lFilterFields="siteURL"
	sqlorderby="datetimelastupdated desc" />

<!--- page footer --->
<admin:footer />

<cfsetting enablecfoutputonly="no">
