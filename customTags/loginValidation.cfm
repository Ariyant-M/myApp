<cfif thisTag.ExecutionMode EQ 'start'>
	<cfif NOT isDefined("session.LoggedUser")>
		<cflocation url="index.cfm">
	</cfif>
</cfif>