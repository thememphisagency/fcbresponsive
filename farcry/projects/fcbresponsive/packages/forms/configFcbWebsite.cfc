<cfcomponent displayname="Website Configuration" hint="Configuration for the website" extends="farcry.core.packages.forms.forms" output="false" key="fcbWebsite">
	<cfproperty ftSeq="1" ftFieldset="General" name="footerText" type="String" default="The Memphis Agency" hint="" ftHint="&copy; 2013 [your text here]" ftLabel="Footer Text" />
	<cfproperty ftSeq="2" ftFieldset="General" name="pageTitlePrefix" type="String" default="" hint="" ftLabel="Page Title Prefix" />
	<cfproperty ftSeq="3" ftFieldset="General" name="pageTitleSuffix" type="String" default="" hint="" ftLabel="Page Title Suffix" />
	<cfproperty ftSeq="4" ftFieldset="General" name="searchBoxDefaultText" type="String" default="Enter keywords..." hint="" ftLabel="Search Box Text" />
	<cfproperty ftSeq="5" ftFieldset="General" name="metaKeywords" type="String" default="" hint="" ftLabel="Meta Keywords" />
	<cfproperty ftSeq="6" ftFieldset="General" name="metaDescription" type="String" default="" hint="" ftLabel="Meta Description" />
	<cfproperty ftSeq="7" ftFieldset="General" name="searchItemsPerPage" type="Numeric" default="10" hint="" ftLabel="Search Items Per Page " />
	<cfproperty ftSeq="8" ftFieldset="General" name="logoAlt" type="String" default="" hint="" ftLabel="Logo ALT text" />
	<cfproperty ftSeq="9" ftFieldset="General" name="logoTitle" type="String" default="" hint="" ftLabel="Logo TITLE text" />

	<cfproperty ftSeq="51" ftFieldset="Google Maps" name="googleMapApiKey" type="String" default="AIzaSyDY7PArAf3B0b777yo101O0rX8i3RzVWpA" hint="" ftLabel="Google Maps Api Key" />

	<cfproperty ftSeq="52" ftFieldset="Farcry" name="bEnableNavCache" type="boolean" default="0" hint="" ftLabel="Enable Navigation Caching?" ftType="list" ftRenderType="dropdown" ftList="0:no,1:yes" />
	<cfproperty ftSeq="53" ftFieldset="Farcry" name="campaignMonitorListID" type="string" default="" hint="" ftLabel="Campaign Monitor List ID" ftHint="The ID of the subscriber list to which the subscriber should be added." />
	<cfproperty ftSeq="54" ftFieldset="Farcry" name="enableSocial" type="boolean" default="1" hint="" ftLabel="Enable facebook and twitter" />
	<cfproperty ftSeq="55" ftFieldset="Farcry" name="lFarcryRules" type="string" default="ruleHandpicked,ruleDynamicInclude,rulePaginatorSearchByCategory" hint="" ftLabel="Farcry Rules" ftType="list" ftRenderType="dropdown" ftSelectMultiple="true" ftHint="Select a list of Farcry rules that are used for content authoring." ftListData="getRules" />
  <cfproperty ftSeq="56" ftFieldset="Farcry" name="bEnableAddThis" type="boolean" default="1" hint="" ftLabel="Enable AddThis?" />

	<cffunction name="getRules" returntype="string" hint="Get a list of rules availabel">
		<cfset var lRules = '' />
		<cfloop collection="#application.rules#" item="key">
			<cfset lRules = listAppend('#key#:#replaceNoCase(application.rules[key].displayName,":", " -", "all")#',lRules) />
		</cfloop>
		<cfreturn lRules />
	</cffunction>

</cfcomponent>
