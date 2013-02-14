<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Social Buttons Fragment --->
<!--- @@author: Justin Carter (justin@daemon.com.au) --->

<cfparam name="stParam.bGooglePlus" default="true">
<cfparam name="stParam.bTwitter" default="true">
<cfparam name="stParam.bFacebookLike" default="true">

<cfoutput>
<div class="social-buttons">
	<!-- AddThis Button BEGIN -->
	<div class="addthis_toolbox addthis_default_style ">
	<cfif stParam.bGooglePlus><a class="addthis_button_google_plusone" g:plusone:size="medium"></a></cfif>
	<cfif stParam.bTwitter><a class="addthis_button_tweet"></a></cfif>
	<cfif stParam.bFacebookLike><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a></cfif>
	</div>
	<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js##pubid=xa-4eb66d060e618976"></script>
	<!-- AddThis Button END -->
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false">