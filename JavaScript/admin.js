function acceptProduct(a){
	var productIDjs = $(a).parents("tr").attr('id');
	$.ajax({
	    type: "POST",
	    url: "components/updateProductDetails.cfc",
	    data: {
	      method: "acceptProductByAdmin",
	      productID: productIDjs,
	    },
	    success: function (data) {
	      if(data == "true")
	      {
	        alert("Successful");
	        $(a).parents("tr").remove();
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
function rejectProduct(a){
	var productIDjs = $(a).parents("tr").attr('id');
	$.ajax({
	    type: "POST",
	    url: "components/updateProductDetails.cfc",
	    data: {
	      method: "rejectProductByAdmin",
	      productID: productIDjs,
	    },
	    success: function (data) {
	      if(data == "true")
	      {
	        alert("Successful");
	        $(a).parents("tr").remove();
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

function toProductValidation(){
	window.location = "adminProductValidation.cfm";
}