<!DOCTYPE html>
<html>
<head>
	<title>Add User</title>
	<!--- css style link --->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!---bootstrap CDN--->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.cfm">myApp</a>
	    </div>
	</nav>
	<div class="container">
		<div class="row">
        	<div class="col"></div>
        	<div class="col-6">
			<form>
				<div>
				<label for="UserFirstName" class="form-label">First Name</label>
				<input type="email" class="form-control" id="UserFirstName" name="UserFirstName" required="true">
				</div>
				<div>
				<label for="UserLastName" class="form-label">Last Name</label>
				<input type="email" class="form-control" id="UserLastName" name="UserLastName" required="true">
				</div>
				<div>
				<label for="UserMail" class="form-label">Email</label>
				<input type="email" class="form-control" id="UserMail" name="UserMail" required="true">
				</div>
				<div>
				<label for="UserPass" class="form-label">Password</label>
				<input type="password" class="form-control" id="UserPass" name="UserPass" required="true" pattern=".{6,}">
				<small>much be more then 5 letter</small>
				</div>
				<div>
				<label for="UserPassCon" class="form-label">Confirm Password</label>
				<input type="password" class="form-control" id="UserPassCon" name="UserPassCon" required="true" pattern=".{6,}">
				</div>
				<br>
				<button class="btn btn-primary" id="addNew" name="addNew">Submit</button>
			</form>
		</div>
	<div class="col"></div>
	</div>
</body>
</html>