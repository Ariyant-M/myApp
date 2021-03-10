<cfif thisTag.ExecutionMode EQ 'start'>
	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
	  	<div class="container-fluid">
	    <a class="navbar-brand" href="product.cfm">myApp</a>
	      	<div class="d-flex">
		        
<cfelse>
	<button class="btn btn-outline-danger" id="logout">Log Out <i class="fas fa-sign-out-alt"></i></button>
	      	</div>
	    </div>
	</nav>
</cfif>