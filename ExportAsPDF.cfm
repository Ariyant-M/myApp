<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>hello</title>
		<!--- css style link --->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		<!---bootstrap CDN--->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<cfif isDefined(url.productID)>
			<cflocation url="errorFile.html">
		<cfelse>
			
			<cfheader name="Content-Disposition" value="attachment; filename=myDoc.pdf">

			<cfcontent type="application/pdf">

			<cfdocument format="PDF">

			  <cfoutput>
		        <cfset variables.productData = createObject('component', 'components.getProductDetails').getProductByID(#url.productID#)>
		        <small id="pID">Product ID: #variables.productData.FLD_PRODUCTID#</small>
		        <h1 id="pName">Product Name: #variables.productData.FLD_PRODUCTNAME#</h1>
		        <h3 id="pDetails">Product Details: #variables.productData.FLD_PRODUCTDETAILS#</h3>
		      </cfoutput>

			</cfdocument>
		</cfif>
	</body>
</html>