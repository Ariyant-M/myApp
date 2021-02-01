<cfcomponent output="false">
	<cffunction name="getProductByID" returntype="query">
		<cfargument name="productID" required="true" type="numeric">
		<cfquery name="local.detailsByID" datasource="myAppDB">
			SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
			FROM TBL_PRODUCTLIST
			WHERE FLD_PRODUCTID = <cfqueryparam value= "#arguments.productID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfreturn local.detailsByID>
	</cffunction>
	<cffunction name="getAllProduct" returntype="query">
		<cfquery name="local.product" datasource="myAppDB">
			SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS
			FROM TBL_PRODUCTLIST
		</cfquery>
		<cfreturn local.product>
	</cffunction>
</cfcomponent>