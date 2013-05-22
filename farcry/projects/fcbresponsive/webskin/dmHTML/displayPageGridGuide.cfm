<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Grid Guide (for designers) --->
<!--- @@author: Kate York --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/container" prefix="con">
<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

<!--- params --->
<cfparam name="stParam.breadcrumb" default="true">
<cfparam name="stParam.title" default="#stobj.label#">
<cfparam name="stParam.layoutClass" default="">
<cfparam name="stParam.pageTitle" default="#stobj.label#" />

<cfset sSeoTitle = stObj.label />
<cfif structKeyExists(stObj,'seoTitle') AND len(stObj.seoTitle) GT 0>
    <cfset sSeoTitle = stObj.seoTitle />
</cfif>

<cfcontent reset="true">
<cfoutput><!DOCTYPE HTML>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<title>#sSeoTitle#</title>
        <link href="http://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic|Cabin:400,500,600,400italic,600italic" rel="stylesheet" type="text/css">
        <!--[if IE]>
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:400" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:400italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:700" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:700italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin:400" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin:400italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin:500" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin:600" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cabin:600italic" rel="stylesheet" type="text/css">
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="/css/fcbResponsive.css" />
        <script src="/js/lib/modernizer-custom.js" type="text/javascript"></script>
</head>

<body>
    <div class="row wrapper gridGuide">
		<cfloop from="1" to="12" index="i">
			<div class="columns one medium-one bodyContent">
				<div class="gridGuideInner">
				<h1>&nbsp;</h1>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				</div>
			</div>
		</cfloop>
</div>
</body>

</html>
	</cfoutput>

<cfsetting enablecfoutputonly="false">