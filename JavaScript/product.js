$(document).ready(function () {
  $("#editProduct").click(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var productID = urlParams.get("productID");
    window.location = "editProduct.cfm?productID=" + productID;
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
        } else if (data == "false"){
          alert("failed to delete");
        } else{
          window.location = "errorPage.html";
        }
      },
      error: function (xhr, textStatus, errorThrown){
        console.log(errorThrown); 
      }
    });
  });
  
  $("#addNewProduct").click(function() {
    event.preventDefault();
    var newProductNamejs = $("#newProductName").val().trim();
    var newProductDetailsjs = $("#newProductDetails").val().trim();
    if(newProductNamejs != '' && newProductDetailsjs != ''){
      $.ajax({
        type: "POST",
        url: "components/updateProductDetails.cfc",
        data: { method: "addNewProduct", 
                newProductName: newProductNamejs,
                newProductDetails: newProductDetailsjs,
              },
        success: function (newData) {
          if(newData == "true"){
            alert("data added");
            window.location = "product.cfm";
          } else if (newData == "false") {
            alert("failed to add new data..");
          } else {
            window.location = "errorPage.html";
          }
        },
        error: function (xhr, textStatus, errorThrown){
          console.log(errorThrown); 
        }
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
        } else if (data == "false") {
          alert("logout failed..");
        } else {
          window.location = "errorPage.html";
        }
      },
      error: function (xhr, textStatus, errorThrown){
        console.log(errorThrown); 
      }
    });
  });

  $("#ExportPDF").click(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var productID = urlParams.get("productID");
    window.open("ExportAsPDF.cfm?productID=" + productID,'_blank');
  });

  $("#ExportExcel").click(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var productID = urlParams.get("productID");
    window.open("exportAsExcel.cfm?productID=" + productID,'_blank');
  });
  $("#addNew").click(function() {
    window.location = "newProduct.cfm";
  });
  $("#adminPanel").click(function() {
    window.location = "adminPanel.cfm";
  });
  $("#confirm").attr("data-bs-dismiss", "modal");
  $("#applyFilter").click(function() {
    var startDate = $("#start-date").val();
    var endDate = $("#end-date").val();
    var keyword = $("#filterKeywords").val();
    var url = "product.cfm?startdate="+startDate+"&enddate="+endDate+"&keyword="+keyword;
    window.location = url;
  });
});
function showDate() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1;
  var yyyy = today.getFullYear();

  if(dd<10) {
      dd = '0'+dd;
  } 

  if(mm<10) {
      mm = '0'+mm;
  } 

  today = yyyy + '-' + mm + '-' + dd;
  $("#end-date").attr("value", today);
}


window.onload = function() {
  showDate();
};