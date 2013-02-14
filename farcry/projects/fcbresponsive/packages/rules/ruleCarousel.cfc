<cfcomponent displayname="Carousel" extends="farcry.core.packages.rules.rules"
	hint="A simple rule for manually placing items in a carousel.">

	<cfproperty name="aCarouselItems" type="array"
		ftSeq="1" ftFieldset="General Details" ftLabel="Carousel Items"
		ftType="array" ftJoin="dmCarouselItem"
		ftHint="Select the items you would like to display in this carousel. You can drag and drop items in the list to reorder them.">

</cfcomponent>