<cfcomponent displayname="productDetails" output="false" extends="logError" 
	hint="fetch all the details of product">
	
	<!--- return product details of the given ID --->
	<cffunction name="getProductByID" returntype="query">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery name="local.detailsByID" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
				FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="cf_sql_integer" />
			</cfquery>
			<cfreturn local.detailsByID>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while getting product by ID.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- return all product present in the database --->
	<cffunction name="getAllProduct" returntype="query" access="remote">
		<cftry>
			<cfquery name="local.product" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
				FROM TBL_PRODUCTLIST
			</cfquery>
			<cfreturn local.product>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while get all product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- convert the allProduct query to struct and store in cache --->
	<cffunction name="queryToStructProdcut" output="false" access="remote">
		<cfscript>
			var productQuery = getAllProduct();
			var productStruct = structNew();
			for(i in productQuery){
				productStruct['#i.FLD_PRODUCTID#'] = {FLD_PRODUCTNAME = '#i.FLD_PRODUCTNAME#', FLD_PRODUCTDETAILS = '#i.FLD_PRODUCTDETAILS#'};
			}
			cachePut('productStruct', productStruct, createTimespan(0, 1, 0, 0), createTimespan(0, 0, 30, 0));
		</cfscript>
	</cffunction>

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
				<cfset var cacheUpdate = queryToStructProdcut()>
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
		<cfset var newProductResult = "">
		<cftry>
			<cfquery result="newProductResult">
				INSERT INTO TBL_PRODUCTLIST(FLD_PRODUCTNAME,FLD_PRODUCTDETAILS)
				VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductName#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.newProductDetails#">
					)
			</cfquery>
			<cfif newProductResult.sql EQ ''>
				<cfreturn "false">
			<cfelse>
				<cfset var cacheUpdate = queryToStructProdcut()>
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
			<cfset var cacheUpdate = queryToStructProdcut()>
			<cfreturn true>
		<cfcatch>
				<cfset var logErrorMessage = "Error while Deleting product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>