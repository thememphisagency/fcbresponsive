<cfsetting enablecfoutputonly="true">

<cfset stLocal.cols = 0>
<cfif len(stObj.column1)><cfset stLocal.cols++></cfif>
<cfif len(stObj.column2)><cfset stLocal.cols++></cfif>
<cfif len(stObj.column3)><cfset stLocal.cols++></cfif>
<cfif len(stObj.column4)><cfset stLocal.cols++></cfif>

<cfoutput>
<div style="margin-left: -10px; margin-right: -10px;">
	<cfloop from="1" to="#stLocal.cols#" index="i">
		<div class="grid_#int(12/stLocal.cols)#">
			#stObj["column" & i]#
		</div>
	</cfloop>
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false">