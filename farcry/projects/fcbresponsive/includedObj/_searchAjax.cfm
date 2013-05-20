<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: The Memphis Agency 2010, http://www.thememphisagency.com.au --->
<!--- @@displayname: Lucene Search Results Page with AJAX Pagination--->

<cfparam name="form.criteria" default="" />
<cfparam name="application.config.fcbwebsite.searchItemsPerPage" default=10 />
<cfparam name="url.currentPage" type="numeric" default=1>

<cfimport taglib="/farcry/plugins/fcblib/tags/ajaxPagination" prefix="ajaxPag" />


<cfif isdefined("url.criteria")>
	<cfif len(url.criteria)>
    	<cfset form.criteria = url.criteria />
	<cfelse>
		<cfset form.criteria = application.config.fcbwebsite.searchBoxDefaultText />
	</cfif>
</cfif>

<cfset form.criteria =cleanup(form.criteria) />

<cfset sLink = '' />

<cfif structKeyExists(application.navid, 'search')>
	<cfsavecontent variable="sLink">
		<ui:buildLink objectid="#application.navid.search#" urlOnly="1" />
	</cfsavecontent>
</cfif>

<cfoutput>
	<div class="search">
		<fieldset class="option-bar">
			<form name="quickSearch" id="quickSearch" method="post" action="#sLink#">
				<div class="row collapse">
					<div class="column ten mobile-three">
						<input type="text" class="text" name="criteria" id="criteria" placeholder="#form.criteria#" value="#form.criteria#" />
					</div>
					<div class="column two mobile-one">
						<input type="submit" class="button expand postfix" id="quickSearchSubmit" name="quickSearchSubmit" value="search" />
					</div>
				</div>
			</form>
		</fieldset>
    <div class="searchResultsWrapper">
		  <ajaxPag:searchResults criteria="#form.criteria#" perPage="#application.config.fcbwebsite.searchItemsPerPage#" currentPage="#url.currentPage#" />
    </div>
</div> <!--- !END Search ---->
<cfif not isDefined('form.quickSearchSubmit')>
  <script>
  window.onload=function(){
    searchByHash();
  };
  </script>
</cfif>
</cfoutput>

<cfsetting enablecfoutputonly="true" />


<cffunction name="cleanup" access="private" returntype="string" output="Yes" hint="Possible Malicious html code from a given string">
  <cfargument name="str"    type="string" required="yes" hint="String">
  <cfargument name="action" type="string" required="no" default="cleanup" hint="If [cleanup], this will clean up the string and output new string, if [find], this will output a value or zero">
  <!--- **************************************************************************** --->
  <!--- Remove string between <script> <object><iframe><style><meta> and <link> tags --->
  <!--- @param str     String to clean up. (Required)                                --->
  <!--- @param action    Replace and Clean up or Find                                --->
  <!--- @author         Saman W Jayasekara (sam @ cflove . org)                     --->
  <!--- @version 1.1    May 22, 2010                                                 --->
  <!--- **************************************************************************** --->
  <cfswitch expression="#arguments.action#">
     <cfcase value="cleanup">
     <cfset local.str = ReReplaceNoCase(arguments.str,"<script.*?</*.script*.>|<applet.*?</*.applet*.>|<embed.*?</*.embed*.>|<ilayer.*?</*.ilayer*.>|<frame.*?</*.frame*.>|<object.*?</*.object*.>|<iframe.*?</*.iframe*.>|<style.*?</*.style*.>|<meta([^>]*[^/])>|<link([^>]*[^/])>|<script([^>]*[^/])>", "", "ALL")>
     <cfset local.str = local.str.ReplaceAll("<\w+[^>]*\son\w+=.*[ /]*>|<script.*/*>|</*.script>|<[^>]*(javascript:)[^>]*>|<[^>]*(onClick:)[^>]*>|<[^>]*(onDblClick:)[^>]*>|<[^>]*(onMouseDown:)[^>]*>|<[^>]*(onMouseOut:)[^>]*>|<[^>]*(onMouseUp:)[^>]*>|<[^>]*(onMouseOver:)[^>]*>|<[^>]*(onBlur:)[^>]*>|<[^>]*(onFocus:)[^>]*>|<[^>]*(onSelect:)[^>]*>","") >
     <cfset local.str = reReplaceNoCase(local.str, "</?(script|applet|embed|ilayer|frame|iframe|frameset|style|link)[^>]*>","","all")>
     </cfcase>
     <cfdefaultcase>
     <cfset local.str = REFindNoCase("<script.*?</script*.>|<applet.*?</applet*.>|<embed.*?</embed*.>|<ilayer.*?</ilayer*.>|<frame.*?</frame*.>|<object.*?</object*.>|<iframe.*?</iframe*.>|<style.*?</style*.>|<meta([^>]*[^/])>|<link([^>]*[^/])>|<\w+[^>]*\son\w+=.*[ /]*>|<[^>]*(javascript:)[^>]*>|<[^>]*(onClick:)[^>]*>|<[^>]*(onDblClick:)[^>]*>|<[^>]*(onMouseDown:)[^>]*>|<[^>]*(onMouseOut:)[^>]*>|<[^>]*(onMouseUp:)[^>]*>|<[^>]*(onMouseOver:)[^>]*>|<[^>]*(onBlur:)[^>]*>|<[^>]*(onFocus:)[^>]*>|<[^>]*(onSelect:)[^>]*>",arguments.str)>
     </cfdefaultcase>
  </cfswitch>
  <cfreturn local.str>
</cffunction>
