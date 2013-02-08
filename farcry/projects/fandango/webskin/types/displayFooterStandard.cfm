<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Footer Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>

    <!--- THIS SHOULD BE REMOVED ASAP
    <footer>
        <div class="container_12">
            <div class="grid_8">
                <p>FarCry Core was lovingly crafted by the Daemonites and the FarCry Community.</p>
                <p>Copyright Daemon 2003-#dateFormat(now(), "yyyy")#. FarCry Core is dual licensed under the GPL and Commercial Licenses.</p>
                <p class="poweredby">
                    <a href="http://www.farcrycore.org"><img src="/css/images/poweredby.png" alt="Powered by FarCry Core"></a>
                </p>
                <p class="switch">
                    <a href="" class="fc-switch-device-mobile">View Mobile Site</a>
                </p>
            </div>
            <div class="grid_2">
                <skin:genericNav navID="#application.fapi.getNavID("home")#" id="footernav" depth="1" bActive="true" bIncludeHome="true" />
            </div>
            <div class="grid_2">
                <skin:genericNav navID="#application.fapi.getNavID("utility")#" id="footerutility" depth="1" bActive="true" bIncludeHome="false" />
            </div>
        </div>
    </footer>
    ---->

    <!-- Footer --> 
    <footer>
        <div class="wrapper">
            <ul class="quicklinks">
                <li>About Us</li>            
                <li>Our Products</li>            
                <li>Latest News</li>            
                <li>Contact Us</li>
            </ul>
            <div class="footerlinks row">
                <div class="three mobile-two columns">
                    <h4>About Us</h4>
                    <ul >
                        <li>Our History</li>            
                        <li>Our Vision</li>     
                        <li>The Framework</li>            
                    </ul>
                </div>
                <div class="three mobile-two columns">
                    <h4>Our Products</h4>
                    <ul >
                        <li>FarCry in a Box</li>            
                        <li>FCB Responsive</li>            
                        <li>Web Apps</li>            
                    </ul>
                </div>                
                <div class="three mobile-two columns">
                    <h4>Latest News</h4>
                    <ul >
                        <li>News &amp; Media</li>            
                        <li>From the Blog</li>            
                        <li>Latest Tweets</li>            
                    </ul>
                </div>               
                <div class="three mobile-two columns">
                    <h4>Contact Us</h4>
                    <ul class="contact">
                        <li><span data-icon="&##128222;"></span><span>+61 8 8212 2153<span></li>          
                        <li><span data-icon="&##59172;"></span><span>Level 1, 26 Gray Court Adelaide SA 5000</span></li>         
                    </ul>
                </div>              
            </div>

        </div>
        <div class="siteinfo">
            <div class="wrapper">
                <p class="copyright">&copy; 2013 The Memphis Agency</p>
                <ul class="disclaimer">
                    <li>Privacy</li>
                    <li>Sitemap</li>
                    <li>Credits</li>
                </ul>
                
                <a class="toTop" href="##">
                    <span data-icon="&##59227;"></span>
                    <span class="hide">Go to Top</span>
                </a>
            </div>

        </div>
    </footer>
    
    <!--- All Js files should be included in this file --->    
    <script src="/js/fcbResponsive.min.js" type="text/javascript"></script>

</body>

</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">