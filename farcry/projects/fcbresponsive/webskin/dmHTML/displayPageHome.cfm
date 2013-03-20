<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Home Page --->
<!--- @@author: Matthew Attanasio --->

<cfimport taglib="/farcry/core/tags/container" prefix="con" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard" columns="2" layoutclass="home" breadcrumb="false">

<cfoutput>
<!-- Banner -->
<con:container label="#stobj.objectID#_localHomeImageSlider" lRules="ruleHandpicked" />

<div class="columns twelve">
    <!-- Feature Box -->
    <div class="row">
        <article class="columns eight medium-six headline">
            <h1>Responsive, in a Box.</h1>
            <p>An introductory paragraph is a great way to summarise the content before the reader really digs into the detail of your story. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis.</p>
            
            <a class="button button-with-icon" href="##">Read more <i class="icon-right-circled"></i></a>
        </article>
        <aside class="columns four mobile-four right" data-set="asides"></aside>
    </div>

    <!-- Services -->
    <div class="row">
        <ul class="services clearfix">
            <li class="two mobile-two medium-two columns"><i class="icon-mobile"></i><span class="label">Mobile First</span></li>
            <li class="two mobile-two medium-two columns"><i class="icon-chart-bar"></i><span class="label">Scalable Solution</span></li>
            <li class="two mobile-two medium-two columns"><i class="icon-paper-plane"></i><span class="label">Future-Friendly</span></li>
            <li class="two mobile-two medium-two columns"><i class="icon-sweden"></i><span class="label">Adaptive Website</span></li>
            <li class="two mobile-two medium-two columns"><i class="icon-window"></i><span class="label">Responsive UI</span></li>
            <li class="two mobile-two medium-two columns"><i class="icon-tools"></i><span class="label">CMS Integrated</span></li>
        </ul>
    </div>

    <div class="row content-block home-news">
        <con:container label="#stobj.objectID#_newsSection" />
    </div>

</div>  
</cfoutput>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" columns="2" layoutclass="home">

	
<cfsetting enablecfoutputonly="false">