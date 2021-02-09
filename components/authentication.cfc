<!---
  --- authentication
  --- --------------
  ---
  --- author: Ariyantm
  --- date:   25/1/21
  --->
<cfcomponent displayname="authenticateUser" output="false" extends="logError" 
	hint="Check user data form the users database and validate the given input">

	<!--- validate user in credentials from database, if user is valid then log in them--->
	<cffunction name="doLogin" access="remote" returnType="boolean" returnformat="plain"
		hint="validate user in credentials from database, if user is valid then log in them">
		<cfargument name="fld_useremail" required="true" type="string">
		<cfargument name="fld_userpassword" required="true" type="string">
		<cfset var hashPwd = hash(arguments.fld_userpassword)>
		<cfset var userdata = "">
		<cftry>
			<cfquery name="userdata">
				SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL
				FROM TBL_USERS
				WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.fld_useremail#" cfsqltype="cf_sql_varchar" />
				AND BINARY FLD_USERPASSWORD = <cfqueryparam value= "#hashPwd#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif userdata.recordCount EQ 1>
				<cflock timeout= "2" scope="Session">
					<cfset session.LoggedUser = {userEmail = "#userdata.FLD_USEREMAIL#", firstName = "#userdata.FLD_USERFIRSTNAME#", lastName = "#userdata.FLD_USERLASTNAME#", userID = "#userdata.FLD_USERID#" }>
				</cflock>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error while logging in user.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
				<cfabort showerror="error while logging in user">
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- logout the user --->
	<cffunction name="doLogout" access="remote" returnType="boolean" returnformat="plain"
		hint="logout the user">
		<cftry>
			<cfset structdelete(session,'LoggedUser') />
			<cfset sessionRotate()/>
			<cfif structKeyExists(session, 'LoggedUser')>
				<cfreturn false>
			<cfelse>
				<cfreturn true>
		</cfif>
		<cfcatch>
			<cfset var logErrorMessage = "Error while logging out user.">
			<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- addnew new user --->
	<cffunction name="addUser" access="remote" returntype="boolean" returnformat="plain" 
		hint="addnew new user">
		<cfargument name="firstName" required="true" type="string">
		<cfargument name="lastName" required="true" type="string">
		<cfargument name="userEmail" required="true" type="string">
		<cfargument name="userPwd" required="true" type="string">
		<cfset var hashPwd = hash(arguments.userPwd)>
		<cfset var addUserResult = "">
		<cftry>
			<cfquery result="addUserResult">
				INSERT INTO TBL_USERS( FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL, FLD_USERPASSWORD)
				VALUES (
					<cfqueryparam value= "#arguments.firstName#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#arguments.lastName#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#arguments.userEmail#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value= "#hashPwd#" cfsqltype="cf_sql_varchar" />
					)
			</cfquery>
			<cfif addUserResult.sql NEQ ''>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error in adding new user.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
	<!--- check if a given email ID exist or not. Used in user sign up --->
	<cffunction name="checkEmailExist" access="remote" returntype="boolean" returnformat="plain" 
		hint="check if a given email ID exist or not. Used in user sign up">
		<cfargument name="checkEmail" required="true" type="string">
		<cfset var checkMail = "">
		<cfset var checkEmailResult = "">
		<cftry>
			<cfquery result = "checkEmailResult" name="checkMail">
				select FLD_USERID FROM TBL_USERS
				WHERE FLD_USEREMAIL = <cfqueryparam value= "#arguments.checkEmail#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif checkMail.recordCount EQ 1>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
		<cfcatch>
			<cfset var logErrorMessage = "Error in checking Email.">
			<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
		</cfcatch>
	</cftry>
	</cffunction>

</cfcomponent>