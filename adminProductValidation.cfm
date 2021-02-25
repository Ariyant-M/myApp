<cfmodule template="customTags/loginValidation.cfm" />
<cfmodule template="customTags/adminValidation.cfm" />
<cfmodule template="customTags/basePage.cfm" title = "verify product">
	<cfif session.loggeduser.role NEQ 'admin'>
		<cflocation url="product.cfm">
	</cfif>
	<cfmodule template="customTags/adminNav.cfm">
	<div class="container">
		<cfset local.a = createObject("component", "components.getProductDetails").getProductForVerification()>
		<table class="table table-sm table-dark">
		  <div class="table-responsive">
		    <table class="table align-middle table-hover table-striped">
		      <thead>
		        <tr>
		          <th scope="col">#</th>
			      <th scope="col">Name</th>
			      <th scope="col">Details</th>
			      <th scope="col">Creator</th>
			      <th scope="col">Accept/Reject</th>
			    </tr>
		      </thead>
		      <tbody>
		      	<cfset rowcount =1 >
		      	<cfoutput query="local.a">
		        <tr id="#FLD_PRODUCTID#">
		          <th scope="row">#rowcount#</th>
			      <td>#FLD_PRODUCTNAME#</td>
			      <td>#FLD_PRODUCTDETAILS#</td>
			      <td>#FLD_PRODUCTCREATOR#</td>
			      <td>
			      	<button class="btn btn-success" onclick="acceptProduct(this);">
			      		<i class="fas fa-check"></i>
			      	</button>
			      	<button class="btn btn-danger" onclick="rejectProduct(this);">
			      		<i class="fas fa-times"></i>
			      	</button>
			      </td>
		        </tr>
		        <cfset rowcount++>
		    	</cfoutput>
		      </tbody>
		    </table>
		  </div>
		</table>
	</div>
</cfmodule>
	<script type="text/javascript" src="JavaScript/admin.js"></script>
</cfmodule>