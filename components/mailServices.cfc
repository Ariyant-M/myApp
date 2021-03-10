<cfcomponent displayname="mailForApp" output="false" extends="logError"
	hint="send mail">
	<cffunction name="sendMail" access="remote" hint="" returntype="boolean" returnformat="plain">
		<cfargument name="mailFrom" default="ariyant.meher001@gmail.com">
		<cfargument name="mailTo" default="ariyant.meher001@gmail.com">
		<cfargument name="mailSubject" default = "sign Up successful">
		<cfargument name="mailBody" 
			default="<h1>Welcome to myApp</h1><br><h3>Explore the products..</h3>">
		<cftry>
			<cfmail from="#arguments.mailFrom#" subject="#arguments.mailSubject#" to="#arguments.mailTo#">
				#arguments.mailBody#
			</cfmail>
			<cfreturn true>
		<cfcatch>
			<cfset var logErrorMessage = "Error while Sending mail.">
			<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>