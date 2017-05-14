/**
* File: userController.cfc
* Author: Satyapriya Baral
* Path: model/userController.cfc
* Purpose: contains functions for login and registration.
* Date: 01-05-2017
*/
component {
	
	userObject = CreateObject("component", "model.userModel");
	error = CreateObject("component", "log.error");
	
	/**
    * Function to check user details entered and login user.
    *
    * @param string $email - contains email of the user.
    * @param string $password - contains passwoed of the user.
    * @return - Returns to the homepage or returns error.
    */
	function farmerDetails() access="remote"
	{
		var LOCAL.userDetails = userObject.userDetails();
		var LOCAL.farmerDetails = ArrayNew(1);
		var data = [];
		for(i=1 ; i <= LOCAL.userDetails.getResult().recordcount ; i++) {
			if(LOCAL.userDetails.getResult().UserIsActive[i] NEQ 1){
			 var LOCAL.action = "<Button class='label label-danger glyphicon glyphicon-remove-sign' onclick=window.location='../../view/admin/userData.cfm?status=#LOCAL.userDetails.getResult().UserIsActive[i]#&userId=#LOCAL.userDetails.getResult().UserId[i]#'>Disable</Button>";
			} else {
				var LOCAL.action = "<Button class='label label-success' onclick=window.location='../../view/admin/userData.cfm?status=#LOCAL.userDetails.getResult().UserIsActive[i]#&userId=#LOCAL.userDetails.getResult().UserId[i]#'>Enable</Button>";
			}
			if(LOCAL.userDetails.getResult().UserTypeId[i] EQ 2) {
			 var LOCAL.type = "Farmer";
			} else if(LOCAL.userDetails.getResult().UserTypeId[i] EQ 3) {
				var LOCAL.type = "Dealer";
			}
			if(LOCAL.userDetails.getResult().UserTypeId[i] NEQ 1) {
			obj = {
				"UserType" = "#LOCAL.type#",
				"UserName" = "#LOCAL.userDetails.getResult().UserName[i]#",
				"UserEmail" = "#LOCAL.userDetails.getResult().UserEmail[i]#",
				"UserAddress" = "#LOCAL.userDetails.getResult().UserAddress[i]#",
				"UserNumber" = "#LOCAL.userDetails.getResult().UserNumber[i]#",
				"UserRating" = "#LOCAL.userDetails.getResult().UserRating[i]#",
					"ActionBtn" = "#LOCAL.action#"
				
				
			};
			

			arrayAppend(data, obj);
			}
		}
		
	

	suppresswhitespace="Yes";
    WriteOutput('
        {"aaData":
        #serializeJSON(data)#
        }'
    );

 enablecfoutputonly="No" ;
 showdebugoutput="No";
		
	}
	
	public any function statusUpdate(string userId, string status)
	{
		if (ARGUMENTS.status EQ 1) {
			LOCAL.status = 0;
		} else {
			LOCAL.status = 1;
		}
		var LOCAL.userDetails = userObject.update(LOCAL.status, ARGUMENTS.userId, "UserIsActive", "UserId");
	}

}