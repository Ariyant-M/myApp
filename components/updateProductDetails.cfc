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
		<cfset local.editStatus = false>
		<cftry>
			<cfquery result="editResult">
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
		<cfif editResult.sql EQ ''>
			<cfset local.editStatus = false>
		<cfelse>
			<cfset local.editStatus = true>
		</cfif>
		<cfreturn local.editStatus>
	</cffunction>

	<!--- Add new Product data to database --->
	<cffunction name = "addNewProduct" access="remote" returnformat="plain" returntype="string">
		<cfargument name="newProductName" required="true" type = "string">
		<cfargument name="newProductDetails" required="true" type = "string">
		<cfset variables.newProductStatus = "false">
		<cfquery result="local.newProductResult">
			INSERT INTO TBL_PRODUCTLIST(FLD_PRODUCTNAME,FLD_PRODUCTDETAILS)
			VALUES (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductName#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductDetails#">
				)
		</cfquery>
		<cfif local.newProductResult.sql EQ ''>
			<cfset variables.newProductStatus = "false">
		<cfelse>
			<cfset variables.newProductStatus = "true">
		</cfif>
		<cfreturn variables.newProductStatus>
	</cffunction>

	<!--- Delete product from the database --->
	<cffunction name = "deleteProduct" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cfset local.deleteProductStatus = false>
		<cftry>
			<cfquery result = "status">
				DELETE FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
			</cfquery>
			<cfcatch type="database">
				<cflog text="failed to delete product: #cfcatch.detail#">
				<cfset local.deleteProductStatus = false>
				<cfreturn local.deleteProductStatus>
			</cfcatch>
		</cftry>
		<cfset local.deleteProductStatus = true>
		<cfreturn local.deleteProductStatus>
	</cffunction>
</cfcomponent>
