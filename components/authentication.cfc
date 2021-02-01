<!---
  --- authentication
  --- --------------
  ---
  --- author: Ariyantm
  --- date:   25/1/21
  --->
<cfcomponent output="false">
	<cffunction name="doLogin" access="remote" returnType="boolean" >
		<cfargument name="fld_useremail" required="true" type="string">
		<cfargument name="fld_userpassword" required="true" type="string">
		<cfset var loginStatus = false>
		<cfquery datasource="myAppDB" name="userdata">
			SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL
			FROM TBL_USERS
			WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.fld_useremail#" cfsqltype="cf_sql_varchar" />
			AND FLD_USERPASSWORD = <cfqueryparam value= "#arguments.fld_userpassword#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		<cfif userdata.recordCount EQ 1>
			<cflock timeout= "2" scope="Session">
				<cfset session.LoggedUser = {firstName = "#userdata.FLD_USERFIRSTNAME#", lastName = "#userdata.FLD_USERLASTNAME#", userID = "#userdata.FLD_USERID#" }>
			</cflock>
			<cfset variables.loginStatus = true>

		</cfif>

		<cfreturn variables.loginStatus>
	</cffunction>

	<cffunction name="doLogout" access="remote" returnType="boolean" returnformat="JSON">
		<cfset structdelete(session,'LoggedUser') />
		<cfset loginStatus = true>
		<cfset q = serializeJSON(loginStatus,"struct")>
		<cfreturn q>
	</cffunction>

	<cffunction name="newUser" access="remote" returntype="boolean">
		<cfset local.status = false>
		<cfargument name="firstName" required="true" type="string">
		<cfargument name="lastName" required="true" type="string">
		<cfargument name="userMail" required="true" type="string">
		<cfargument name="userPassword" required="true" type="string">
		<cftry>
		<cfquery>
			INSERT INTO TBL_USERS(FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL, FLD_USERPASSWORD)
			VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstName#">, 
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastName#">, 
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userMail#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userPassword#">)
		</cfquery>
		<cfcatch>
			<cfset local.status = false>
		</cfcatch>
			<cfset local.status = true>
		</cftry>
		<cfreturn local.status>
	</cffunction>
</cfcomponent>