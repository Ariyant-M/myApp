<cfmodule template="customTags/basePage.cfm" title = "Sign Up">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.cfm">myApp</a>
	    </div>
	</nav>
	<div class="container">
		<div class="row">
        	<div class="col"></div>
        	<div class="col-6">
        		<p style="color: red;">all fields are required</p>
			<form id="signUpForm">
				<div>
				<label for="UserFirstName" class="form-label">First Name</label>
				<input type="text" class="form-control" id="UserFirstName" name="UserFirstName" required="true">
				<div id="fNameError" class="hiddenError colorRed"><small>Invalid Input</small></div>
				</div>
				<div>
				<label for="UserLastName" class="form-label">Last Name</label>
				<input type="text" class="form-control" id="UserLastName" name="UserLastName" required="true">
				<div id="lNameError" class="hiddenError colorRed"><small>Invalid Input</small></div>
				</div>
				<div>
				<label for="UserMail" class="form-label">Email</label>
				<input type="email" class="form-control" id="UserMail" name="UserMail" required="true">
				<div id="emailError" class="hiddenError colorRed"><small>Invalid Input</small></div>
				</div>
				<div>
				<label for="UserPass" class="form-label">Password</label>
				<input type="password" class="form-control" id="UserPass" name="UserPass" required="true" pattern=".{6,}">
				<small>length must be more then 5, at least one letter, one number and one special character</small>
				<div id="passError" class="hiddenError colorRed"><small>Invalid Input</small></div>
				</div>
				<div>
				<label for="UserPassCon" class="form-label">Confirm Password</label>
				<input type="password" class="form-control" id="UserPassCon" name="UserPassCon" required="true" pattern=".{6,}">
				<div id="conPassError" class="hiddenError colorRed"></div>
				</div>
				<br>
				<button class="btn btn-outline-primary" id="addNewUser" name="addNewUser">Submit</button>
			</form>
		</div>
	<div class="col"></div>
	</div>
	</div>
	<script src="JavaScript/newUser.js"></script>
</cfmodule>