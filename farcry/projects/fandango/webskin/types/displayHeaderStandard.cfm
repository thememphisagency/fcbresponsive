<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Matthew Attanasio (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

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
                <form action="/" method="post" class="header-search-form">
                    <input type="text" class="search" placeholder="Search our website..." value="" />
                    <input type="submit" value="Submit">
                </form>
            </div>

            <a class="toggleBtn menu" href="##menu">
                <span data-icon="&##9776;"></span>
                <span class="hide">Menu</span>
            </a>
            <nav id="menu" role="navigation">
                <ul>
                    <li><a href="##">Home</a></li>
                    <li><a href="##">About</a></li>
                    <li><a href="##">Our Products</a></li>
                    <li><a href="##">Latest News</a></li>
                    <li><a href="##">Contact Us</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
</cfoutput>

<cfsetting enablecfoutputonly="false">