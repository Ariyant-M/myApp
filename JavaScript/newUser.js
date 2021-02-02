$(document).ready(function () {
	var fldError = true;
    $("#UserFirstName").focusout(function(){
    	var pattern = /^[A-Za-z]+$/;
    	var fName = $("#UserFirstName").val().trim();

    	if(fName == '' ){
    		$("#fNameError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else if(pattern.test(fName) == false){
    		$("#fNameError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else{
    		$("#fNameError").addClass("hiddenError");
    		fldError = false;
    	}
    });

    $("#UserLastName").focusout(function(){
    	var pattern = /^[A-Za-z]+$/;
    	var lName = $("#UserLastName").val().trim();

    	if(lName == '' ){
    		$("#lNameError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else if(pattern.test(lName) == false){
    		$("#lNameError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else{
    		$("#lNameError").addClass("hiddenError");
    		fldError = false;
    	}
    });

    $("#UserMail").focusout(function(){
    	var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    	var userEmail = $("#UserMail").val().trim();

    	if(userEmail == '' ){
    		$("#emailError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else if(pattern.test(userEmail) == false){
    		$("#emailError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else{
    		$("#emailError").addClass("hiddenError");
    		fldError = false;
    	}
    });

    $("#UserPass").focusout(function(){
    	var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}/;
    	userPass = $("#UserPass").val().trim();

    	if(userPass == '' ){
    		$("#passError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else if(pattern.test(userPass) == false){
    		$("#passError").removeClass("hiddenError");
    		fldError = true;
    	}
    	else{
    		$("#passError").addClass("hiddenError");
    		fldError = false;
    	}
    });

    $("#UserPassCon").focusout(function(){
    	var conUserPass = $("#UserPassCon").val().trim();

    	if(conUserPass == '' ){
    		$("#conPassError").removeClass("hiddenError");
    		fldError = true;
    		$("#conPassError").text("invalid input");
    	}
    	else if(conUserPass != userPass){
    		$("#conPassError").removeClass("hiddenError");
    		fldError = true;
    		$("#conPassError").text("password doesn't match");
    	}
    	else{
    		$("#conPassError").addClass("hiddenError");
    		fldError = false;
    	}
    });

    $("#addNewUser").click(function() {
    	event.preventDefault();
    	var fName = $("#UserFirstName").val().trim();
    	var lName = $("#UserLastName").val().trim();
    	var userEmailID = $("#UserMail").val().trim();
    	var userPass = $("#UserPass").val().trim();
    	var conUserPass = $("#UserPassCon").val().trim();
    	if(fldError == true){
    		alert('fields can not be empty');
    	}
    	else if(fName == '' && lName == '' && userEmailID == '' && userPass == '' && conUserPass == ''){
    		alert('fields can not be empty');
    	}
    	else{
    		alert("in else");
    		// $.ajax({
		    //   type: "POST",
		    //   url: "components/authentication.cfc",
		    //   data: {
		    //     method: "checkEmailExist",
		    //     checkEmail: userEmailID,
		    //   },
		    //   success: function (data) {
		    //     if (data == "true") {
		    //     	$.ajax({
				  //     type: "POST",
				  //     url: "components/authentication.cfc",
				  //     data: {
				  //       method: "addUser",
				  //       firstName: fName,
				  //       lastName: lName,
				  //       userEmail: userEmailID,
				  //       userPwd: userPass,
				  //     },
				  //     success: function (data) {
				  //       if (data == "true") {
				  //       	alert("user added")
				  //         	window.location = "index.cfm";
				  //       } else {
				  //         alert("failed to add user..");
				  //       }
				  //     },
				  //   });
		    //     } else {
		    //       alert("email already exist.");
		    //     }
		    //   },
		    // });
    	}
    });
});