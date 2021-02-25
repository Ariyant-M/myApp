<cfmodule template="customTags/loginValidation.cfm" />
<cfmodule template="customTags/adminValidation.cfm" />
<cfmodule template="customTags/basePage.cfm" title = "adminPanel">
	<cfmodule template="customTags/adminNav.cfm">
	</cfmodule>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="card text-center col-3" onclick="toProductValidation()" style="background-color: #F8F9FA; cursor: pointer;">
			  	<h1 style="color: #0B5ED7"><i class="fas fa-clipboard-check"></i></h1>
				<div class="card-body">
				   <h5 class="card-title"><a href = "adminProductValidation.cfm">Product Request</a></h5>

				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<script src="JavaScript/product.js"></script>
	<script src="JavaScript/admin.js"></script>
</cfmodule>