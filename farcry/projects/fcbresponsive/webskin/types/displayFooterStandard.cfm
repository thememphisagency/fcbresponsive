<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Footer Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/net" prefix="net" />
<cfimport taglib="/farcry/core/tags/container" prefix="con" />

<cfparam name="stParam.multiplecol" default="true">
<cfparam name="stParam.layoutClass" default="internal">

<cfif stParam.multiplecol >
    <cfif stParam.layoutClass NEQ "home">
        <cfoutput><aside class="right columns four" data-set="asides"></aside></cfoutput>
    </cfif>  

    <cfoutput>
    <!-- Secondary Column -->
    <aside class="bottom columns four medium-six mobile-four" data-set="asides">
        <div class="append-around">
            <con:container label="globalSecondaryContentTop" bShowIfEmpty="false" />
            <con:container label="localSecondaryContentTop_#stObj.objectId#" bShowIfEmpty="false" />
            <div class="row sponsors">
                <a class="sponsor column medium-three">
                    <img src="/wsimages/TMA.png" alt="The Memphis Agency" />
                </a>
                <a class="sponsor column medium-three">
                    <img src="/wsimages/Farcry.png" alt="Farcry" />
                </a>
            </div>
        </div>
    </aside>
    </cfoutput>
</cfif>

<cfoutput>
    </div><!-- End .wrapper -->

    <!-- Footer --> 
    <footer>
        <div class="wrapper">

            <div class="footerlinks row">
                <div class="three mobile-two columns">
                    <con:container label="ColumnOne" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>
                <div class="three mobile-two columns">                   
                    <con:container label="ColumnTwo" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>                
                <div class="three mobile-two columns">
                    <con:container label="ColumnThree" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>               
                <div class="three mobile-two columns">
                    <con:container label="ColumnFour" bShowIfEmpty="false" lRules="ruleFooterLinks" />                   
                </div>              
            </div>

        </div>
        <div class="siteinfo">
            <div class="wrapper">
                <p class="copyright">&copy; #DateFormat(Now(),'yyyy')# #application.config.fcbwebsite.footertext#</p>
                 <ui:GenericNav navID="#application.navid.footer#"
                    id="footerNav"
                    depth="1"
                    bActive="true"
                    bIncludeHome="false"
                    class="disclaimer">
            
                <a class="toTop" href="##">
                    <i class="icon-up-circled"></i>
                    <span class="hide">Go to Top</span>
                </a>
            </div>

        </div>
    </footer>
    
    <!--- All Js files should be included in this file --->    
    <script src="/js/fcbResponsive.min.js" type="text/javascript"></script>

    </cfoutput>
    <!--- Only output the tracking code when user is not a logged in admin --->
    <cfif NOT application.fapi.checkPermission("Admin")>
        <net:GoogleAnalytics>
    </cfif>
    <cfoutput>

</body>

</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">