<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Footer Standard --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="stParam.multiplecol" default="true">


<cfif stParam.multiplecol >
    <cfoutput>
    <!-- Secondary Column -->
    <aside class="bottom row" data-set="asides">
        <div class="sponsors">
           <a class="sponsor column medium-three">
                <img src="/wsimages/TMA.png" alt="The Memphis Agency" />
            </a>
            <a class="sponsor column medium-three">
                <img src="/wsimages/Farcry.png" alt="Farcry" />
            </a>
        </div>
    </aside>
    </cfoutput>
</cfif>

<cfoutput>
    </div><!-- End .wrapper -->

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