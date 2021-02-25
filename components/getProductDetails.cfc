<cfcomponent displayname="productDetails" output="false" extends="logError" 
	hint="fetch all the details of product">

	<!--- return product details of the given ID --->
	<cffunction name="getProductByID" returntype="query">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery name="local.detailsByID" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR, FLD_PRODUCTCREATIONTIME
				FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="cf_sql_integer" /> AND FLD_PRODUCTVERIFIED = TRUE;
			</cfquery>
			<cfreturn local.detailsByID>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while getting product by ID.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- return all product present in the database --->
	<cffunction name="getAllProduct" returntype="query">
		<cftry>
			<cfquery name="local.product" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR, FLD_PRODUCTCREATIONTIME
				FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTVERIFIED = TRUE;
			</cfquery>
			<cfreturn local.product>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while get all product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="getProductForVerification" returntype="query">
		<cftry>
			<cfquery name="local.productForVerification" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR
				FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTVERIFIED = FALSE;
			</cfquery>
			<cfreturn local.productForVerification>
		<cfcatch type="database">
				<cfset var logErrorMessage = "Error while get all product.">
				<cfset var log = Super.FileLogError("#logErrorMessage#", "#cfcatch.type#", "#cfcatch.detail#")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>