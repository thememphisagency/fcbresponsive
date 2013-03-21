<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Events with Search and ordering --->
<!--- @@author: Kate York --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfparam name="url.criteria" type="string" default="" />
<cfparam name="url.ruleId" type="string" default="" />
<cfparam name="url.sortBy" type="string" default="date_upcoming" />
<cfparam name="url.currentPage" type="numeric" default=1 />
<cfparam name="url.month" type="string" default='' />

<cfparam name="request.mode.lValidStatus" default="approved">
<cfset oHTML = request.fcbObjectBucket.create(typename="dmHTML") />
<cfset sNews = oHTML.getObjectIDByAlias("dmEvent")/>
<cfset sURL = trim(application.fAPI.getLink(objectid=request.navid)) />
<cfset sRuleId = "r#replaceNoCase(stObj.objectid, '-','', 'all')#" />
<cfset sTypename = 'dmEvent' />
<cfset maximumRows = 500 />
<cfset numItems = stObj.numItems />
<cfset paginate= false/>
<cfset sDisplayTeaser = stObj.displayMethod />

<cfset lObjects = getResultData(stObj) />
<cfset aObjectIds = listToArray(lObjects) />
<cfset iTotal = arrayLen(aObjectIds) />

<!--- If Archive: Get Maximum Rows in New Table --->

<!--- check if filtering by categories --->

<cfif len(trim(stobj.metadata))>

    <cfset oCat = createObject("component", "farcry.core.packages.types.category") />
    <cfset q = oCat.getDataQuery(lCategoryIDs="#stObj.metadata#"
        ,typename="dmEvent"
        ,maxRows="#maximumRows#"
        ,bMatchAll="#stobj.bMatchAllKeywords#"
        ,sqlWhere="publishdate <= #now()# AND (expirydate >= #now()# OR expirydate is NULL)"
        ) />

<cfelse>
    <!--- don't filter on categories --->
    <cfset q=application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), orderby="publishDate DESC, label ASC")>
</cfif>
<cfset stPaginator = setPaginatorValues(currentPage=url.currentPage,numItems=numItems,objectId=stObj.objectId,ruleId=url.ruleId,iTotal=iTotal) />


<cfset sPaginator = '' />
<cfset sPaginatorClass = '' />
<cfif stPaginator.iTotal GT numItems>
    <cfset paginate = true/>
    <cfset sPaginatorClass = ' hasPaginator' />
                                                                      

</cfif>
  <cfset oUtilities = createObject("component","farcry.plugins.fcblib.packages.custom.utility") />
    <cfset sSmartPaginator = oUtilities.renderSmartPagination(currentPage=url.currentPage,
                                            itemsPerPage=numItems,
                                            totalRecs=stPaginator.iTotal,
                                            url="#sURL#?criteria=#urlEncodedFormat(url.criteria)#&amp;sortBy=#urlEncodedFormat(url.sortBy)#&amp;ruleId=#stObj.objectid#&amp;month=#urlEncodedFormat(url.month)#",
                                            urlHasParam=1
                                            )
                                            />              
<cfif len(trim(stObj.intro)) AND q.recordCount>
	<cfoutput>#stObj.intro#</cfoutput>
</cfif>
<cfoutput>
<div class="news-search">
	<fieldset class="option-bar">
		<form name="quickSearch" id="quickSearch" method="get" action="#sURL#">
			<div class="row collapse">
				<div class="column ten mobile-three">
					<input type="text" class="text" name="criteria" id="criteria" placeholder="#url.criteria#" value="#url.criteria#" />
				</div>
				<div class="column two mobile-one">
					<input type="submit" class="button expand postfix" id="quickSearchSubmit" name="quickSearchSubmit" value="search" />
				</div>
			</div>
			<div class="row collapse">
				<div class="columns ten sort">					
					<div class="sortText">Sort</div>
					<div class="sortSelect">
                    <select name="sortBy" id="sortBy">
                        <option value="publish_newest" <cfif url.sortBy EQ "publish_newest">selected="1"</cfif>>Newest First</option>
                        <option value="publish_oldest" <cfif url.sortBy EQ "publish_oldest">selected="1"</cfif>>Oldest First</option>
                        <option value="label_asc" <cfif url.sortBy EQ "label_asc">selected="1"</cfif>>Alphabetically A-Z</option>
                        <option value="label_desc" <cfif url.sortBy EQ "label_desc">selected="1"</cfif>>Alphabetically Z-A</option>
                    </select>
                    </div>
            	</div>		
			</div>
		</form>
	</fieldset>

<div class="result-details pagination-top">
 	<div class="row">
 		<div class="column six">
 			<cfif structKeyExists(sSmartPaginator, "paginationHTML")>#sSmartPaginator.paginationHTML#</cfif>
 		</div>
 		<div class="column six">
 			<cfif structKeyExists(sSmartPaginator, "pagingHTML")>#sSmartPaginator.pagingHTML#</cfif>
 		</div>
 	</div>
