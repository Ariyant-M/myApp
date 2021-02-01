<!---
  --- update
  --- ------
  ---
  --- author: Ariyantm
  --- date:   28/1/21
  --->
<cfcomponent output="false">
	<cffunction name="editProduct" access="remote" returnType="string">
		<cfargument name="productID" required="true" type="numeric">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cftry>
		<cfquery datasource="myAppDB" result="editResult">
			UPDATE TBL_PRODUCTLIST
			SET FLD_PRODUCTNAME = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />,
			FLD_PRODUCTDETAILS = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />
			WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />;
		</cfquery>
		<cfcatch type = "database">
			<cfset var status = "database error">
		</cfcatch>
		<cfif editResult.sql EQ ''>
			<cfreturn variables.status>
		<cfelse>
			<cfreturn "edit successful">
		</cftry>
	</cffunction>

	<cffunction name="addNewProduct">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cftry>
		<cfquery name=" local.addProduct" datasource = "myAppDB">
			INSERT INTO TBL_PRODUCTLIST(FLD_PRODUCTNAME, FLD_PRODUCTDETAILS)
			VALUES (<cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />, 
				<cfqueryparam value= "#arguments.productDetails#" cfsqltype="cf_sql_varchar" />)
		</cfquery>
		<cfcatch type = "database">
			<cfset var status = "database error">
		</cfcatch>
		<cfif editResult.sql EQ ''>
			<cfreturn variables.status>
		<cfelse>
			<cfreturn "edit successful">
		</cftry>
	</cffunction>
</cfcomponent>
