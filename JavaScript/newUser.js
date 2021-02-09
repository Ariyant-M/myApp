$(document).ready(function () {
	var fldError = [5];
    $("#UserFirstName").focusout(function(){
    	var pattern = /^[A-Za-z]+$/;
    	var fName = $("#UserFirstName").val().trim();

    	if(fName == '' ){
    		$("#fNameError").removeClass("hiddenError");
    		fldError[0] = true;
    	}
    	else if(pattern.test(fName) == false){
    		$("#fNameError").removeClass("hiddenError");
    		fldError[0] = true;
    	}
    	else{
    		$("#fNameError").addClass("hiddenError");
    		fldError[0] = false;
    	}
    });

    $("#UserLastName").focusout(function(){
    	var pattern = /^[A-Za-z]+$/;
    	var lName = $("#UserLastName").val().trim();

    	if(lName == '' ){
    		$("#lNameError").removeClass("hiddenError");
    		fldError[1] = true;
    	}
    	else if(pattern.test(lName) == false){
    		$("#lNameError").removeClass("hiddenError");
    		fldError[1] = true;
    	}
    	else{
    		$("#lNameError").addClass("hiddenError");
    		fldError[1] = false;
    	}
    });

    $("#UserMail").focusout(function(){
    	var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    	var userEmail = $("#UserMail").val().trim();

    	if(userEmail == '' ){
    		$("#emailError").removeClass("hiddenError");
    		fldError[2] = true;
    	}
    	else if(pattern.test(userEmail) == false){
    		$("#emailError").removeClass("hiddenError");
    		fldError[2] = true;
    	}
    	else{
    		$("#emailError").addClass("hiddenError");
    		fldError[2] = false;
    	}
    });

    $("#UserPass").focusout(function(){
    	var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}/;
    	userPass = $("#UserPass").val().trim();

    	if(userPass == '' ){
    		$("#passError").removeClass("hiddenError");
    		fldError[3] = true;
    	}
    	else if(pattern.test(userPass) == false){
    		$("#passError").removeClass("hiddenError");
    		fldError[3] = true;
    	}
    	else{
    		$("#passError").addClass("hiddenError");
    		fldError[3] = false;
    	}
    });

    $("#UserPassCon").focusout(function(){
    	var conUserPass = $("#UserPassCon").val().trim();

    	if(conUserPass == '' ){
    		$("#conPassError").removeClass("hiddenError");
    		fldError[4] = true;
    		$("#conPassError").text("invalid input");
    	}
    	else if(conUserPass != userPass){
    		$("#conPassError").removeClass("hiddenError");
    		fldError[4] = true;
    		$("#conPassError").text("password doesn't match");
    	}
    	else{
    		$("#conPassError").addClass("hiddenError");
    		fldError[4] = false;
    	}
    });

    $("#addNewUser").click(function() {
    	event.preventDefault();
    	var fName = $("#UserFirstName").val().trim();
    	var lName = $("#UserLastName").val().trim();
    	var userEmailID = $("#UserMail").val().trim();
    	var userPass = $("#UserPass").val().trim();
    	var conUserPass = $("#UserPassCon").val().trim();
    	if(jQuery.inArray(true, fldError) !== -1){
    		alert('please fill the form properly');
    	}
    	else if(fName != '' && lName != '' && userEmailID != '' && userPass != '' && conUserPass != ''){
            $.ajax({
              type: "POST",
              url: "components/authentication.cfc",
              data: {
                method: "checkEmailExist",
                checkEmail: userEmailID,
              },
              success: function (data) {
                if (data == "true") {
                  alert("email already exist.");
                } else if (data == "false") {
                    $.ajax({
                      type: "POST",
                      url: "components/authentication.cfc",
                      data: {
                        method: "addUser",
                        firstName: fName,
                        lastName: lName,
                        userEmail: userEmailID,
                        userPwd: userPass,
                      },
                      success: function (data) {
                        if (data == "true") {
                            $.ajax({
                              type: "POST",
                              url: "components/mail.cfc",
                              data: {
                                method: "sendMail",
                                mailTo: userEmailID,
                              },
                              success: function (data) {
                                if (data == "true") {
                                    alert("User Added");
                                }
                              },
                            });
                            window.location = "index.cfm";
                        } else if (data == "false") {
                          alert("failed to add user..");
                        }
                        else{
                          window.location = "errorPage.html";
                        }
                      },
                      error: function (xhr, textStatus, errorThrown){
                        console.log(errorThrown); 
                      }
                    });
                } else{
                  window.location = "errorPage.html";
                }
              },
              error: function (xhr, textStatus, errorThrown){
                console.log(errorThrown); 
              }
            });
    	}
    	else{
            alert('fields can not be empty');
    		
    	}
    });
});