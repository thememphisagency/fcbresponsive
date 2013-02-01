<!--- Set up the application. --->	
<cfset THIS.Name = "myproject" />
<cfset THIS.displayName = "My Project" />


<cfset THIS.sessionmanagement = true  />
<cfset THIS.sessiontimeout = createTimeSpan(0,0,20,0) />
<cfset THIS.applicationtimeout = createTimeSpan(2,0,0,0) />
<cfset THIS.clientmanagement = false />
<cfset THIS.clientstorage = "registry" />
<cfset THIS.loginstorage = "cookie" />
<cfset THIS.scriptprotect = "" />
<cfset THIS.setclientcookies = true />
<cfset THIS.setdomaincookies = true />
<cfset THIS.mappings = structNew() />


<!--- FARCRY SPECIFIC --->
<cfset THIS.locales = "en_AU,en_US" />
<cfset THIS.dsn = "farcrydb" /> 
<cfset THIS.dbType = "h2" /> 
<cfset THIS.dbOwner = "" /> 
<cfset THIS.plugins = "farcrycms" /> 

<cfset THIS.bUseDeviceDetection = true /> 
<cfset THIS.bUseMobileWebskins = true /> 


<!--- 
THE VIRTUAL WEBSERVER PROJECT FOLDER
 --->
<cfset THIS.projectURL = "" />
<cfset THIS.webtopURL = "/farcry/core/webtop" />

<!--- 
A key that can be used on updateapp url variable to update the application scope
Only administrators can updateapp=1
 --->
<cfset THIS.updateappKey = "farcry" />

<!--- 
THE NAME OF THE FOLDER THAT CONTAINS YOUR FARCRY PROJECT
SET THIS VALUE IF IT IS DIFFERENT FROM THE APPLICATION NAME
 --->
<!--- <cfset THIS.projectDirectoryName = "myproject" /> --->


<!--- Define the page request properties. --->

<!--- <cfsetting requesttimeout="30" /> --->
<!--- <cfsetting showdebugoutput="true" /> --->
<!--- <cfsetting enablecfoutputonly="true" /> --->

