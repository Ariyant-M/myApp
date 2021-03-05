<cfmodule template="customTags/basePage.cfm">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="product.cfm">myApp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      </ul>
      <form class="d-flex">
      	<button class="btn btn-primary" type="submit">Download <i class="fas fa-file-download"></i></button>
        <button class="btn btn-danger" type="submit">logout <i class="fas fa-sign-out-alt"></i></button>
      </form>
    </div>
  </div>
</nav>
<cfdocument format="PDF">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<style type="text/css">
	html,body{
		margin: 0;
		padding: 0;
		background: lightblue;
		color: black;
	}
	.main-frame{
		padding: 30px;
	}
	.center-text{
		text-align: center;
		font-family: 'Akaya Telivigala', cursive;
	}
	.left{
		text-align: left;
	}
	.details{
		background: pink;
	}
</style>
<cfset local.productData = createObject('component', 'components.getProductDetails').getProductByID(2)>
<div class="container-fluid">
	<div class="main-frame">
	<div class="center-text">
		<h1><u>
			<cfoutput>
				#local.productData.FLD_PRODUCTNAME#
			</cfoutput>
		</u></h1>
	</div>
	<br>
	<br>
	<div class="left">
		<cfoutput>
			Product ID: #local.productData.FLD_PRODUCTID#
		</cfoutput>
	</div>
	<br>
	<div class="center-text details">
		<h4>
			<cfoutput>
				#local.productData.FLD_PRODUCTDETAILS#
			</cfoutput>
		</h4>
	</div>
	<br><br>
	<div class="left">
		<cfoutput>
			<small><b>created by: </b>#local.productData.FLD_PRODUCTCREATOR#</small>
			<br>
			<small><b>created on: </b>#left("#local.productData.FLD_PRODUCTCREATIONTIME#",19)#</small>
		</cfoutput>
	</div>
	</div>
</div>
</cfdocument>
</cfmodule>