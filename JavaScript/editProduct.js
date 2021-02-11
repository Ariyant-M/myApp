$(document).ready(function () {
  $("#confirmEdit").click(function () {
    event.preventDefault();
    var productNamejs = $("#productName").val().trim();
    var productDetailsjs = $("#productDetails").val().trim();
    var urlParams = new URLSearchParams(window.location.search);
    var productIDjs = parseInt(urlParams.get("productID"));
    if(productNamejs != '' && productDetailsjs != ''){
      $.ajax({
            type: "POST",
            url: "components/updateProductDetails.cfc",
            data: {
              method: "editProduct",
              productID: productIDjs,
              productName: productNamejs,
              productDetails: productDetailsjs,
            },
            success: function (data) {
              if(data == "true")
              {
                $.ajax({
                  type: "POST",
                  url: "components/getProductDetails.cfc",
                  data: { method: "getAllProduct", 
                        },
                  success: function(data){
                    alert("updation successful");
                    window.location = "product.cfm";
                  }
                });
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
  else{
    alert("field can not be empty..")
  }
  });
});
