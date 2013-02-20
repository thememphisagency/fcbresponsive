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
            
            <a class="button readMore" href="##"><span class="btnTxt">Read more</span> <span data-icon="&##59226;"></span>
            </a>
        </article>
        <aside class="columns four mobile-four right" data-set="asides"></aside>
    </div>

    <!-- Services -->
    <div class="row">
        <ul class="services clearfix">
            <li class="two mobile-two medium-two columns"><span data-icon="&##128241;"></span><span class="label">Mobile First</span></li>
            <li class="two mobile-two medium-two columns"><span data-icon="&##128202;"></span><span class="label">Scalable Solution</span></li>
            <li class="two mobile-two medium-two columns"><span data-icon="&##128319;"></span><span class="label">Future-Friendly</span></li>
            <li class="two mobile-two medium-two columns"><span data-icon="&##62977;"></span><span class="label">Adaptive Website</span></li>
            <li class="two mobile-two medium-two columns"><span data-icon="&##59214;"></span><span class="label">Responsive UI</span></li>
            <li class="two mobile-two medium-two columns"><span data-icon="&##9874;"></span><span class="label">CMS Integrated</span></li>
        </ul>
    </div>

    <div class="row content-block">
        <!-- Content Blocks -->
        <article class="four columns medium-three teaser">
            <h2>Content Block One</h2>
            <img src="/wsimages/thumb.png" alt="Content Block Teaser Image" class="wrap-left" />
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna.</p>
            <a href="##">Read more</a>
        </article>
        <article class="four columns medium-three teaser">
            <h2>Content Block Two</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud.</p>
            <a href="##">Read more</a>
        </article>
        <article class="four columns medium-three teaser">
            <h2>Content Block Three</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud.</p>
            <a href="##">Read more</a>
        </article>
    </div>

</div>  
</cfoutput>

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard" columns="2" layoutclass="home">

	
<cfsetting enablecfoutputonly="false">