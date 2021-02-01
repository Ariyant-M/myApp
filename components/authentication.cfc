<!---
  --- authentication
  --- --------------
  ---
  --- author: Ariyantm
  --- date:   25/1/21
  --->
<cfcomponent output="false">

	<!--- validate user in credentials from database, if user is valid then log in them--->
	<cffunction name="doLogin" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="fld_useremail" required="true" type="string">
		<cfargument name="fld_userpassword" required="true" type="string">
		<cfset local.loginStatus = false>
		<cftry>
			<cfquery name="userdata">
				SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL
				FROM TBL_USERS
				WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.fld_useremail#" cfsqltype="cf_sql_varchar" />
				AND FLD_USERPASSWORD = <cfqueryparam value= "#arguments.fld_userpassword#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfcatch>
				<cflog text="error in user login: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfset local.loginStatus = false>
				<cfreturn local.loginStatus>
			</cfcatch>
		</cftry>
		<cfif userdata.recordCount EQ 1>
			<cflock timeout= "2" scope="Session">
				<cfset session.LoggedUser = {firstName = "#userdata.FLD_USERFIRSTNAME#", lastName = "#userdata.FLD_USERLASTNAME#", userID = "#userdata.FLD_USERID#" }>
			</cflock>
			<cfset local.loginStatus = true>
		</cfif>

		<cfreturn local.loginStatus>
	</cffunction>

	<!--- logout the user --->
	<cffunction name="doLogout" access="remote" returnType="boolean" returnformat="plain">
		<cfset structdelete(session,'LoggedUser') />
		<cfif structKeyExists(session, 'LoggedUser')>
			<cfset local.loginStatus = false>
		<cfelse>
			<cfset local.loginStatus = true>
		</cfif>
		<cfreturn local.loginStatus>
	</cffunction>


</cfcomponent>