<cfsetting enablecfoutputonly="yes">
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:--->
<!--- @@displayname: Site Map --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="fcb">
<cfoutput>
<!--- <skin:cache hours="6" cachename="_SiteMap" cacheBlockName="Content"> --->
<fcb:genericNav bIncludeHome="1" id="sitemapNav" navID="#application.navid.home#" depth="4" bFirst=1 />
<!--- </skin:cache> --->
</cfoutput>
<cfsetting enablecfoutputonly="no">