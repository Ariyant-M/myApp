<!DOCTYPE html>
<html>
<head>
	<title>Contact Us</title>
	<link rel="stylesheet" href="../myApp/CSS/style.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!---bootstrap CDN--->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="JavaScript/jquery-3.5.1.js"></script>
	<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
	<script src="JavaScript/authentication.js"></script>
	<script src="JavaScript/contactUs.js"></script>
</head>
<body>
	<cfif isDefined("session.LoggedUser")>
		<cfmodule template="customTags/defaultLoggedINNav.cfm">
		</cfmodule>
	<cfelse>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.cfm">myApp</a>
		      <div class="d-flex">
		        <button class="btn btn-outline-primary" id="registration">Sign Up <i class="fas fa-user-plus"></i></button>
		      </div>
		    </div>
		</nav>
	</cfif> 
	<cfform>
	<div class="row">
		<div class="col"></div>
		<div class="col-6">
			<cfif isDefined("session.LoggedUser")>
				<div class="mb-3">
				  <label for="senderEmail" class="form-label">Email address</label>
				  <cfinput type="email" class="form-control" name="senderEmail" id="senderEmail" value = "#session.LoggedUser.USEREMAIL#" disabled>
				</div>
			<cfelse>
				<div class="mb-3">
				  <label for="senderEmail" class="form-label">Email address</label>
				  <input type="email" class="form-control" name="senderEmail" id="senderEmail" required="true" placeholder="Your email">
				</div>
			</cfif>
			<div class="mb-3">
			  <label for="feedbackSubject" class="form-label">Subject</label>
			  <input type="email" class="form-control" name="feedbackSubject" id="feedbackSubject" required="true" >
			</div>
			<div class="mb-3">
			  <label for="emailBody" class="form-label">Message</label>
			  <textarea class="form-control" name="emailBody" id="emailBody" required="true" rows="3"></textarea>
			</div>
			<button class="btn btn-outline-primary" onclick="addFeedBack();">Send <i class="fas fa-paper-plane"></i></button>
		</div>
		<div class="col"></div>
	</div>
	</cfform>
</body>
</html>