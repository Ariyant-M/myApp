
<!DOCTYPE html>
<html>
<head>
	<title>Add product</title>
	<link rel="stylesheet" href="../myApp/CSS/style.css" />
    <!--- css style link --->
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
		<cfform>
			<div>
			<label for="productName" class="form-label">Name</label>
			<input type="text" class="form-control" id="productName" name="productName">
			</div>
			<div class="mb-3">
			<label for="productDetails" class="form-label">Details</label>
			<textarea class="form-control" id="productDetails" name="productDetails" rows="3"></textarea>
			</div>
			<button class="btn btn-primary" id="addNew" name="addNew">Submit</button>
		</cfform>
	</div>
	<cfif structKeyExists(form,"addNew")>
	<cfset local.updateProductObject = createObject('component', "components.updateProductDetails").addNewProduct(#form.productName#, #form.productDetails#)>
	<cfoutput>
		<p> #local.updateProductObject# </p>
	</cfoutput>
</cfif>
	
</body>
</html>