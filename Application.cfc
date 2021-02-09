<!---
  --- Application
  --- -----------
  ---
  --- author: Ariyantm
  --- date:   22/1/21
  --->
<cfcomponent accessors="true" output="false">
	<cfset this.name = "myApp" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 20, 0 ) />
	<cfset this.datasource = "myAppDB">
	<cfset this.componentpaths = expandPath('/myApp/components')>
	<cfset this.customTagPaths = expandPath('/myApp/customTags') />
	<cfset this.sessionManagement = "true">
	<cfset this.sessionTimeout = #CreateTimeSpan(0,0,10,0)#>
	<cfset this.sessioncookie.httponly = true /> 
	<cfset this.sessioncookie.timeout = "10"  />
	<cfset this.sessioncookie.secure = true  /> 
	<cfset this.sessioncookie.disableupdate = true />
	<cfset THIS.SetClientCookies = true />
	<!---OnApplicationStart method--->
	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">

		<!--- Return out. --->
		<cfreturn true />
	</cffunction>

	<!---OnSessionStart method--->
	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---OnRequestStart method--->
	<cffunction
		name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">

		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Return out. --->
		<cfreturn true />
	</cffunction>

	<!---ONrequest method--->
	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">

		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---OnRequestEnd method--->
	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---onSessionEnd method--->
	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated.">

		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>

		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---onApplicationEnd method--->
	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">

		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!--- onerror method --->
	<cffunction
		name="OnError"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">

		<!--- Define arguments. --->
		<cfargument
			name="Exception"
			type="any"
			required="true"
			/>

		<cfargument
			name="EventName"
			type="string"
			required="false"
			default=""
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>
</cfcomponent>