$(document).ready(function () {
  $("#fld_submitLogin").click(function () {
    event.preventDefault();
    var useremailjs = $("#fld_userEmail").val().trim();
    var userPasswordjs = $("#fld_userPassword").val();
    $.ajax({
      type: "GET",
      url: "components/authentication.cfc",
      data: {
        method: "doLogin",
        fld_useremail: useremailjs,
        fld_userpassword: userPasswordjs,
      },
      success: function (data) {
        if (data == "true") {
          window.location = "product.cfm";
        } else {
          alert("invalid user details..");
        }
      },
    });
  });
  $("#logout").click(function () {
    $.ajax({
      type: "POST",
      url: "authentication.cfc",
      data: { method: "doLogout" },
      datatype: "json",
      success: function (data) {
        console.log(data);
        if (data == "true") {
          window.location = "index.cfm";
        } else {
          alert("logout failed..");
        }
      },
    });
  });
  $("#registration").click(function() {
    window.location = "newUser.cfm";
  });
});