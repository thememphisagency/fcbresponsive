<cfcomponent displayname="Columns" extends="farcry.core.packages.rules.rules"
	hint="A simple rule for adding up to four columns of rich text content to part of a page.">

	<cfproperty name="column1" type="longchar"
		ftSeq="1" ftFieldset="Columns" ftLabel="Column 1" 
		ftType="richtext" ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
		ftTemplateTypeList="dmImage,dmFile,dmFlash,dmNavigation,dmHTML" ftTemplateWebskinPrefixList="insertHTML"
		ftLinkListFilterRelatedTypenames="dmFile,dmNavigation,dmHTML"
		ftTemplateSnippetWebskinPrefix="insertSnippet">

	<cfproperty name="column2" type="longchar"
		ftSeq="2" ftFieldset="Columns" ftLabel="Column 2" 
		ftType="richtext" ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
		ftTemplateTypeList="dmImage,dmFile,dmFlash,dmNavigation,dmHTML" ftTemplateWebskinPrefixList="insertHTML"
		ftLinkListFilterRelatedTypenames="dmFile,dmNavigation,dmHTML"
		ftTemplateSnippetWebskinPrefix="insertSnippet">

	<cfproperty name="column3" type="longchar"
		ftSeq="3" ftFieldset="Columns" ftLabel="Column 3" 
		ftType="richtext" ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
		ftTemplateTypeList="dmImage,dmFile,dmFlash,dmNavigation,dmHTML" ftTemplateWebskinPrefixList="insertHTML"
		ftLinkListFilterRelatedTypenames="dmFile,dmNavigation,dmHTML"
		ftTemplateSnippetWebskinPrefix="insertSnippet">

	<cfproperty name="column4" type="longchar"
		ftSeq="4" ftFieldset="Columns" ftLabel="Column 4" 
		ftType="richtext" ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
		ftTemplateTypeList="dmImage,dmFile,dmFlash,dmNavigation,dmHTML" ftTemplateWebskinPrefixList="insertHTML"
		ftLinkListFilterRelatedTypenames="dmFile,dmNavigation,dmHTML"
		ftTemplateSnippetWebskinPrefix="insertSnippet">

</cfcomponent>