</div>
</cfoutput>
<cfoutput><div class="index"></cfoutput>
	 <cfloop from="#stPaginator.startRow#" to="#stPaginator.endRow#" index="i">
        <cfset request.i = i />                 
        <skin:view objectID="#aObjectIds[i]#" typename="dmEvent" webskin="#stObj.displaymethod#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" /> 
    </cfloop>   
<cfoutput></div>
<div class="pagination-bottom result-details">
	<div class="row">
 		<div class="column six">
 			<cfif structKeyExists(sSmartPaginator, "paginationHTML")>#sSmartPaginator.paginationHTML#</cfif>
 		</div>
 		<div class="column six">
 			<cfif structKeyExists(sSmartPaginator, "pagingHTML")>#sSmartPaginator.paginghtml#</cfif>
 		</div>
 	</div>
</div>
</div>
</cfoutput>


<cfif len(trim(stObj.suffix)) AND q.recordCount>
	<cfoutput>#stObj.suffix#</cfoutput>
</cfif>

<cffunction name="getResultData" returntype="string">
    <cfargument name="stData" type="struct" required="true" />
    
    <cfset var lObjectIds = '' />
    <cfset var lSearchKeywordsResult = '' />
    <cfset var lSearchCategoryResult = '' />

    <!--- Check if filter by keyword search --->
    <cfif len(url.criteria) GT 0 AND url.criteria NEQ application.config.fcbWebsite.searchBoxDefaultText>
        <cfset oLucene = request.fcbObjectBucket.create(fullpath='farcry.plugins.fcblib.packages.custom.lucene') />

        <cfset qFirstResults = oLucene.searchCollection(url.criteria) />
        <cfif qFirstResults.recordCount GT 0>
            <cfset lSearchKeywordsResult = valuelist(qFirstResults.objectid) />
        <cfelse>
            <!--- No result found, return empty list --->
            <cfreturn '' /> 
        </cfif>
        
        <!--- Change double quotes to corrent html entity --->
        <cfset url.criteria = replaceNoCase(url.criteria, '"', '&quot;', 'all') />  


    </cfif> 

    <!--- Check if filtering by categories --->
    
    <cfif len(trim(arguments.stData.metadata))>
        <cfset oCat = application.factory.oCategory />
        <cfset q = oCat.getDataQuery(lCategoryIDs="#arguments.stData.metadata#",typename="#sTypename#",maxRows="#maximumRows#",bMatchAll="#arguments.stData.bMatchAllKeywords#") />
        <cfif q.recordCount GT 0>
            <cfset lSearchCategoryResult = valuelist(q.objectid) />
        <cfelse>
            <!--- No result found for matching category, return empty list --->
            <cfreturn '' /> 
        </cfif> 
    </cfif>

    <cfquery name="qResults" datasource="#application.dsn#">
        SELECT *
        FROM #sTypename#
        WHERE status = 'approved'
        AND publishdate <= #now()# 
        AND (expirydate >= #now()# OR expirydate is NULL)

        <cfif listLen(lSearchKeywordsResult) GT 0>
            AND objectid IN (<cfqueryparam cfsqltype="cf_sql_longvarchar" list="true" value="#lSearchKeywordsResult#" />)
        </cfif>
        
        <!--- if there's no active login session, filter result by non-secure data --->
        <cfif NOT structKeyExists(session, 'dmSec')>
            AND bSensitive = 0
        </cfif>
        
        <cfswitch expression="#url.sortBy#">
            <cfcase value="label_asc">
                ORDER BY label ASC
            </cfcase>
            <cfcase value="label_desc">
                ORDER BY label DESC
            </cfcase>   
            <cfcase value="publish_oldest">
                ORDER BY publishDate ASC
            </cfcase>                                   
            <cfdefaultcase>
                ORDER BY publishDate DESC
            </cfdefaultcase>
        </cfswitch>
    </cfquery>

    <cfif qResults.recordCount GT 0>
        <cfset lObjectIds = valueList(qResults.objectid) />
    </cfif>

    <cfreturn lObjectIds />
</cffunction>

<cffunction name="setPaginatorValues" access="private" returntype="struct" output="false">
    <cfargument name="currentPage" type="numeric" required="true" />
    <cfargument name="numItems" type="numeric" required="true" />
    <cfargument name="objectId" type="string" required="true" />
    <cfargument name="ruleId" type="string" required="true" />
    <cfargument name="iTotal" type="numeric" required="true" />
    
    <cfset var stReturn = structNew() />
    
    <cfif arguments.currentPage GT 1 AND arguments.objectId eq arguments.ruleId>
        <cfset stReturn.currentPage = arguments.currentPage />
        <cfset stReturn.startRow = (arguments.currentPage -1) * numItems + 1 />
    <cfelse>
        <cfset stReturn.currentPage = 1 />
        <cfset stReturn.startRow = 1 /> 
    </cfif> 
    
    <cfset stReturn.endRow = stReturn.startRow + arguments.numItems - 1 />      
    
    <cfif stReturn.endRow GT arguments.iTotal>
        <cfset stReturn.endRow = arguments.iTotal />
    </cfif>
    <cfset stReturn.iTotal = arguments.iTotal />    
    
    <cfreturn stReturn />
</cffunction>  
<cfsetting enablecfoutputonly="false" />