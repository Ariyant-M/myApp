<cfmodule template="customTags/basePage.cfm">
		<cfif structKeyExists(session,'LoggedUser')>
    		<cflocation url="product.cfm">
    	<cfelse>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand">myApp</a>
		         <div class="d-flex">
		           <button class="btn btn-primary" id="registration">Sign Up <i class="fas fa-user-plus"></i></button>
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
		              <button class="btn btn-primary" value="submit" name="fld_submitLogin" id="fld_submitLogin" >Submit</button>
		            </fieldset>
		          </form>
		        </div>
		        <div class="col"></div>
		      </div>
		    </div>
		</cfif>
		<script src="JavaScript/authentication.js"></script>
</cfmodule>