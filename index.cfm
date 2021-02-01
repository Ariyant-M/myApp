<!---validate user from database--->
<!---<cfif structKeyExists(form,"fld_submitLogin")>
	<cfquery datasource="myAppDB" name="op">
		SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL
		FROM TBL_USERS
		WHERE FLD_USEREMAIL = "#form.fld_userEmail#" AND FLD_USERPASSWORD = "#form.fld_userPassword#"
	</cfquery>
	<cfif op.recordCount EQ 1>
		<cflock timeout= "2" scope="Session">
			<cfset session.LoggedUser = {firstName = "#op.FLD_USERFIRSTNAME#", lastName = "#op.FLD_USERLASTNAME#", userID = "#op.FLD_USERID#" }>
		</cflock>
		<cflocation url="http://127.0.0.1:8500/myApp/product.cfm">

	<cfelse>

		<cfset errorLogin = "invalid credentials">
	</cfif>

</cfif>--->
<!--- <cfset checkLogin = loggedUser.doLogin(form.)> --->
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>myApp</title>
		<!--- css style link --->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		<!---bootstrap CDN--->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
		<script src="./JavaScript/login.js"></script>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand">myApp</a>
		      <div class="d-flex">
		        <button class="btn btn-primary" id="registration" onclick = "regFunction()">Sign Up <i class="fas fa-user-plus"></i></button>
		      </div>
		    </div>
		</nav>
    <div class="container">
      <div class="row">
        <div class="col"></div>
        <div class="col-6">
          <form id="loginForm" method="post">
            <fieldset>
              <legend>Login</legend>

			    <!---if user is alerady logged in--->
			    <cfif structKeyExists(session,'LoggedUser')>
		    	<cflocation url="product.cfm">
		    	<cfelse>
              <div class="mb-3">
                <label for="fld_userEmail" class="form-label">
                  Email address
                </label>
                <input
                  type="email"
                  class="form-control"
                  id="fld_userEmail"
				  name="fld_userEmail"
				  required= "true"
                />
              </div>
              <div class="mb-3">
                <label for="pwd" class="form-label">
                  Password
                </label>

                <input
                  type="password"
                  class="form-control"
                  id="fld_userPassword"
				  name="fld_userPassword"
				  required= "true"
				  pattern = ".{6,}"
				  title="Eight or more characters"
                />
				<small>much be more then 5 letter</small>
              </div>
              <button class="btn btn-primary" value="submit" name="fld_submitLogin" id="fld_submitLogin" onclick="doLogin();">Submit</button>
            </fieldset>
			</cfif>
          </form>
        </div>
        <div class="col"></div>
      </div>
    </div>
	
	</body>
</html>
