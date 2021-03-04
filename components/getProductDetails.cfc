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

	<cffunction name="getFilteredProductList" returntype="query">
		<cfargument name="startDate" type="date">
		<cfargument name="endDate" type="date">
		<cfargument name="keyword" type="string" default="">
		<cfquery name="filtredProduct">
			SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR, FLD_PRODUCTCREATIONTIME
			FROM TBL_PRODUCTLIST 
			WHERE FLD_PRODUCTCREATIONTIME > <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date"> AND FLD_PRODUCTCREATIONTIME < <cfqueryparam value="#arguments.endDate#" cfsqltype="cf_sql_date"> AND FLD_PRODUCTNAME LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar"> AND
				FLD_PRODUCTVERIFIED = TRUE
		</cfquery>
		<cfreturn filtredProduct>
	</cffunction>
	<cffunction name="filtered" returntype="query">
		<cfargument name="st" type="date" default="2000-03-12">
		<cfargument name="end" type="date" default="2021-03-05">
		<cfargument name="pat" type="string" default="oo">
		<cfquery name="prd"datasource="myAppDB">
			SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS, FLD_PRODUCTCREATOR, FLD_PRODUCTCREATIONTIME
			FROM TBL_PRODUCTLIST
			WHERE FLD_PRODUCTCREATIONTIME > <cfqueryparam value="#arguments.st#" cfsqltype="cf_sql_date"> AND
			FLD_PRODUCTCREATIONTIME < <cfqueryparam value="#arguments.end#" cfsqltype="cf_sql_date"> AND
			FLD_PRODUCTNAME LIKE <cfqueryparam value="%#arguments.pat#%" cfsqltype="cf_sql_varchar">
		</cfquery> 
		<cfreturn prd>
	</cffunction>
</cfcomponent>