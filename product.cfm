<!---get product list--->
<cfmodule template="customTags/basePage.cfm" title = "Product">
  	<cfif isDefined("session.LoggedUser")>
	<cfif isDefined("url.productID")>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		        <button class="btn btn-primary" id="editProduct" style = "margin-right: 10px;">Edit <i class="fas fa-edit"></i></button>
		        <!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDel">
				  Delete <i class="fas fa-trash-alt"></i>
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
		<button type="button" class="btn btn-primary" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></button>
		<button type="button" class="btn btn-primary" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></button>
		</div>
	<cfelse>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
				<button type="button" class="btn btn-primary" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></button>
				<button type="button" class="btn btn-primary" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></button>
		      	<button class="btn btn-primary" id="addNew" onclick="location.href = 'newProduct.cfm';">New Product <i class="fas fa-plus"></i></button>
		        <button class="btn btn-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
		      </div>
		    </div>
		</nav>
		<div class="container">
			<cfset local.productObject = createObject('component', 'components.getProductDetails')>
			<cfset local.productList = productObject.getAllProduct()>
			<cfloop from="1" to ="#local.productList.RecordCount#" index= "i" step = 3>
				<cfoutput>
					<div class="row row-cols-1 row-cols-md-3 g-4 product-row">
					  <div class="col">
					    <div class="card h-100">
					      <div class="card-body">
					      	<cfset local.data = QueryGetRow(productList, #i#) >
					        <h5 class="card-title"><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
					        <p class="card-text">#left("#local.data.FLD_PRODUCTDETAILS#",100)#...</p>
					      </div>
					    </div>
					  </div>
					  <cfif #i# LT local.productList.RecordCount>
					  <div class="col">
					    <div class="card h-100">
					      <div class="card-body">
					      	<cfset i++>
					      	<cfset local.data = QueryGetRow(productList, #i#) >
					        <h5 class="card-title"><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
					        <p class="card-text">#left("#local.data.FLD_PRODUCTDETAILS#",100)#...</p>
					      </div>
					    </div>
					  </div>
					  </cfif>
					  <cfif #i# LT local.productList.RecordCount>
					  <div class="col">
					    <div class="card h-100">
					      <div class="card-body">
					      	<cfset i++>
					      	<cfset local.data = QueryGetRow(productList, #i#) >
					        <h5 class="card-title"><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
					        <p class="card-text">#left("#local.data.FLD_PRODUCTDETAILS#",100)#...</p>
					      </div>
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
	<!-- javascript -->
<script src="JavaScript/product.js"></script>
  </cfmodule>