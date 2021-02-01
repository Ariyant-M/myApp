$(document).ready(function () {
  $("#confirmEdit").click(function () {
    var productNamejs = $("#productName").val();
    var productDetailsjs = $("#productDetails").val();
    var urlParams = new URLSearchParams(window.location.search);
    var productIDjs = parseInt(urlParams.get("productID"));
    if(productNamejs != '' && productDetailsjs != ''){
      $.ajax({
        type: "get",
        url: "components/updateProductDetails.cfc",
        data: {
          method: "editProduct",
          productID: productIDjs,
          productName: productNamejs,
          productDetails: productDetailsjs,
        },
        success: function (data) {
          alert(data);
          if(data == "true")
          {
            alert("updation successful");
            window.location = "product.cfm";
          }
          else{
            alert("updation failed");
          }
        },
      });
  }
  else{
    alert("field can not be empty..")
  }
  });
});
