<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Standard Page --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<cfoutput>

	<div id="main-title">
		<div class="container_12">
			<div class="grid_12">
				<h1>Search</h1>
			</div>
		</div>
	</div>

	<div id="main">
		<div class="container_12">
			<div class="grid_9 content">
				<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="#url.bodyView#" />
			</div>
			<div class="grid_3 sidebar">
				<!--- <skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="displaySidebar" /> --->
			</div>
		</div>
	</div>

</cfoutput>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard">

	
<cfsetting enablecfoutputonly="false">