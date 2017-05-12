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
	public any function loginUser(string email, string password)
	{

		try {
			LOCAL.loginErrorMessages=StructNew();
			if (email EQ '' OR NOT isValid("email", email)) {
				LOCAL.loginErrorMessages.Email = 'Plese Enter a Valid Email';
			}
			if (Len(password) < 5) {
				LOCAL.loginErrorMessages.Password = 'Password Should be of minimum 5 charecters';
			}
			if (isDefined("loginErrorMessages") AND NOT structIsEmpty(loginErrorMessages)) {
				return LOCAL.loginErrorMessages;
			}
			var LOCAL.hashPassword = HASH(ARGUMENTS.password);
			var LOCAL.isLogged = userObject.checkUser(email);
			if(LOCAL.isLogged.getResult().recordCount EQ 0) {
				LOCAL.loginErrorMessages.user = 'Incorrect Email or Password';
				return LOCAL.loginErrorMessages;
			} else {
				if(LOCAL.isLogged.getResult().UserPassword NEQ LOCAL.hashPassword) {
					LOCAL.loginErrorMessages.user = 'Incorrect Password';
					return LOCAL.loginErrorMessages;
				} else {
					var SESSION.isLogged = "true";
					var SESSION.userEmail = "#arguments.email#";
					var SESSION.user = "#isLogged.getResult().UserName#";
					var SESSION.type = "#isLogged.getResult().UserTypeId#";
					APPLICATION.currentUsers = listAppend(APPLICATION.currentUsers, #ARGUMENTS.email#);
					LOCAL.loginErrorMessages.type = LOCAL.isLogged.getResult().UserTypeId;
					return LOCAL.loginErrorMessages;
				}	
			}
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
}