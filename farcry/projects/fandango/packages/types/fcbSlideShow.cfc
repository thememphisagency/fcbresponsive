<cfcomponent extends="farcry.core.packages.types.types" displayname="Slide Show" bSchedule="true" bObjectBroker="true">

	<cfproperty ftseq="1" ftwizardStep="General Details" name="title" type="string" hint="Title of object." required="yes" default="" ftLabel="Title" ftvalidation="required" />

	<cfproperty ftSeq="2" ftwizardStep="General Details" ftFieldset="" name="aObjectIDs" type="array" hint="Holds objects to be displayed at this particular node." required="no" default="" ftLabel="Images" ftJoin="dmImage" bSyncStatus="true" />

		<cfproperty name="effect" type="string" default="fade" hint="" ftSeq="3" ftFieldset="" ftLabel="Effect" ftType="list" ftRenderType="dropdown" ftListData="getEffects" ftHint="Transitional effect for each image" />
	
	<cfproperty name="pauseTime" type="string" default="4500" hint="" ftSeq="4" ftFieldset="" ftLabel="Pause Time" ftType="integer" ftHint="Time taken for each slide to transition to the next, speed is measured in milliseconds" />

	<cfproperty name="animationSpeed" type="string" default="500" hint="" ftSeq="5" ftFieldset="" ftLabel="animationSpeed" ftType="integer" ftHint="Time taken for the effect to finish" />

	<cfproperty name="startSlide" type="string" default="0" hint="" ftSeq="6" ftFieldset="" ftLabel="Start Slide" ftType="integer" ftHint="first slide starts at 0" />
	
	<cffunction name="getEffects" returntype="string" hint="Return a string of all the available effects for the image slider">
		
	<cfset lList = "sliceDown,sliceDownLeft,sliceUp,sliceUpLeft,sliceUpDown,sliceUpDownLeft,fold,fade,random,slideInRight,slideInLeft,boxRandom,boxRain,boxRainReverse,boxRainGrow,boxRainGrowReverse" />
	<cfreturn lList />	
	</cffunction>
</cfcomponent>