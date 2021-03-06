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
         <cfif application.config.fcbWebsite.bEnableAddThis>
           <div class="addThisContainer">
              <p>Share this</p>
              <!-- AddThis Button BEGIN -->
              <div class="addthis_toolbox addthis_default_style addthis_16x16_style">
                  <a class="addthis_button_print"></a>
                  <a class="addthis_button_facebook"></a>
                  <a class="addthis_button_twitter"></a>
                  <a class="addthis_button_email"></a>
                  <a class="addthis_button_google_plusone_share"></a>
                  <a class="addthis_button_compact"></a>
              </div>
              <!-- AddThis Button END -->
          </div>
          </cfif>
            <con:container label="globalSecondaryContentTop" bShowIfEmpty="false" />
            <con:container label="#stObj.objectId#_localSecondaryContentTop" bShowIfEmpty="false" />
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
                <div class="three mobile-four columns">
                    <con:container label="ColumnOne" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>
                <div class="three mobile-four columns">
                   <con:container label="ColumnTwo" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>
                <div class="three mobile-four columns">
                   <con:container label="ColumnThree" bShowIfEmpty="false" lRules="ruleFooterLinks" />
                </div>
                <div class="three mobile-four columns last">
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
    <script src="/js/fcbResponsive.min.js?v=#application.config.fcbWebsite.version#" type="text/javascript"></script>

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
