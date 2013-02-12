<cfcomponent extends="farcry.core.packages.types.types" displayname="Slide Show" bSchedule="true" bObjectBroker="true">

	<cfproperty ftseq="1" ftwizardStep="General Details" name="title" type="string" hint="Title of object." required="yes" default="" ftLabel="Title" ftvalidation="required" />

	<cfproperty ftSeq="2" ftwizardStep="General Details" ftFieldset="" name="aObjectIDs" type="array" hint="Holds objects to be displayed at this particular node." required="no" default="" ftLabel="Images" ftJoin="dmImage" bSyncStatus="true" />
	
</cfcomponent>