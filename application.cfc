/**
* File: application.cfc
* Author: Satyapriya Baral
* Path: application.cfc
* Purpose: contains all event listner for the application
* Date: 01-05-2017
*/
component {
	this.datasource = "KisanSeva";
	this.name = "KisanSeva";
	this.clientmanagement = true;
	this.sessionmanagement = true; 
	this.setclientcookies = true;
	this.sessiontimeout = "#createTimeSpan(0,0,5,10)#";
	this.applicationtimeout = "#createTimeSpan(0,0,10,10)#";

	/**
    * Function to set current user on applicaton start.
    *
    * @param null.
    */
	function onApplicationStart() {
		var Application.currentUsers = "";
	}
	
	/**
    * Function to set variables on Session start.
    *
    * @param null.
    */
	function onSessionStart() {
		var SESSION.isLogged = "false";
		var SESSION.userEmail = "";	
	}
	

	
	/**
    * Function to set variables on session end.
    *
    * @param null.
    */
	function onSessionEnd( struct SessionScope, struct ApplicationScope) {
		ApplicationScope.currentUsers = listDeleteAt(ApplicationScope.currentUsers,listFind(ApplicationScope.currentUsers,#SessionScope.userEmail#));
		location(url = "../index.cfm" addtoken = "false");
		structClear(ARGUMENTS.SessionScope);
	}
}