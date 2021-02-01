$(document).ready(function () {

  $("#editProduct").click(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var productID = urlParams.get("productID");
    window.location = "edit.cfm?productID=" + productID;
  });

  $("#confirmDelete").click(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var productID = urlParams.get("productID");
    $.ajax({
      type: "POST",
      url: "update.cfc",
      data: { method: "delete", productID: productID },
      success: function (data) {
        alert("data deleted..");
        window.location = "product.cfm";
      },
    });
  });
  $("#logout").click(function () {
    $.ajax({
      type: "POST",
      url: "components/authentication.cfc",
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
    $("#confirm").attr("data-bs-dismiss", "modal");
});