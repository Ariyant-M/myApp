<cfmodule template="customTags/basePage.cfm">
		<cfif structKeyExists(session, "LoggedUser")>
			<cfif "#url.productID#" NEQ "null">
				<cfheader name="Content-Disposition" value="attachment; filename=myProduct_#url.productID#.pdf">
				<cfcontent type="application/pdf">
				<cfdocument format="PDF">
					<cfoutput>
						<cfset local.productData = createObject('component', 'components.productsComponent').getProductByID(#url.productID#)>
						<small id="pID">Product ID: #local.productData.FLD_PRODUCTID#</small>
						<h1 id="pName">Product Name: #local.productData.FLD_PRODUCTNAME#</h1>
						<h3 id="pDetails">Product Details: #local.productData.FLD_PRODUCTDETAILS#</h3>
					</cfoutput>
				</cfdocument>
			<cfelse>
				<cfheader name="Content-Disposition" value="attachment; filename=allProducts.pdf">
				<cfcontent type="application/pdf">
				<cfdocument format="PDF">
					<cfset local.allProductData = createObject('component', 'components.productsComponent').getAllProduct()>
					<table>
						<tr>
							<th>ProductID</th>
							<th>ProductName</th>
							<th>ProductDetails</th>
						</tr>
						<cfoutput query="local.allProductData">
							<tr>
								<td>#FLD_PRODUCTID#</td>
								<td>#FLD_PRODUCTNAME#</td>
								<td>#FLD_PRODUCTDETAILS#</td>
							</tr>
						</cfoutput>
					</table>
				</cfdocument>
			</cfif>
				
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
</cfmodule>