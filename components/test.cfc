<cfcomponent output="false">
	<cffunction name="dummy" returntype="boolean" returnformat="plain" access="remote">
		<cfargument name="productID" required="true" type="numeric">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cfset local.editStatus = false>
		<cftry>
			<cfquery result="res">
				UPDATE TBL_PRODUCTLIST
				SET FLD_PRODUCTNAME = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />,
				FLD_PRODUCTDETAILS = <cfqueryparam value= "#arguments.productDetails#" cfsqltype="cf_sql_varchar" />
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />;
			</cfquery>
			<cfcatch>
				<cflog text="error in editing product: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfset local.editStatus = false>
				<cfreturn local.editStatus>
			</cfcatch>
		</cftry>
		<cfif res.sql NEQ ''>
			<cfset ret = true>
		<cfelse>
			<cfset ret = false>
		</cfif>
		<cfreturn ret>
	</cffunction>
</cfcomponent>
