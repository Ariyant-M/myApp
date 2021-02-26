$(document).ready(function () {
	$("#contactUS").click(function() {
		window.location = "contactUs.cfm";
	});
});
function addFeedBack() {
	event.preventDefault();
	var emailAddess = $("#senderEmail").val();
	var emailMessage = $("#emailBody").val();
	var emailHeader = "message";
	if(emailAddess != '' && emailMessage != ''){
		$.ajax({
          type: "POST",
          url: "components/userFeedBack.cfc",
          data: {
            method: "addFeedBack",
            userEmail: emailAddess,
            subject: emailHeader,
            message: emailMessage,
          },
          success: function (data) {
          	alert(data);
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
};