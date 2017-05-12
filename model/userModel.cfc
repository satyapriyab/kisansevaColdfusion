/**
* File: userModel.cfc
* Author: Satyapriya Baral
* Path: model/userModel.cfc
* Purpose: contains functions to connect to the user database table.
* Date: 01-05-2017
*/
component {
	error = CreateObject("component", "log.error");
	/**
    * Function to create a record of new user registered.
    *
    * @param string $username - contains name of the user.
    * @param string $email - contains email of the user.
    * @param string $password - contains passwoed of the user.
    * @param string $address - contains address of the user.
    * @param string $number - contains number of the user.
    * @return - Returns boolian value if record created or not.
    */
	public boolean function createUser(string type, string username, string email, string password, string address, string number)
	{
		try {
			var hashPassword = HASH(password);
			newUser = new Query();
			newUser.setSQL("INSERT into dbo.UserInfo (UserTypeId, UserName, UserEmail, UserPassword, UserAddress, UserNumber) VALUES (:type, :username, :email, :hashPassword, :address, :number)");
			newUser.addParam( name = "type", value = "#arguments.type#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "username", value = "#arguments.username#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "hashPassword", value = "#local.hashPassword#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "address", value = "#arguments.address#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "number", value = "#arguments.number#", cfsqltype = "cf_sql_varchar" );
			result = newUser.execute();
			return "true";
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to check user exists or not.
    *
    * @param string $email - contains email of the user.
    * @return - Returns the record of the user.
    */
	public any function checkUser(string email)
	{
		try {
			checkUser = new Query();
			checkUser.setSQL("SELECT * FROM dbo.UserInfo WHERE UserEmail = :email");
			checkUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			userResult = checkUser.execute();
			return userResult;
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to add token to user data.
    *
    * @param string $token - contains token value.
    * @param string $email - contains email of the user.
    * @return - Returns boolian value if token updated or not.
    */
	public boolean function insertToken(string token, string email)
	{
		try {
			updatetoken = new Query();
			updateToken.setSQL("UPDATE dbo.userInfo SET UserTokenId = :token WHERE UserEmail = :email");
			updateToken.addParam( name = "token", value = "#arguments.token#", cfsqltype = "cf_sql_varchar" );
			updateToken.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			result = updateToken.execute();
			return "true";
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to add update password.
    *
    * @param string $password - contains new password.
    * @param string $email - contains email of the user.
    * @return - Returns boolian value if token updated or not.
    */
	public boolean function updatePassword(string password, string email)
	{
		try {
			var hashPassword = HASH(password);
			updatepassword = new Query();
			updatepassword.setSQL("UPDATE dbo.userInfo SET UserPassword = :password WHERE UserEmail = :email");
			updatepassword.addParam( name = "password", value = "#local.hashPassword#", cfsqltype = "cf_sql_varchar" );
			updatepassword.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			result = updatepassword.execute();
			return "true";
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
}