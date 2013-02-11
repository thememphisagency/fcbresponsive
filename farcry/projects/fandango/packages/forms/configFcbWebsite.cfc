<cfcomponent displayname="Website Configuration" hint="Configuration for the website" extends="farcry.core.packages.forms.forms" output="false" key="fcbWebsite">
	<cfproperty ftSeq="1" ftFieldset="" name="footerText" type="String" default="&copy; Copyright 2008" hint="" ftLabel="Footer Text" />
	<cfproperty ftSeq="2" ftFieldset="" name="pageTitlePrefix" type="String" default="" hint="" ftLabel="Page Title Prefix" />
	<cfproperty ftSeq="3" ftFieldset="" name="pageTitleSuffix" type="String" default="" hint="" ftLabel="Page Title Suffix" />
	<cfproperty ftSeq="4" ftFieldset="" name="searchBoxDefaultText" type="String" default="Enter keywords..." hint="" ftLabel="Search Box Text" />
	<cfproperty ftSeq="5" ftFieldset="" name="metaKeywords" type="String" default="" hint="" ftLabel="Meta Keywords" />
	<cfproperty ftSeq="6" ftFieldset="" name="metaDescription" type="String" default="" hint="" ftLabel="Meta Description" />
	<cfproperty ftSeq="7" ftFieldset="" name="searchItemsPerPage" type="Numeric" default="10" hint="" ftLabel="Search Items Per Page " />
	<cfproperty ftSeq="8" ftFieldset="" name="logoAlt" type="String" default="" hint="" ftLabel="Logo ALT text" />
	<cfproperty ftSeq="9" ftFieldset="" name="logoTitle" type="String" default="" hint="" ftLabel="Logo TITLE text" />
	<cfproperty ftSeq="12" ftFieldset="" name="tag" type="String" default="1.0.0" hint="" ftLabel="" />
	<cfproperty ftSeq="13" ftFieldset="" name="bEnableNavCache" type="boolean" default="0" hint="" ftLabel="Enable Navigation Caching?" ftType="list" ftRenderType="dropdown" ftList="0:no,1:yes" />
	<cfproperty ftSeq="14" ftFieldset="" name="campaignMonitorListID" type="string" default="" hint="" ftLabel="Campaign Monitor List ID" ftHint="The ID of the subscriber list to which the subscriber should be added." />
	<cfproperty ftSeq="15" ftFieldset="" name="enableSocial" type="boolean" default="1" hint="" ftLabel="Enable facebook and twitter" />

</cfcomponent>