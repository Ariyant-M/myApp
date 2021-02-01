<cfcomponent output="false">
	<cffunction name="getProductByID" returntype="query">
		<cfargument name="productID" required="true" type="numeric">
		<cftry>
			<cfquery name="local.detailsByID" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
				FROM TBL_PRODUCTLIST
				WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cflog text="failed to get product by ID: #cfcatch.type# , #cfcatch.detail#" file="myAppError">
			</cfcatch>
		</cftry>
		<cfreturn local.detailsByID>
	</cffunction>
	<cffunction name="getAllProduct" returntype="query">
		<cftry>
			<cfquery name="local.product" datasource="myAppDB">
				SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
				FROM TBL_PRODUCTLIST
			</cfquery>
			<cfcatch type="database">
				<cflog text="failed to get all product at once: #cfcatch.type# , #cfcatch.detail#">
			</cfcatch>
		</cftry>
		<cfreturn local.product>
	</cffunction>
</cfcomponent>