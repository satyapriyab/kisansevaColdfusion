/**
* File: adminController.cfc
* Author: Satyapriya Baral
* Path: controller/adminController.cfc
* Purpose: contains all for admin screen.
* Date: 01-05-2017
*/
component {
	
	userObject = CreateObject("component", "model.userModel");
	error = CreateObject("component", "log.error");
	
	/**
    * Function to get all data of users.
    *
    * @param null
    * @return - Returns user data to the ajax call.
    */
	function userDetails() access="remote"
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
		{
			"aaData":
			#serializeJSON(data)#
        }');
		enablecfoutputonly="No" ;
		showdebugoutput="No";
	}
	
	/**
    * Function to update the status of user.
    *
    * @param int userId - contains the id of the user.
	* @param string ststus - contains the ststus of user.
    * @return - null.
    */
	public void function statusUpdate(string userId, string status)
	{
		if (ARGUMENTS.status EQ 1) {
			LOCAL.status = 0;
		} else {
			LOCAL.status = 1;
		}
		var LOCAL.userDetails = userObject.update(LOCAL.status, ARGUMENTS.userId, "UserIsActive", "UserId");
	}

}