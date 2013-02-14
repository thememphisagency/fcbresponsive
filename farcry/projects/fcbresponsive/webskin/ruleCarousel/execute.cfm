<cfsetting enablecfoutputonly="true">

<cfoutput>
	<div id="carousel">
		<div class="items">
			<cfloop from="1" to="#arrayLen(stObj.aCarouselItems)#" index="i">
				<cfset stItem = application.fapi.getContentObject(typename="dmCarouselItem", objectid=stObj.aCarouselItems[i])>
				<div class="item">
					<a href="/"><img src="#application.url.imageroot##stItem.imageCarousel#"></a>
				</div>
			</cfloop>
		</div>
	</div>
	<script>
		$(function() {
			$("##carousel").scrollable({ circular: true }).autoscroll({ autoplay: true, interval: 8000 });
		});
	</script>
</cfoutput>

<cfsetting enablecfoutputonly="false">