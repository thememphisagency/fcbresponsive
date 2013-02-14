<cfcomponent displayname="Facebook Graph API Configs" hint="Facebook Configurations" extends="farcry.core.packages.forms.forms" output="false" key="fcbFBGraphApi">
	<!--- Default content populated is from a facebook test application --->
	<cfproperty ftSeq="1" ftFieldset="" name="AppID" type="String" default="179666172432" hint="a Facebook Platform application ID" ftLabel="App ID" />
	<cfproperty ftSeq="2" ftFieldset="" name="admins" type="String" default="" hint="A comma-separated list of either Facebook user IDs" ftLabel="Users ID" />
	<cfproperty ftSeq="3" ftFieldset="" name="AppSecret" type="String" default="2761b6ab6a5ab713a3d630723f333ef9" hint="" ftLabel="App Secret" />
	<cfproperty ftSeq="4" ftFieldset="" name="APIKey" type="String" default="2312e0cd67b3c7c43e85b515bb13a7d8" hint="" ftLabel="Api Key" />
</cfcomponent>