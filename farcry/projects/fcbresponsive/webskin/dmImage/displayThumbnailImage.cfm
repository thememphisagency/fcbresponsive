<cfsetting enablecfoutputonly="true">
<cfparam name="stParam.class" default="">
<cfoutput>
<img src="#application.fapi.getImageWebRoot()##stobj.thumbnailImage#" class="#stParam.class#" alt="#HTMLEditFormat(stobj.alt)#" title="#HTMLEditFormat(stobj.title)#" />
</cfoutput>

<cfsetting enablecfoutputonly="false">