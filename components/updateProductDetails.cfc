<!---
  --- update
  --- ------
  ---
  --- author: Ariyantm
  --- date:   28/1/21
  --->
<cfcomponent displayname="productAlteration" output="false" extends="logError"
	hint="create, edit, Delete product">

	<!--- edit the product data --->
	<cffunction name="editProduct" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="productDetails" required="true" type="string">
		<cfset var productEditResult = "">
		<cftry>
			<cfquery result="productEditResult">
				UPDATE TBL_PRODUCTLIST
				SET FLD_PRODUCTNAME = <cfqueryparam value= "#arguments.productName#" cfsqltype="cf_sql_varchar" />,
				FLD_PRODUCTDETAILS = <cfqueryparam value= "#arguments.productDetails#" cfsqltype="cf_sql_varchar" />
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />;
			</cfquery>
			<cfif productEditResult.sql EQ ''>
				<cfreturn false>
			<cfelse>
				<cfreturn true>
			</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error while editing product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Add new Product data to database --->
	<cffunction name = "addNewProduct" access="remote" returnformat="plain" returntype="string">
		<cfargument name="newProductName" required="true" type = "string">
		<cfargument name="newProductDetails" required="true" type = "string">
		<cfif session.loggeduser.role EQ 'admin'>
			<cfset local.showFlag = 1>
		<cfelse>
			<cfset local.showFlag = 0>
		</cfif>
		<cfset var newProductResult = "">
		<cftry>
			<cfquery result="newProductResult">
				INSERT INTO TBL_PRODUCTLIST(FLD_PRODUCTNAME,FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR, FLD_PRODUCTCREATIONTIME,FLD_PRODUCTVERIFIED)
				VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductName#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductDetails#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.loggeduser.FIRSTNAME#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#local.showFlag#">
					)
			</cfquery>
			<cfif newProductResult.sql EQ ''>
				<cfreturn "false">
			<cfelse>
				<cfreturn "true">
			</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error while adding new product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- Delete product from the database --->
	<cffunction name = "deleteProduct" access="remote" returnType="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cfset var productDeleteStatus = "">
		<cftry>
			<cfquery result = "productDeleteStatus">
				DELETE FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
			</cfquery>
			<cfreturn true>
		<cfcatch>
				<cfset var logErrorMessage = "Error while Deleting product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="acceptProductByAdmin" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery result="acceptStatus">
				UPDATE TBL_PRODUCTLIST SET FLD_PRODUCTVERIFIED = 1 where FLD_PRODUCTID = <cfqueryparam value="#arguments.productID#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfif acceptStatus.sql EQ ''>
					<cfreturn false>
				<cfelse>
					<cfreturn true>
				</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error while accepting product(Admin).">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="rejectProductByAdmin" access="remote" returntype="boolean" returnformat="plain">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery result="acceptStatus">
				DELETE FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="CF_SQL_INTEGER" />
			</cfquery>
			<cfif acceptStatus.sql EQ ''>
					<cfreturn false>
				<cfelse>
					<cfreturn true>
				</cfif>
		<cfcatch>
				<cfset var logErrorMessage = "Error while rejecting product(Admin).">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
