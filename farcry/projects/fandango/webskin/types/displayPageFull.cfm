<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Full Width Page --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">

<!--- <cfoutput>

	<div id="main-title">
		<div class="container_12">
			<div class="grid_12">
				<h1>#stObj.title#</h1>
			</div>
		</div>
	</div>

	<div id="main">
		<div class="container_12">
			<div class="grid_12 content">
				<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="#url.bodyView#" />
			</div>
		</div>
	</div>
#stobj.typename#
</cfoutput>
 --->

<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="#url.bodyView#" columns="twelve" />
<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" multiplecol="false">

	
<cfsetting enablecfoutputonly="false">