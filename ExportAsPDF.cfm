<cfmodule template="customTags/loginValidation.cfm" />
<cfmodule template="customTags/basePage.cfm">
		<cfif structKeyExists(session, "LoggedUser")>
			<cfif "#url.productID#" NEQ "null">
				<cfheader name="Content-Disposition" value="attachment; filename=myProduct_#url.productID#.pdf">
				<cfcontent type="application/pdf">
				<cfdocument format="PDF">
					<cfoutput>
						<cfset local.productData = createObject('component', 'components.getProductDetails').getProductByID(#url.productID#)>
						<small id="pID">Product ID: #local.productData.FLD_PRODUCTID#</small>
						<h1 id="pName">Product Name: #local.productData.FLD_PRODUCTNAME#</h1>
						<h3 id="pDetails">Product Details: #local.productData.FLD_PRODUCTDETAILS#</h3>
						<br><br><br>
						<h5 id="pCreationDetails">Created by: #local.productData.FLD_PRODUCTCREATOR#  #local.productData.FLD_PRODUCTCREATIONTIME#</h5>
					</cfoutput>
				</cfdocument>
			<cfelse>
				<cfheader name="Content-Disposition" value="attachment; filename=allProducts.pdf">
				<cfcontent type="application/pdf">
				<cfdocument format="PDF">
					<cfset local.allProductData = createObject('component', 'components.getProductDetails').getAllProduct()>
					<table>
						<tr>
							<th>ProductID</th>
							<th>ProductName</th>
							<th>ProductDetails</th>
							<th>Created by</th>
							<th>Created on</th>
						</tr>
						<cfoutput query="local.allProductData">
							<tr>
								<td>#FLD_PRODUCTID#</td>
								<td>#FLD_PRODUCTNAME#</td>
								<td>#FLD_PRODUCTDETAILS#</td>
								<td>#FLD_PRODUCTCREATOR#</td>
								<td>#FLD_PRODUCTCREATIONTIME#</td>
							</tr>
						</cfoutput>
					</table>
				</cfdocument>
			</cfif>
				
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
</cfmodule>