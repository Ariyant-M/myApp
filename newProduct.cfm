
<cfmodule template="customTags/basePage.cfm" title = "Add Product">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="product.cfm">myApp</a>
		</div>
	</nav>
	<div class="container">
		<cfform>
			<div>
			<label for="newProductName" class="form-label">Name</label>
			<input type="text" class="form-control" id="newProductName" name="newProductName" required="true">
			</div>
			<div class="mb-3">
			<label for="newProductDetails" class="form-label">Details</label>
			<textarea class="form-control" id="newProductDetails" name="newProductDetails" rows="3" required="true"></textarea>
			</div>
			<button class="btn btn-primary" id="addNewProduct" name="addNewProduct">Submit</button>
		</cfform>
	</div>
	<script src="JavaScript/product.js"></script>
</cfmodule>