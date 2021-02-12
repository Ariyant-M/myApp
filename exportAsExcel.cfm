<cfmodule template="customTags/basePage.cfm">
	<cfparam name="attributes.exprotType" default="">
		<cfif structKeyExists(session, "LoggedUser")>
			<cfif "#url.productID#" NEQ "null">
				<cfset local.productData = createObject('component', 'components.productsComponent').getProductByID(#url.productID#)>
			<cfelse>
				<cfset local.productData = createObject('component', 'components.productsComponent').getAllProduct()>
			</cfif>


				<cfset sheetObj = spreadsheetNew()>
				<cfset spreadsheetAddRow(sheetObj, "ProductId, ProductName, ProductDetails")>
				<cfset spreadsheetFormatRow(sheetObj,
					{
						bold=true,
						fgcolor="lemon_chiffon",
						fontsize=14
					}, 1)>
				<cfset spreadsheetAddRows(sheetObj, local.productData)>
				<cfheader name="content-disposition" value="attachment; filename=Product#Now()#.xls">
				<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(sheetObj)#" reset="true">
				
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
</cfmodule>