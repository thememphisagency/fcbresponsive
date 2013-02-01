<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Mobile Header --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="stParam.pageTitle" default="">

<cfcontent reset="true">

<cfoutput><!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>#stParam.pageTitle# - #application.config.general.sitetitle#</title>

	<meta name="viewport" content="width=320, target-densitydpi=medium-dpi, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<link rel="stylesheet" type="text/css" href="/css/mobile.css"></link>

	<skin:loadJS id="jquery" />
	<skin:loadJS id="farcry-devicetype" />

</head>

<body>

<div class="wrapper">

	<header>
		<div>
			<div id="header-logo">
				<a href="/"><img src="/css/images/logo.png" alt="Logo"></a>
			</div>
			<div id="header-nav">
				<nav>
					<skin:genericNav navID="#application.navid.home#" id="nav" depth="1" bActive="true" bIncludeHome="true" />
				</nav>
			</div>
		</div>
	</header>

</cfoutput>


<cfsetting enablecfoutputonly="false">