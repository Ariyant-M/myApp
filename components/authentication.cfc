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
		<cftry>
			<cfquery name="userdata">
				SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL
				FROM TBL_USERS
				WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.fld_useremail#" cfsqltype="cf_sql_varchar" />
				AND FLD_USERPASSWORD = <cfqueryparam value= "#arguments.fld_userpassword#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfcatch>
				<cflog text="error in user login: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn false>
			</cfcatch>
		</cftry>
		<cfif userdata.recordCount EQ 1>
			<cflock timeout= "2" scope="Session">
				<cfset session.LoggedUser = {firstName = "#userdata.FLD_USERFIRSTNAME#", lastName = "#userdata.FLD_USERLASTNAME#", userID = "#userdata.FLD_USERID#" }>
			</cflock>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
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

	<!--- addnew new user --->
	<cffunction name="addUser" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="firstName" required="true" type="string">
		<cfargument name="lastName" required="true" type="string">
		<cfargument name="userEmail" required="true" type="string">
		<cfargument name="userPwd" required="true" type="string">
		<cftry>
			<cfquery result="addUserResult">
				INSERT INTO TBL_USERS( FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL, FLD_USERPASSWORD)
				VALUES (
					<cfqueryparam value= "#arguments.firstName#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#arguments.lastName#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#arguments.userEmail#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#arguments.userPwd#" cfsqltype="cf_sql_varchar" />
					)
			</cfquery>
			<cfcatch>
				<cflog text="error in user signUp: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn false>
			</cfcatch>
		</cftry>
		<cfif addUserResult.sql NEQ ''>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<cffunction name="checkEmailExist" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="checkEmail" required="true" type="string">
		<cftry>
			<cfquery result = "checkEmailResult">
				select FLD_USERID FROM TBL_USERS
				WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.checkEmail#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfcatch>
				<cflog text="error in checking Email: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn false>
			</cfcatch>
		</cftry>
		<cfif checkEmailResult.sql NEQ ''>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

</cfcomponent>