$(document).ready(function () {
  $("#change").click(function () {
    var productNamejs = $("#productName").val();
    var productDetailsjs = $("#productDetails").val();
    var urlParams = new URLSearchParams(window.location.search);
    var productIDjs = urlParams.get("productID");
    $.ajax({
      type: "POST",
      url: "update.cfc",
      data: {
        method: "edit",
        productID: productIDjs,
        productName: productNamejs,
        productDetails: productDetailsjs,
      },
      success: function (data) {
        window.location = "product.cfm";
        
      },
    });
  });
});
