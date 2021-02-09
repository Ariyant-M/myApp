$(document).ready(function () {
	$("#contactUS").click(function() {
		window.location = "contactUs.cfm";
	});
	$("#sendMail").click(function() {
		event.preventDefault();
		var emailAddess = $("#senderEmail").val();
		var emailMessage = $("#emailBody").val();
		var emailHeader = "message";
		if(emailAddess != '' && emailMessage != ''){
			$.ajax({
	          type: "POST",
	          url: "components/mail.cfc",
	          data: {
	            method: "sendMail",
	            mailFrom: emailAddess,
	            mailSubject: emailHeader,
	            mailBody: emailMessage,
	          },
	          success: function (data) {
	            if (data == "true") {
	                alert("Thank you for your concern.");
	                window.location = "product.cfm";
	            }
	            else{
	            	alert("sorry.. unable to send mail.");
	            	window.location = "product.cfm";
	            }
	          },
	        });
		}else{
			alert("filed can not be empty..");
		}
	});
});