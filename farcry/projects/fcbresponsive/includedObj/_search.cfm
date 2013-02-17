<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: The Memphis Agency 2010, http://www.thememphisagency.com.au --->
<!--- @@displayname: Lucene Search Results Page --->

<cfparam name="form.criteria" default="" />
<cfparam name="categorySearchString" default="" />
<cfparam name="thisCatLabel" default="" />
<cfparam name="application.config.fcbwebsite.searchItemsPerPage" default=10 />
<cfparam name="url.currentPage" type="numeric" default=1>

<cfimport taglib="/farcry/plugins/fcblib/tags/fcb/ui" prefix="ui" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfif isdefined("url.criteria")>
	<cfif len(url.criteria)>
    	<cfset form.criteria = url.criteria />
	<cfelse>
		<cfset form.criteria = application.config.fcbwebsite.searchBoxDefaultText />
	</cfif>
</cfif>

<cfset oLucene = createObject("component","farcry.plugins.fcblib.packages.custom.lucene") />
<cfset form.criteria =cleanup(form.criteria) />

<cfset sLink = '' />

<cfif structKeyExists(application.navid, 'search')>
	<cfsavecontent variable="sLink">
		<ui:buildLink objectid="#application.navid.search#" urlOnly="1" />
	</cfsavecontent>
</cfif>

<cfif structKeyExists(request, 'colorTheme') AND request.colorTheme EQ 'red'>
	<cfif structKeyExists(application.navid, 'cwd_search')>
		<cfsavecontent variable="sLink">
			<ui:buildLink objectid="#application.navid.cwd_search#" urlOnly="1" />
		</cfsavecontent>
	</cfif>
</cfif>


<cfoutput>
	<div class="search">
		<div class="option-bar">
			<form name="quickSearch" id="quickSearch" method="post" action="#sLink#">
				<div class="row collapse">
					<div class="column ten">
						<input type="text" class="text" name="criteria" id="criteria" placeholder="#form.criteria#" value="#form.criteria#" />
					</div>
					<div class="column two">
						<input type="submit" class="button expand postfix" id="quickSearchSubmit" name="quickSearchSubmit" value="search" />
					</div>
				</div>
			</form>
		</div>
</cfoutput>
<cfif len(trim(form.criteria)) AND (form.criteria NEQ "Enter Keywords...")>	
	
	<cfset qResults = oLucene.searchCollection(form.criteria) />
	<cfset stPagination = structNew() />
	<cfset numItems = application.config.fcbwebsite.searchItemsPerPage />
	<cfset iTotal = qResults.recordCount />
		
    <cfif isDefined("qResults") AND qResults.recordCount gt 0>
	
		<cfif url.currentPage GT 1>
			<cfset url.startRow = (url.currentPage -1) * numItems + 1 >
		<cfelse>
			<cfset url.startRow = 1 />	
		</cfif>	
		<cfset url.endRow = url.startRow + numItems - 1 />

		<cfset sURL = "" />
		<ui:buildLink objectid="#request.navid#" r_url="sURL" />

		<cfif iTotal GT numItems>
			<cfset oUtilities = request.fcbObjectBucket.create(fullPath='farcry.plugins.fcblib.packages.custom.utility') />
			<cfset stPagination = oUtilities.renderSmartPagination(
											currentPage=url.currentPage,
											itemsPerPage=numItems,
											totalRecs=iTotal,
											url="#sURL#?criteria=#urlEncodedFormat(form.criteria)#",
											anchor="##primary",
											urlHasParam=1) />
									
		</cfif>

		<cfoutput>		
		<div class="result-details">
		 	<p>Your search for <span class="criteria">#form.criteria#</span> returned <span class="criteria">#iTotal#</span> results across our site.</p>
		 	<div class="row collapse">
		 		<div class="column six">
		 			<cfif structKeyExists(stPagination, "paginationHTML")>#stPagination.paginationHTML#</cfif>
		 		</div>
		 		<div class="column six">
		 			<cfif structKeyExists(stPagination, "pagingHTML")>#stPagination.pagingHTML#</cfif>
		 		</div>
		 	</div>
		</div>
		
		<ul class="result result-search">
		</cfoutput>	
		
	        <!--- output results --->
	        <cfloop query="qResults" startrow="#startRow#" endrow="#endRow#">
				<skin:view objectid="#qResults.objectid#"  typename="#qResults.typename#" template="displaySearch" score="#qResults.score#" />
	        </cfloop>
	        		
		<cfoutput>
		</ul>
		<div class="pagination-bottom result-details">
			<p class="">Your search for <span class="criteria">#form.criteria#</span> returned <span class="criteria">#iTotal#</span> results across our site.</p>
			<cfif structKeyExists(stPagination, "pagingHTML")>#stPagination.pagingHTML#</cfif>
		</div>
		</cfoutput>
	
    <cfelse>
        <cfoutput>
			<div class="result-details">
            	<p>Your search for <span class="criteria">#form.criteria#</span> produced no results.</p>
			</div>
        </cfoutput>
    </cfif>
	
<cfelse>
	<cfoutput>  
		<div class="result-details"><p>Please enter a search term in the box above.</p></div>
	</cfoutput>
</cfif>

<cfoutput>
</div> <!--- !END Search ---->
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
