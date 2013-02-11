<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry.

    FarCry is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry.  If not, see <http://www.gnu.org/licenses/>.
--->

<cfcomponent extends="farcry.core.proxyApplication" displayname="Application" output="true" hint="Handle the application.">



	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Fires when the application is first created.">
		
		<!--- Call the main farcry Application.cfc --->
		<cfset super.OnApplicationStart(argumentCollection=arguments) />
		
		
		<!--- Return out. --->

		<cfreturn true />

	</cffunction>

 

 

	<cffunction name="OnSessionStart" access="public" returntype="void" output="false" hint="Fires when the session is first created.">
		
		<!--- Call the main farcry Application.cfc --->
		<cfset super.onSessionStart(argumentCollection=arguments) />
		
		
		<!--- Return out. --->

		<cfreturn />

	</cffunction>

 

 

	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="true" hint="Fires at first part of page processing.">
		
		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />				
		
		<cfset var bReturn = "" />
		
		<!--- Call the main farcry Application.cfc --->
		<cfset bReturn = super.OnRequestStart(argumentCollection=arguments) />		
		
		<!--- Return out. --->
		<cfreturn bReturn />

	</cffunction>

 

 
<!--- 
	<cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Fires after pre page processing is complete.">
		<!--- Define arguments. --->

		<cfargument name="TargetPage" type="string" required="true" />
		
		
		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />

		<!--- Return out. --->

		<cfreturn />

	</cffunction>
 --->
 

 

	<cffunction name="OnRequestEnd" access="public" returntype="void" output="true" hint="Fires after the page processing is complete.">

		<!--- Call the main farcry Application.cfc --->
		<cfset super.OnRequestEnd(argumentCollections=arguments) />

		<!--- Return out. --->

		<cfreturn />
		
	</cffunction>

 

 

	<cffunction name="OnSessionEnd" access="public" returntype="void" output="false" hint="Fires when the session is terminated.">
		<!--- Define arguments. --->

		<cfargument name="SessionScope" type="struct" required="true" />

 

		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		
		
		<!--- Call the main farcry Application.cfc --->
		<cfset super.OnSessionEnd(argumentCollection=arguments) />
 

		<!--- Return out. --->

		<cfreturn />

	</cffunction>

 

 

	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" hint="Fires when the application is terminated.">
		<!--- Define arguments. --->

		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		
		
		<!--- Call the main farcry Application.cfc --->
		<cfset super.OnApplicationEnd(argumentCollection=arguments) />

 

		<!--- Return out. --->

		<cfreturn />

	</cffunction>

 

 

	<cffunction name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch.">
		<!--- Define arguments. --->

		<cfargument name="Exception" type="any" required="true" />

 

		<cfargument name="EventName" type="string" required="false" default="" />
		
		
		<!--- Call the main farcry Application.cfc --->
		<cfset super.OnError(argumentCollection=arguments) />

 		

		<!--- Return out. --->

		<cfreturn />

	</cffunction>

 

</cfcomponent>