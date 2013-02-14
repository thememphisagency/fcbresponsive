<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfset stParam = structNew()>
<cfset stParam.bGooglePlus = stObj.bGooglePlus>
<cfset stParam.bTwitter = stObj.bTwitter>
<cfset stParam.bFacebookLike = stObj.bFacebookLike>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displaySocialButtons" stParam="#stParam#">


<cfsetting enablecfoutputonly="false">