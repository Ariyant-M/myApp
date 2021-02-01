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
      url: "components/updateProductDetails.cfc",
      data: { method: "deleteProduct", productID: productID },
      success: function (data) {
        if(data == "true"){
          alert("data deleted..");
          window.location = "product.cfm";
        }
        else{
          alert("failed to delete");
        }
      },
    });
  });
  
  $("#addNewProduct").click(function() {
    var newProductNamejs = $("#newProductName").val();
    var newProductDetailsjs = $("#newProductDetails").val();
    if(newProductNamejs != '' && newProductDetailsjs != ''){
      $.ajax({
        type: "POST",
        url: "components/updateProductDetails.cfc",
        data: { method: "addNewProduct", 
                newProductName: newProductNamejs,
                newProductDetails: newProductDetailsjs,
              },
        success: function (newData) {
          alert(newData);
          if(newData == "true"){
            alert("data added");
            window.location = "product.cfm";
          }
          else{
            alert("failed to add new data..");
          }
        },
      });
    }
    else{
      alert("fields can not be empty");
    }
  });
  $("#logout").click(function () {
    $.ajax({
      type: "POST",
      url: "components/authentication.cfc",
      data: { method: "doLogout" },
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