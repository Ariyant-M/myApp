<cfcomponent output="false">
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
				<cflog text="failed to get product by ID: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- return all product present in the database --->
	<cffunction name="getAllProduct" returntype="query">
		<cftry>
			<cfquery name="local.product" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
				FROM TBL_PRODUCTLIST
			</cfquery>
			<cfreturn local.product>
		<cfcatch type="database">
				<cflog text="failed to get all product details: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>