<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />

<!--- params --->
<cfparam name="stParam.breadcrumb" default="false">
<cfparam name="stParam.title" default="#stobj.label#">
<cfparam name="stParam.pageTitle" default="#stobj.label#" />

<cfcontent reset="true">
<cfoutput><!DOCTYPE HTML>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<title>#application.config.fcbWebsite.pageTitlePrefix# #stParam.pageTitle#: #application.config.general.sitetitle# #application.config.fcbWebsite.pageTitleSuffix#</title>
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
    <cfoutput><link rel="stylesheet" type="text/css" href="/css/fcbResponsive.css" /><script src="/js/lib/modernizer-custom.js" type="text/javascript"></script>
</head>

<body>

    </cfoutput>
    <cfif application.config.fcbWebsite.enableSocial>
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
    </cfif>

    <cfoutput>
    <!-- Header -->
    <header class="top">
        <div class="wrapper">
            <a class="logo" href="/" title="#application.config.general.sitetitle#">#application.config.general.sitetitle#</a>
            
            <div class="header-search">
                <a class="toggleBtn search" href="##">
                    <span data-icon="&##128269;"></span>
                    <span class="hide">Search</span>
                </a>
                <form action="/search" method="post" class="header-search-form">
                    <input type="text" class="search" placeholder="Search our website..." value="" />
                    <input type="submit" value="Submit">
                </form>
            </div>

            <a class="toggleBtn menu" href="##menu" id="menu-link">
                <span data-icon="&##9776;"></span>
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
            <skin:breadcrumb separator=" / " here='#stobj.label#'>
        </div>
    </div>
    </cfif>

    <div class="wrapper clearfix">

</cfoutput>

<cfsetting enablecfoutputonly="false">