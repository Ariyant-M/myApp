<cfcomponent output="false">
	<!--- check if the value is not empty --->
	<cffunction name="validateName" returntype="boolean">
		<cfargument name="fld_name">
		<cfif arguments.fld_name NEQ "" >
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<!--- check if emial is valid or not --->
	<cffunction name="validateEmail" returntype="boolean">
		<cfargument name="fld_email">
		<cfif isValid("email", #arguments.fld_email#)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
</cfcomponent>