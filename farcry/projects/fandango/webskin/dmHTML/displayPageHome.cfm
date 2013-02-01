<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Home Page --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/container" prefix="con" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<cfoutput>

	<div id="main-carousel">
		<div class="container_12">
			<div class="grid_4">
				<div class="intro">
					<con:container label="#stObj.objectID#_Intro" />
				</div>
			</div>
			<div class="grid_8">
				<con:container label="#stObj.objectID#_Carousel" />
			</div>
		</div>
	</div>

	<div id="main">
		<div class="container_12">
			<div class="grid_12 content">
				<con:container label="#stObj.objectID#_Body_Bottom" />
			</div>
		</div>
	</div>

</cfoutput>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard">

	
<cfsetting enablecfoutputonly="false">