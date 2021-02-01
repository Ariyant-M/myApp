<!---
  --- update
  --- ------
  ---
  --- author: Ariyantm
  --- date:   28/1/21
  --->
<cfcomponent output="false">
	<cffunction name="edit" access="remote" returnType="string" >
		<cfargument name="productID" required="true" type="numeric">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cfquery datasource="myAppDB" result = "status">
			UPDATE TBL_PRODUCTLIST
			SET FLD_PRODUCTNAME = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />,
			FLD_PRODUCTDETAILS = <cfqueryparam value= "#arguments.productDetails#" cfsqltype="cf_sql_varchar" />
			WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
		</cfquery>
		<cfreturn status>
	</cffunction>
	<cffunction name = "delete" access="remote" returnType="string">
		<cfargument name="productID" required="true" type="numeric">
		<cfquery datasource="myAppDB" result = "status">
			DELETE FROM TBL_PRODUCTLIST
			WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
		</cfquery>
		<cfreturn status>
	</cffunction>
</cfcomponent>
