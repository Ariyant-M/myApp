<cfmodule template="customTags/loginValidation.cfm" />
<cfif #session.loggeduser.role# EQ 'admin'>
<cfmodule template="customTags/basePage.cfm" title = "Edit Product">
		<cfif structKeyExists(session, "LoggedUser")>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="product.cfm">myApp</a>
			    </div>
			</nav>
			<div class="container">
				<cfif isDefined("url.productID")>
				<cfset productObject = createObject('component','components.getProductDetails')>
				<cfset productList = productObject.getProductByID(#url.productID#)>
				<form method="post">
					<div class="mb-3">
					<cfoutput>
					<label for="productName" class="form-label">Name</label>
					<input type="text" class="form-control" id="productName" value = "#productList.FLD_PRODUCTNAME#" required="true">
					</div>
					<div class="mb-3">
					<label for="productDetails" class="form-label">Details</label>
					<textarea class="form-control" id="productDetails" name = "productDetails" rows="3" required="true">#productList.FLD_PRODUCTDETAILS#</textarea>
					</div>
					<button class="btn btn-primary" id="confirmEdit" name="confirmEdit">Submit</button>
					<input class="btn btn-danger" id="Cancel" type="button" onclick="this.form.reset();" value = "Reset">
					</cfoutput>
				</form>
			<cfelse>
				<cflocation url="product.cfm">
			</cfif>
		<cfelse>
			<cflocation url="index.cfm">
		</cfif>
		</div>
		<script src="JavaScript/editProduct.js"></script>
</cfmodule> 
<cfelse>
	<cflocation url="product.cfm">
</cfif>