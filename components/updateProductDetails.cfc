<!---
  --- update
  --- ------
  ---
  --- author: Ariyantm
  --- date:   28/1/21
  --->
<cfcomponent output="false">

	<!--- edit the product data --->
	<cffunction name="editProduct" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cftry>
			<cfquery result="editResult">
				UPDATE TBL_PRODUCTLIST
				SET FLD_PRODUCTNAME = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />,
				FLD_PRODUCTDETAILS = <cfqueryparam value= "#arguments.productDetails#" cfsqltype="cf_sql_varchar" />
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />;
			</cfquery>
			<cfif editResult.sql EQ ''>
				<cfreturn false>
			<cfelse>
				<cfreturn true>
			</cfif>
		<cfcatch>
				<cflog text="error in editing product: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Add new Product data to database --->
	<cffunction name = "addNewProduct" access="remote" returnformat="plain" returntype="string">
		<cfargument name="newProductName" required="true" type = "string">
		<cfargument name="newProductDetails" required="true" type = "string">
		<cftry>
			<cfquery result="local.newProductResult">
				INSERT INTO TBL_PRODUCTLIST(FLD_PRODUCTNAME,FLD_PRODUCTDETAILS)
				VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductName#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductDetails#">
					)
			</cfquery>
			<cfif local.newProductResult.sql EQ ''>
				<cfreturn "false">
			<cfelse>
				<cfreturn "true">
			</cfif>
		<cfcatch>
				<cflog text="error in user login: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn "false">
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Delete product from the database --->
	<cffunction name = "deleteProduct" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery result = "status">
				DELETE FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
			</cfquery>
			<cfreturn true>
		<cfcatch>
				<cflog text="error in user login: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
