<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Standard Mobile Footer --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>

    <footer>
        <div>
            <div>
                <p>FarCry Core was lovingly crafted by the Daemonites and the FarCry Community.</p>
                <p>Copyright Daemon 2003-#dateFormat(now(), "yyyy")#. FarCry Core is dual licensed under the GPL and Commercial Licenses.</p>
                <p class="poweredby">
                    <a href="http://www.farcrycore.org"><img src="/css/images/poweredby.png" alt="Powered by FarCry Core"></a>
                </p>
                <p class="switch">
					<a href="" class="fc-switch-device-desktop">View Full Site</a>
                </p>
            </div>
        </div>
    </footer>

</div>

</body>
</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">