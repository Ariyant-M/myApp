function acceptProduct(a){
	var productIDjs = $(a).parents("tr").attr('id');
	$.ajax({
	    type: "POST",
	    url: "components/updateProductDetails.cfc",
	    data: {
	      method: "acceptProductByAdmin",
	      productID: productIDjs,
	    },
	    success: function (data) {
	      if(data == "true")
	      {
	        alert("Successful");
	        $(a).parents("tr").remove();
	      } else if (data == "false"){
	        alert("failed");
	      } else{
	        window.location = "errorPage.html";
	      }
	    },
	    error: function (xhr, textStatus, errorThrown){
	      console.log(errorThrown); 
	    }
	});
}
function rejectProduct(a){
	var productIDjs = $(a).parents("tr").attr('id');
	$.ajax({
	    type: "POST",
	    url: "components/updateProductDetails.cfc",
	    data: {
	      method: "rejectProductByAdmin",
	      productID: productIDjs,
	    },
	    success: function (data) {
	      if(data == "true")
	      {
	        alert("Successful");
	        $(a).parents("tr").remove();
	      } else if (data == "false"){
	        alert("failed");
	      } else{
	        window.location = "errorPage.html";
	      }
	    },
	    error: function (xhr, textStatus, errorThrown){
	      console.log(errorThrown); 
	    }
	});
}

function toProductValidation(){
	window.location = "adminProductValidation.cfm";
}
function viewFeedback(){
	window.location = "viewFeedback.cfm";
}
$("#adminPanel").click(function() {
	window.location = "adminPanel.cfm";
});
function getRowID(obj){
	currentObj = obj;
	feedbackID = $(obj).parents("tr").attr('id');
	userMail = document.querySelector("#\\3"+feedbackID+  "> td:nth-child(2)").textContent;
	$("#userMail").val(userMail);
}
function replyToFeedback(){
	var mailSubject = $("#responseSubject").val();
	var mailBody = $("#responseMessage").val();
	if(mailSubject != '' && mailBody != ''){
		$.ajax({
		    type: "POST",
		    url: "components/mailServices.cfc",
		    data: {
		      method: "sendMail",
		      mailTo: userMail,
		      mailSubject: mailSubject,
		      mailBody: mailBody,
		    },
		    success: function (data) {
		      if(data == "true")
		      {
		        alert("mail sent successfully");
		        $('#responseToFeedback').modal('toggle');
		        return true;
		      } else if (data == "false"){
		        alert("failed");
		        return false;
		      } else{
		        window.location = "errorPage.html";
		        return false;
		      }
		    },
		    error: function (xhr, textStatus, errorThrown){
		      console.log(errorThrown); 
		    }
		});
	}else{
		alert("fileld can not be empty..");
	}
}

function deleteFeedback(obj){
	var feedbackID = $(obj).parents("tr").attr('id');
	$.ajax({
	    type: "POST",
	    url: "components/userFeedBack.cfc",
	    data: {
	      method: "deleteFeedback",
	      feedbackID: feedbackID,
	    },
	    success: function (data) {
	      if(data == "true")
	      {
	        $(obj).parents("tr").remove();
	      } else if (data == "false"){
	        alert("failed");
	      } else{
	        window.location = "errorPage.html";
	      }
	    },
	    error: function (xhr, textStatus, errorThrown){
	      console.log(errorThrown); 
	    }
	});
}