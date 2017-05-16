/**
* File: imageModel.cfc
* Author: Satyapriya Baral
* Path: model/imageModel.cfc
* Purpose: contains functions to connect to the image database table.
* Date: 16-05-2017
*/
component {
	error = CreateObject("component", "log.error");
	
	/**
    * Function to check user exists or not.
    *
    * @param string $email - contains email of the user.
    * @return - Returns the record of the user.
    */
	public any function userImage(string imageId)
	{
		try {
			userImage = new Query();
			userImage.setSQL("SELECT * FROM dbo.[Media] WHERE MediaId = :imageId");
			userImage.addParam( name = "imageId", value = "#arguments.imageId#", cfsqltype = "cf_sql_varchar" );
			imageResult = userImage.execute();
			return imageResult;
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}

}