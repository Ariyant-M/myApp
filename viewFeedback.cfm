<cfmodule template="customTags/loginValidation.cfm" />
<cfmodule template="customTags/adminValidation.cfm" />
<cfmodule template="customTags/basePage.cfm" title = "adminPanel">
	<cfmodule template="customTags/defaultLoggedINNav.cfm">
		<button type="button" class="btn btn-outline-primary" id="adminPanel">
			Admin Panel <i class="fas fa-user-cog"></i>
		</button>
	</cfmodule>
	<div class="container" id="feedbackContainer">
		<cfset local.feedbackQuery = createObject("component", "components.userFeedBack").showFeedback()>
		<table class="table table-sm table-dark">
		  <div class="table-responsive">
		    <table class="table align-middle table-hover table-striped">
		      <thead>
		        <tr>
		          <th scope="col">#</th>
			      <th scope="col">Email</th>
			      <th scope="col">Subject</th>
			      <th scope="col">Message</th>
			      <th scope="col">Time</th>
			      <th scope="col">Respose</th>
			    </tr>
		      </thead>
		      <tbody>
		      	<cfset rowcount =1 >
		      	<cfoutput query="local.feedbackQuery">
		        <tr id="#FLD_FEEDBACKID#">
		          <th scope="row">#rowcount#</th>
			      <td>#FLD_USERMAIL#</td>
			      <td>#FLD_SUBJECT#</td>
			      <td>#FLD_MESSAGE#</td>
			      <td>#left("#FLD_TIMESTAMP#",19)#</td>
			      <td>
			      	<button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target= "##responseToFeedback" onclick ="getRowID(this);" style="width: 70px;">
			      		<i class="fas fa-reply"></i>
			      	</button>
			      	<button class="btn btn-outline-danger" onclick="deleteFeedback(this);" style="width: 70px;">
			      		<i class="far fa-trash-alt"></i>
			      	</button>
			      </td>
		        </tr>
		        <cfset rowcount++>
		    	</cfoutput>
		      </tbody>
		    </table>
		</table>
	</div>
	<!--- modal for send mail to user --->
	<div class="modal fade" id="responseToFeedback" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Mail</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<label>Mail to</label>
		        <input type="text" name="userMail" class="form-control" id="userMail" disabled>
				<label for="responseMessage" class="form-label">Mail Subject</label>
		        <input type="text" name="responseSubject" class="form-control" id="responseSubject">
				<label for="responseMessage" class="form-label">Mail Body</label>
				<textarea class="form-control" name="responseMessage" id="responseMessage" required="true" rows="3"></textarea>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-outline-success" onclick="replyToFeedback();">
		        	Send <i class="fas fa-paper-plane"></i>
		        </button>
		        <button type="button" class="btn btn-outline-warning" data-bs-dismiss="modal">
		        	Cancel <i class="fas fa-times"></i>
		        </button>
		      </div>
		    </div>
		  </div>
		</div>
	  </div>
	<script type="text/javascript" src="JavaScript/admin.js"></script>
</cfmodule>