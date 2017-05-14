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
		for(i=1 ; i <= LOCAL.userDetails.getResult().recordcount ; i++) {

		}
		var data = [];
		obj = {
        "RecordID" = "RecordID",
        "NAME" = "Name"
		};
     arrayAppend(data, obj);


		return data;
	}

}