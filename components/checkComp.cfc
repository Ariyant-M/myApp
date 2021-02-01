<cfcomponent output="false">
	<cffunction name="getDetails" access="remote" returntype="string" returnformat="plain">
    <!--- Get list of all equipment --->    
    <cfquery datasource="myAppDB" name="userdata">
		SELECT * 
		FROM TBL_PRODUCTLIST
	</cfquery>
		<CFSET lis =ValueList(userdata)>
		<cfreturn lis>
</cffunction>
</cfcomponent>