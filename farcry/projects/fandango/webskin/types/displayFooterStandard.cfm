<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Footer Standard --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>

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

</div>

</body>

</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">