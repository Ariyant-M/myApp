<cfif thisTag.ExecutionMode EQ 'start'>
	<cfif session.loggeduser.role NEQ 'admin'>
		<cflocation url="product.cfm">
	</cfif>
</cfif>