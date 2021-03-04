<cfmodule template="customTags/loginValidation.cfm" />
<!DOCTYPE html>
<html>

<head>
	<title></title>

</head>
<body>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!---bootstrap CDN--->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="JavaScript/jquery-3.5.1.js"></script>
	<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="#expandPath('CSS/')#exportPDF.css">
		<cfif structKeyExists(session, "LoggedUser")>
			<cfif "#url.productID#" NEQ "null">
				
				<cfdocument format="PDF">
					<link rel="preconnect" href="https://fonts.gstatic.com">
					<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
					<style type="text/css">
						html,body{
							height: 100%;
							margin: 0;
							padding: 0;
							background-color: #d7d2e0;
						}
						.main-frame{
							height: 100%;
							padding: 30px;
						}
						.center{
							text-align: center;
							font-family: 'Akaya Telivigala', cursive;
						}
						.left{
							text-align: left;
						}
					</style>
						<cfset local.productData = createObject('component', 'components.getProductDetails').getProductByID(#url.productID#)>
						<div class="container-fluid">
							<div class="main-frame">
							<div class="center">
								<h1><u>
									<cfoutput>
										#local.productData.FLD_PRODUCTNAME#
									</cfoutput>
								</u></h1>
							</div>
							<br>
							<br>
							<div class="left">
								<cfoutput>
									Product ID: #local.productData.FLD_PRODUCTID#
								</cfoutput>
							</div>
							<br>
							<div class="center">
								<h4>
									<cfoutput>
										#local.productData.FLD_PRODUCTDETAILS#
									</cfoutput>
								</h4>
							</div>
							<br><br>
							<div class="left">
								<cfoutput>
									<small><b>created by: </b>#local.productData.FLD_PRODUCTCREATOR#</small>
									<br>
									<small><b>created on: </b>#left("#local.productData.FLD_PRODUCTCREATIONTIME#",19)#</small>
								</cfoutput>
							</div>
							</div>
						</div>
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
</body>
</html>
