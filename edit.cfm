<cfif structKeyExists(form,"confirmEdit")>
	<cflocation url="product.cfm">
	<cfif form.productName NEQ '' AND form.productDetails NEQ ''>
		<cfset editObject = createObject("component", "components.updateProductDetails")>
		<cfset editStatus = editObject.editProduct(#form.productName# , #form.productDetails#)>
		<cflocation url="product.cfm">
	</cfif>
</cfif>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>myApp</title>
		<!--- css style link --->
		<link rel="stylesheet" href="../myApp/CSS/style.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		<!---bootstrap CDN--->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		    </div>
		</nav>
		<div class="container">
			<cfif isDefined("session.LoggedUser")>
				<cfif isDefined("url.productID")>
				<cfset productObject = createObject('component','components.getProductDetails')>
				<cfset productList = productObject.getProductByID(#url.productID#)>
				<cfform>
					<div class="mb-3">
					<cfoutput>
					<label for="productName" class="form-label">Name</label>
					<input type="text" class="form-control" id="productName" value = "#productList.FLD_PRODUCTNAME#">
					</div>
					<div class="mb-3">
					<label for="productDetails" class="form-label">Details</label>
					<textarea class="form-control" id="productDetails" name = "productDetails" rows="3">#productList.FLD_PRODUCTDETAILS#</textarea>
					</div>
					<button class="btn btn-primary" id="confirmEdit" name="confirmEdit">Submit</button>
					<input class="btn btn-danger" id="Cancel" type="button" onclick="this.form.reset();" value = "Reset">
					</cfoutput>
				</cfform>
			<cfelse>
				<cflocation url="product.cfm">
			</cfif>
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
		</div>
	</body>
</html>
