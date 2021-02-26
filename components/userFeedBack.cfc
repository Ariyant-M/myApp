<cfcomponent displayname="storeUserFeedBack" output="false" extends="logError">
	<cffunction name="addFeedBack" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="userEmail" type="string" required="true">
		<cfargument name="subject" type="string" required="true">
		<cfargument name="message" type="string" required="true">
		<cftry>
			<cfset var feedBackRes = ''>
			<cfquery result="feedBackRes">
				INSERT INTO TBL_USERFEEDBACK (FLD_USERMAIL, FLD_SUBJECT, FLD_MESSAGE) VALUES (
					<cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.subject#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.message#" cfsqltype="cf_sql_varchar">)
			</cfquery>
			<cfif feedBackRes.sql EQ ''>
				<cfreturn false>
			<cfelse>
				<cfreturn true>
			</cfif>
		<cfcatch>
		<cfset var logErrorMessage = "Error while adding feedback.">
		<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>