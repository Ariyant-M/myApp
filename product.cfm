<!---get product list--->
<cfmodule template="customTags/basePage.cfm" title = "Product">
  	<cfmodule template="customTags/loginValidation.cfm" />
	<cfif isDefined("url.productID")>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		      	<div class="dropdown">
				  <button class="btn btn-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Export <i class="fas fa-file-export"></i>
				  </button>
				  <ul class="dropdown-menu dropdown-menu-primary" aria-labelledby="dropdownMenuButton2">
				    <li><a class="dropdown-item export" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></a></li>
				    <li><a class="dropdown-item export" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></a></li>
				  </ul>
				</div>
		      	<cfif session.loggeduser.role EQ 'admin'>
		        <button class="btn btn-primary" id="editProduct" style = "margin-right: 10px;">Edit <i class="fas fa-edit"></i></button>
		        <!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDel">
				  Delete <i class="fas fa-trash-alt"></i>
				</button>
				</cfif>
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

    	<cfset productDetails = createObject("component", "components.getProductDetails").getProductByID(#url.productID#)>
		<cfoutput>
			<div id="content">
			<h1 id="pName">#productDetails.FLD_PRODUCTNAME#</h1>
			<br>
			<h5 id="pDetails">#productDetails.FLD_PRODUCTDETAILS#</h5>
			<br>
			<small><b>created by:</b> #productDetails.FLD_PRODUCTCREATOR#</small>
			<br>
			<small><b>created on:</b> #left("#productDetails.FLD_PRODUCTCREATIONTIME#",19)#</small>
			</div>
		</cfoutput>
		</div>
	<cfelse>
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		      	<cfif #session.loggeduser.role# EQ "admin">
		      		<button type="button" class="btn btn-primary" id="adminPanel">
						Admin Panel <i class="fas fa-user-cog"></i>
					</button>
		      	</cfif>
				<div class="dropdown">
				  <button class="btn btn-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Export <i class="fas fa-file-export"></i>
				  </button>
				  <ul class="dropdown-menu dropdown-menu-primary" aria-labelledby="dropdownMenuButton2">
				    <li><a class="dropdown-item export" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></a></li>
				    <li><a class="dropdown-item export" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></a></li>
				  </ul>
				</div>
		      	<button class="btn btn-primary" id="addNew">New Product <i class="fas fa-plus"></i></button>
		        <button class="btn btn-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
		      </div>
		    </div>
		</nav>
		<div class="container">
			<cfset local.productList = createObject("component", "components.getProductDetails").getAllProduct()>
			<div class="row row-cols-1 row-cols-md-3 g-4 product-row">
				<cfloop from="1" to ="#local.productList.RecordCount#" index= "i">
					<cfoutput>
					  <div class="col">
					    <div class="card h-100">
					      <div class="card-body">
					      	<cfset local.data = QueryGetRow(productList, #i#) >
					        <h5 class="card-title"><a href="product.cfm?productID=#data.FLD_PRODUCTID#">#data.FLD_PRODUCTNAME#</a></h5>
					        <p class="card-text">#left("#local.data.FLD_PRODUCTDETAILS#",100)#...</p>
					      </div>
					      <div class="text-muted" style="margin-left: 15px;">
						    <small>created by: <b>#data.FLD_PRODUCTCREATOR#</b></small>
						  </div>
					    </div>
					  </div>
					</cfoutput>
				</cfloop>
			</div>
	    </div>
	</cfif>
	<!-- javascript -->
<script src="JavaScript/product.js"></script>
  </cfmodule>