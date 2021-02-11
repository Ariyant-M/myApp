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
			<cfscript>
				cachePut('cacheProducts', local.product, createTimespan(0, 1, 0, 0),createTimespan(0, 0, 30, 0));
			</cfscript>
			<cfreturn local.product>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while get all product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>