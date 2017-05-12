<!DOCTYPE html>
<!--
* File: login.cfm
* Author: Satyapriya Baral
* Purpose: contains the view of the login page.
* Date: 01-05-2017
-->
<html lang = "en-US">
	<head>
		<link rel="stylesheet" href="../../assets/template/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="../../assets/template/dist/css/AdminLTE.min.css">
		<link rel="stylesheet" href = "../../assets/custom/css/main.css">
	</head>	
	<body class="hold-transition login-page">
		<cfset controllerObject = CreateObject("component","controller.userController") />
		<cfif  SESSION.isLogged NEQ "false">
			<cfif  SESSION.type EQ 1>
				<cflocation url="../../view/admin/adminHome.cfm" addToken="false"></cflocation>
			<cfelseif  SESSION.type EQ 2>
				<cflocation url="../../view/farmer/farmerHome.cfm" addToken="false"></cflocation>
			<cfelseif SESSION.type EQ 3>
				<cflocation url="../../view/dealer/dealerHome.cfm" addToken="false"></cflocation>
			</cfif>
		</cfif>
		<cfset email = url.email />
		<cfset token = url.token />
		<cfset VARIABLES.emailCheck = controllerObject.userDetails( email = "#email#")>
		<cfif (VARIABLES.emailCheck.getResult().recordCount EQ 0) OR (VARIABLES.emailCheck.getResult().UserTokenId NEQ token)>
			<cflocation url="../../view/login/login.cfm" addToken="false"></cflocation>
		</cfif>
		<cfif StructKeyExists(form,"resetBtn")>
			<cfset VARIABLES.messages = controllerObject.updatePassword( password = "#form.Password#", email = "#email#")>
		</cfif>
		<div class="login-box">
			<div class="login-logo">
				<b>Kisan</b>Seva</a>
			</div>
			<div class="login-box-body">
				<p class="login-box-msg">Enter Password</p>
				<cfform id="resetPassword">
					<div class="form-group has-feedback">
						<cfinput type="password" class="form-control" placeholder="Password" name="Password">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						<cfif isDefined("messages")>
							<cfif messages EQ true>
								<cflocation url="../../view/login/login.cfm" addToken="false"></cflocation>
							<cfelse>
								<cfoutput> #messages# </cfoutput>
							</cfif>
						</cfif>
					</div>
					<div class="row">
						<div class="col-xs-8"></div>
						<div class="col-xs-4">
							<button type="submit" name="resetBtn" class="btn btn-primary btn-block btn-flat">Submit</button>
						</div>
					</div>
				</cfform>
				<a href="../../view/login/register.cfm" class="text-center">Register a new membership</a>
			</div>
		</div>
		<script src="../../assets/template/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="../../assets/template/js/jquery-validation-1.16.0/dist/jquery.validate.js"></script>
		<script src="../../assets/template/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../assets/custom/js/script.js?ver=126536756556"></script>
	</body>
</html>