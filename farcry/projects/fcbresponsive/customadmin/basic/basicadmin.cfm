<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfparam name="url.contenttype" default="">

<admin:header title="" />

<cfif len(url.contenttype)>

	<ft:objectadmin
		typename="#url.contenttype#"
		columnList="label,datetimelastupdated" 
		sortableColumns="label,datetimelastupdated"
		lFilterFields="label"
		sqlorderby="datetimelastupdated desc"
		module="basic/basicadmin.cfm&amp;contenttype=#url.contenttype#" />

<cfelse>
	<!-- missing url.contenttype -->
</cfif>

<admin:footer />