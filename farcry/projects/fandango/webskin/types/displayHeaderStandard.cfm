<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Matthew Attanasio (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

<!--- params --->
<cfparam name="stParam.title" default="#stobj.label#">

<cfcontent reset="true">
<cfoutput><!DOCTYPE HTML>
<html class="no-js">

<head>
	<meta charset="utf-8">

	<title>#stParam.title#</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" type="text/css" href="/css/fcbResponsive.css" />

	<script src="/js/lib/modernizer-custom.js" type="text/javascript"></script>
</head>

<body>
    <!-- Header -->
    <header class="top">
        <div class="wrapper">
            <a class="logo" href="##">Farcry in a Box</a>
            
            <div class="header-search">
                <a class="toggleBtn search" href="##">
                    <span data-icon="&##128269;"></span>
                    <span class="hide">Search</span>
                </a>
                <form action="#application.fapi.getLink(alias='search',includeDomain=true)#" method="post" class="header-search-form">
                    <input type="text" class="search" placeholder="Search our website..." value="" />
                    <input type="submit" value="Submit">
                </form>
            </div>

            <a class="toggleBtn menu" href="##menu">
                <span data-icon="&##9776;"></span>
                <span class="hide">Menu</span>
            </a>
            </cfoutput>

            <ui:FcbNav navID="#application.navid.home#"
                class="fcbNav"
                depth="2"
                bIncludeHome="true"
                bFirstNodeInLevel="1" />

            <cfoutput>
        </div>
    </header>

    <div class="wrapper clearfix">

</cfoutput>

<cfsetting enablecfoutputonly="false">