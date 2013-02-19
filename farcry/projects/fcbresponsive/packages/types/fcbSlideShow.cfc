<cfcomponent extends="farcry.core.packages.types.types" displayname="Slide Show" bSchedule="true" bObjectBroker="true">

	<cfproperty ftseq="1" ftwizardStep="General Details" name="title" type="string" hint="Title of object." required="yes" default="" ftLabel="Title" ftvalidation="required" />

	<cfproperty ftSeq="2" ftwizardStep="General Details" ftFieldset="" name="aObjectIDs" type="array" hint="Holds objects to be displayed at this particular node." required="no" default="" ftLabel="Images" ftJoin="dmImage" bSyncStatus="true" />
	
	<cfproperty ftseq="3" ftwizardStep="Galleria Settings" name="transition" type="string" hint="Images transition effect." required="yes" ftType="list" ftList="fade,flash,pulse,slide,fadeslide" default="" ftLabel="Transition"/>

	<cfproperty ftseq="4" ftwizardStep="Galleria Settings" name="debugMode" type="string" hint="" required="yes" ftType="list" ftList="false,true" default="" ftLabel="Debug Mode"/>

	<cfproperty ftseq="5" ftwizardStep="Galleria Settings" name="imageCrop" type="string" hint="" required="yes" ftType="list" ftList="true,false" default="" ftLabel="Auto Crop Images"/>

</cfcomponent>