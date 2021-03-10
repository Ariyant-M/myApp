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

	<cffunction name="showFeedback" access="remote" returntype="query">
		<cftry>
			<cfquery name ="feedBack">
				SELECT FLD_FEEDBACKID, FLD_USERMAIL, FLD_SUBJECT, FLD_MESSAGE, FLD_TIMESTAMP FROM TBL_USERFEEDBACK ORDER BY FLD_TIMESTAMP DESC
			</cfquery>
			<cfreturn feedBack>
			<cfcatch>
				<cfset var logErrorMessage = "Error while getting user feedBack.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="deleteFeedback" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="feedbackID" required="true" type="numeric">
		<cfset var productDeleteStatus = "">
		<cftry>
			<cfquery result = "productDeleteStatus">
				DELETE FROM TBL_USERFEEDBACK
				WHERE FLD_FEEDBACKID = <cfqueryparam value= "#arguments.feedbackID#" cfsqltype="CF_SQL_INTEGER" />
			</cfquery>
			<cfreturn true>
		<cfcatch>
				<cfset var logErrorMessage = "Error while Deleting feedback.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>