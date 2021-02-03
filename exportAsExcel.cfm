<cfmodule template="customTags/basePage.cfm">
		<cfif structKeyExists(session, "LoggedUser")>
			<cfif "#url.productID#" NEQ "null">

				<cfset local.productData = createObject('component', 'components.getProductDetails').getProductByID(#url.productID#)>
				<cfset sheetObj = spreadsheetNew()>
				<cfset spreadsheetAddRow(sheetObj, "ProductId, ProductName, ProductDetails")>
				<cfset spreadsheetFormatRow(sheetObj,
					{
						bold=true,
						fgcolor="lemon_chiffon",
						fontsize=14
					}, 1)>
				<cfset spreadsheetAddRows(sheetObj, local.productData)>
				<cfheader name="content-disposition" value="attachment; filename=Product_#url.productID#.xls">
				<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(sheetObj)#" reset="true">

			<cfelse>
				<cfset local.allProductData = createObject('component', 'components.getProductDetails').getAllProduct()>
				<cfset sheetObj = spreadsheetNew()>
				<cfset spreadsheetAddRow(sheetObj, "ProductId, ProductName, ProductDetails")>
				<cfset spreadsheetFormatRow(sheetObj,
					{
						bold=true,
						fgcolor="lemon_chiffon",
						fontsize=14
					}, 1)>
				<cfset spreadsheetAddRows(sheetObj, local.allProductData)>
				<cfheader name="content-disposition" value="attachment; filename=ProductAll.xls">
				<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(sheetObj)#" reset="true">
			</cfif>
				
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
</cfmodule>