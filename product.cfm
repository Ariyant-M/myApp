<!---get product list--->
<cfmodule template="customTags/basePage.cfm" title = "Product">
  	<cfmodule template="customTags/loginValidation.cfm" />
	<cfif isDefined("url.productID")>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="product.cfm">myApp</a>
		      <div class="d-flex">
		      	<div class="dropdown">
				  <button class="btn btn-outline-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Export <i class="fas fa-file-export"></i>
				  </button>
				  <ul class="dropdown-menu dropdown-menu-primary" aria-labelledby="dropdownMenuButton2">
				    <li><a class="dropdown-item export" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></a></li>
				    <li><a class="dropdown-item export" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></a></li>
				  </ul>
				</div>
		      	<cfif session.loggeduser.role EQ 'admin'>
		        <button class="btn btn-outline-primary" id="editProduct" style = "margin-right: 10px;">Edit <i class="fas fa-edit"></i></button>
		        <!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#confirmDel">
				  Delete <i class="fas fa-trash-alt"></i>
				</button>
				</cfif>
				<button class="btn btn-outline-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
				<!-- Modal for Delete Confirmation -->
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
				        <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-outline-danger" id="confirmDelete">Delete</button>
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
		      	<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#productFilter">
				  Filter <i class="fas fa-filter"></i>
				</button>
		      	<cfif #session.loggeduser.role# EQ "admin">
		      		<button type="button" class="btn btn-outline-primary" id="adminPanel">
						Admin Panel <i class="fas fa-user-cog"></i>
					</button>
		      	</cfif>
				<div class="dropdown">
				  <button class="btn btn-outline-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Export <i class="fas fa-file-export"></i>
				  </button>
				  <ul class="dropdown-menu dropdown-menu-primary" aria-labelledby="dropdownMenuButton2">
				    <li><a class="dropdown-item export" id="ExportPDF">Export as PDF <i class="fas fa-file-pdf"></i></a></li>
				    <li><a class="dropdown-item export" id="ExportExcel">Export as Excel <i class="fas fa-file-excel"></i></a></li>
				  </ul>
				</div>
		      	<button class="btn btn-outline-primary" id="addNew">New Product <i class="fas fa-plus"></i></button>
		        <button class="btn btn-outline-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
		      </div>
		    </div>
		</nav>
		<!-- Modal for filter product -->
		<div class="modal fade" id="productFilter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Filters</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>
		        	<h6>Date</h6>
		        	<label for="start-date">Start Date</label>
		        	<br>
		        	<input type="date" name="start-date" class="form-control" id="start-date" value="2020-08-15">
		        	<label for="end-date">End Date</label>
		        	<br>
		        	<input type="date" name="end-date" class="form-control" id="end-date">
		        	<br>
		        	<h6>Keywords</h6>
		        	<input type="text" name="filterKeywords" class="form-control" id="filterKeywords">
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-outline-primary" id="applyFilter">Apply <i class="fas fa-arrow-right"></i></button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="container">
			<cfif NOT isDefined("application.allProductList")>
				<cfset application.allProductList = createObject("component", "components.getProductDetails").getAllProduct()>
				<cfset local.productList = application.allProductList>
			</cfif>
			<cfif isDefined("url.startdate")>
				<cfset local.filterStartDate = #url.startdate#>
				<cfset local.filterEndDate = #url.enddate#>
				<cfset local.filterKeyword = #url.keyword#>
				<cfset local.productList = createObject("component", "components.getProductDetails").getFilteredProductList(local.filterStartDate,local.filterEndDate,local.filterKeyword)>
			<cfelse>
				<cfset local.productList = application.allProductList>
			</cfif>
			<cfset session.filteredProdut = local.productList>
			<cfif local.productList.RecordCount EQ 0>
				<div class="alert alert-danger" role="alert">
				  No product Found :(
				</div>
			</cfif>
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