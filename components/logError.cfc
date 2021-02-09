<cfcomponent displayname="errorlogging" 
	hint="This will be extended by other component to handle error">
	<cffunction name="FileLogError" output="false" access="package" 
		hint="log data to the file when some error occur">
		<cfargument name="message" type="string" required="true">
		<cfargument name="catchType" type="string" required="true">
		<cfargument name="catchDetails" type="string" required="true">
		<cflog text="#arguments.message# : #arguments.catchType#, #arguments.catchDetails#" file="myAppError" type="error" >
	</cffunction>
</cfcomponent>