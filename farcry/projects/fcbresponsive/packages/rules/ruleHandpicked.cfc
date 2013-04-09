<cfcomponent displayname="Utility: Handpicked Rule" extends="farcry.plugins.fcblib.packages.rules.ruleHandpicked" 
	hint="Hand-pick and display individual content items with a specified displayTeaser* handler.">

	<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aPickedObjects" type="array" ftJoin="dmEvent,dmFacts,dmFlash,dmFile,dmImage,dmInclude,dmLink,dmNews,dmHTML,fcbSlideShow,fcbExternalVideo,fcbContact" arrayProps="webskin:string" ftLabel="Select Objects" />

</cfcomponent>