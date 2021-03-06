<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

<!--- params --->
<cfparam name="stParam.breadcrumb" default="true">
<cfparam name="stParam.title" default="#stobj.label#">
<cfparam name="stParam.pageTitle" default="#stobj.label#" />

<cfset sSeoTitle = stObj.label />
<cfif structKeyExists(stObj,'seoTitle') AND len(stObj.seoTitle) GT 0>
    <cfset sSeoTitle = stObj.seoTitle />
</cfif>

<cfoutput><!DOCTYPE HTML>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<title>#sSeoTitle#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </cfoutput>
    <cfif findNocase('enpresiv.com', CGI.SERVER_NAME) GT 0 OR findNocase('local', CGI.SERVER_NAME) GT 0>
        <cfoutput><meta name="robots" content="noindex, nofollow, noarchive" />
        <meta name="googlebot" content="noindex, nofollow, noarchive" />
        </cfoutput>
    </cfif>
    <cfif structKeyExists(stObj, "extendedMetaData") AND len(trim(stObj.extendedMetaData))>
        <cfoutput><meta name="description" content="#trim(stObj.extendedMetaData)#" /></cfoutput>
    <cfelse>
        <cfoutput><meta name="description" content="#trim(application.config.fcbWebsite.metaDescription)#" /></cfoutput>
    </cfif>
    <cfif structKeyExists(stObj, "metaKeywords") AND len(trim(stObj.metaKeywords))>
        <cfoutput><meta name="keywords" content="#trim(stObj.metaKeywords)#" /></cfoutput>
    <cfelse>
        <cfoutput><meta name="keywords" content="#trim(application.config.fcbWebsite.metaKeywords)#" /></cfoutput>
    </cfif>
    <!-- facebook open graph meta data -->
    <cfif application.config.fcbWebsite.enableSocial>
        <!--- Get meta data for facebook open graph --->
        <cfset sTeaser = '' />
        <cfif structKeyExists(stObj, 'teaser') AND len(stObj.teaser) GT 0>
            <cfset sTeaser = trim(stObj.teaser) />
        <cfelseif stObj.typename EQ 'bProduct' AND structKeyExists(stObj,'description') AND len(stObj.description) GT 0>
            <cfset sTeaser = trim(stObj.description) />
        </cfif>

        <cfset sTeaserImage = 'http://#CGI.SERVER_NAME#/wsimages/default_Facebook-Thumb.jpg' />
        <cfif structKeyExists(stObj, 'teaserImage') AND isValid('uuid', stObj.teaserImage)>
            <skin:view objectid="#stObj.teaserImage#" typename="dmImage" template="displayFacebookSourceImageURL" r_html="sTeaserImage" />
        </cfif>
        <cfoutput>
        <meta property="og:title" content="#trim(REReplace(stObj.label, '[^a-zA-Z0-9-_\s]', '', 'all'))#"/>
        <meta property="og:type" content="product"/>
        <meta property="og:url" content="#trim(application.fapi.getLink(objectid=stobj.objectid,includeDomain=true))#"/>
        <meta property="og:image" content="#trim(sTeaserImage)#"/>
        <meta property="og:description" content="#trim(REReplace(sTeaser, '[^a-zA-Z0-9-_\s]', '', 'all'))#"/>
        <meta property="og:site_name" content="#trim(application.config.general.sitetitle)#"/>
        <meta property="fb:app_id" content="#application.config.fcbFBGraphApi.AppID#"/>
        </cfoutput>
    </cfif>
    <cfoutput>
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
        <link type="text/css" rel="stylesheet" href="#application.url.webroot#/js/lib/galleria/themes/classic/galleria.classic.css">
        <link type="text/css" rel="stylesheet" href="#application.url.webroot#/js/lib/galleria/themes/dots/galleria.dots.css">
        <cfif #HTTP_USER_AGENT# CONTAINS "MSIE 9.0" OR HTTP_USER_AGENT CONTAINS "MSIE 8.0">
            <link rel="stylesheet" type="text/css" href="/css/desktopOnly.css?v=#application.config.fcbWebsite.version#" />
        <cfelse>
            <link rel="stylesheet" type="text/css" href="/css/fcbResponsive.css?v=#application.config.fcbWebsite.version#" />
        </cfif>
        <script src="/js/lib/modernizer-custom.js" type="text/javascript"></script>
        <script src="/js/lib/lib.js" type="text/javascript"></script><!-- this load any required library function -->
</head>

<body>

    </cfoutput>
    <cfif application.config.fcbWebsite.enableSocial>
        <cfoutput>
        <!-- Facebook javascript SDK -->
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_GB/all.js##xfbml=1&appId=#application.config.fcbFBGraphApi.AppID#";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <!-- END Facebook javascript SDK -->
        </cfoutput>
    </cfif>

    <cfoutput>
    <!-- Header -->
    <header class="top">
        <div class="wrapper">
            <a class="logo" href="/" title="#application.config.general.sitetitle#">#application.config.general.sitetitle#</a>

            <div class="header-search">
                <button class="toggleBtn search">
                    <i class="icon-search"></i>
                    <span class="hide">Search</span>
                </button>
                  <form action="/search" method="post" class="header-search-form">
                    <input type="text" class="search" placeholder="Search our website..." value="" name="criteria" />
                    <input type="submit" value="Submit">
                </form>
            </div>

            <a class="toggleBtn menu" href="##menu" id="menu-link">
                <i class="icon-menu"></i>
                <span class="hide">Menu</span>
            </a>
            </cfoutput>

            <ui:FcbNav navID="#application.navid.home#"
                class="fcbNav"
                depth="3"
                bIncludeHome="true"
                bFirstNodeInLevel="1" />

            <cfoutput>
        </div>
    </header>
    <cfif stParam.breadcrumb>
    <div class="breadcrumbs">
        <div class="wrapper clearfix">
            <ui:breadcrumb separator="<span>/</span>" here='<span class="self">#stobj.label#</span>'>
        </div>
    </div>
    </cfif>

    <div class="row wrapper">

</cfoutput>

<cfsetting enablecfoutputonly="false">
