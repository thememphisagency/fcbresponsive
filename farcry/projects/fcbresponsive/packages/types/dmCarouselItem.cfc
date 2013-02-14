<cfcomponent displayname="Carousel Items" extends="farcry.core.packages.types.types">

	<cfproperty name="title" type="string"
		ftSeq="1" ftFieldset="General Details" ftLabel="Title"
		ftHint="Provide a title for this carousel item.">

	<cfproperty name="imageSourceID" type="string"
		ftSeq="2" ftFieldset="General Details" ftLabel="Source Image"
		ftType="uuid" ftJoin="dmImage"
		ftHint="Select an image from the image library or create a new image.">

	<cfproperty name="imageCarousel" type="string"
		ftSeq="3" ftFieldset="General Details" ftLabel="Carousel Image"
		ftType="image" ftDestination="/images/dmCarouselItem/imageCarousel"
		ftAllowUpload="false" ftSourceField="imageSourceID:SourceImage"
		ftAutoGenerateType="center" ftImageWidth="620" ftImageHeight="200"
		ftQuality="0.8" ftInterpolation="blackman">
		
	<cfproperty name="imageThumbnail" type="string"
		ftSeq="4" ftFieldset="General Details" ftLabel="Thumbnail Image"
		ftType="image" ftDestination="/images/dmCarouselItem/imageThumbnail"
		ftAllowUpload="false" ftSourceField="imageSourceID:SourceImage"
		ftAutoGenerateType="center" ftImageWidth="95" ftImageHeight="30"
		ftQuality="0.8" ftInterpolation="blackman"
		ftHint="">

</cfcomponent>