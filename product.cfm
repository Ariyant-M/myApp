<!---get product list--->

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>myApp</title>
    <!-- CSS styles -->
    <link rel="stylesheet" href="../myApp/CSS/style.css" />
    <!--- css style link --->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!---bootstrap CDN--->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
  </head>
  <body>
  	<cfif isDefined("session.LoggedUser")>
	<cfif isDefined("url.productID")>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		        <button class="btn btn-primary" id="editProduct" style = "margin-right: 10px;">Edit</button>
		        <!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDel">
				  Delete
				</button>

				<!-- Modal -->
				<div class="modal fade" id="confirmDel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        Are you sure, data will be deleted permanently..
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
				      </div>
				    </div>
				  </div>
				</div>
		      </div>
		    </div>
		</nav>
    	<div class="container">
    	<cfset productObject = createObject('component', 'components.getProductDetails')>
    	<cfset productDetails = productObject.getProductByID(#url.productID#)>
		<cfoutput>
			<div id="content">
			<h1 id="pName">#productDetails.FLD_PRODUCTNAME#</h1>
			<br>
			<h3 id="pDetails">#productDetails.FLD_PRODUCTDETAILS#</h3>
			</div>
		</cfoutput>
		</div>
	<cfelse>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		      	<button class="btn btn-primary" id="addNew" onclick="location.href = 'newProduct.cfm';">New <i class="fas fa-plus"></i></button>
		        <button class="btn btn-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
		      </div>
		    </div>
		</nav>
		<div class="container">
			<cfset local.productObject = createObject('component', 'components.getProductDetails')>
			<cfset local.productList = productObject.getAllProduct()>
			<cfloop from="1" to ="#local.productList.RecordCount#" index= "i" step = 3>
				<cfoutput>
				<div class="row product-row">
					<div class = "col-4">
						<div class = "product-display">
						<cfset local.data = QueryGetRow(productList, #i#) >
						<h5><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
						<p>#left("#local.data.FLD_PRODUCTDETAILS#",100)#...</p>
						</div>
					</div>
					<cfif #i# LT local.productList.RecordCount>
					<div class = "col-4">
						<div class = "product-display">
						<cfset i++>
						<cfset data = QueryGetRow(productList, #i#) >
						<h5><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
						<p>#left("#data.FLD_PRODUCTDETAILS#",100)#...</p>
						</div>
					</div>
					</cfif>
					<cfif #i# LT local.productList.RecordCount>
					<div class = "col-4">
						<div class = "product-display">
						<cfset i++>
						<cfset data = QueryGetRow(productList, #i#) >
						<h5><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
						<p>#left("#data.FLD_PRODUCTDETAILS#",100)#...</p>
						</div>
					</div>
					</cfif>
				</div>
				</cfoutput>
			</cfloop>
	    </div>
	</cfif>
	<cfelse>
		<cflocation url="index.cfm">
	</cfif>
  </body>
  <!-- javascript -->
<script src="JavaScript/product.js"></script>

</html>
