$(document).ready(function() {	
	$.ajax({
				type:"GET",
				url: "../../../controller/adminController.cfc?method=farmerDetails&ReturnFormat=json",
				cache:false,
				success : function(data)
				{	
					jsonOBJ = jQuery.parseJSON(data);
					for (var key in jsonOBJ) {
						console.log(jsonOBJ[key]);
					}
				}							
			}).fail(function(jqXHR , textStatus )
				{
						alert('your message');	
				}); 
    $('#example').DataTable( {
            "bJQueryUI": true,
        "bProcessing": true,
    "bServerSide": false,
    "sAjaxSource": "../../../controller/adminController.cfc?method=farmerDetails",
    "aoColumns": [
		{ "mData": "UserType" },
         { "mData": "UserName" },
         { "mData": "UserEmail" },
		 { "mData": "UserAddress" },
		 { "mData": "UserNumber" },
		 { "mData": "UserRating" },
		 { "mData": "ActionBtn" }
    ]

    } );
});