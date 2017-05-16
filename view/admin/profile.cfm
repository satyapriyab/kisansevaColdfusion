<!--
* File    : profile.cfm
* Author  : Satyapriya Baral
* Date    : 16-05-2017
* Purpose : Show Profile Page of users  -->

<html>
<head>
	<title>User | Profile</title>
	<cfinclude template="#request.webRoot#view/master/header.cfm">
	<cfif  SESSION.type NEQ 1>
		<cflocation url="#request.webRoot#view/login/login.cfm" addToken="false"></cflocation>
	</cfif>
	<aside class="main-sidebar">
		<section class="sidebar">
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<cfoutput>#request.webRoot#</cfoutput>assets/custom/img/<cfoutput>#SESSION.image#</cfoutput>" class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p><cfoutput> #SESSION.user# </cfoutput></p>
					<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
			<ul class="sidebar-menu">
				<li class="header">MAIN NAVIGATION</li>
				<li class="treeview">
					<a href="<cfoutput>#request.webRoot#</cfoutput>view/admin/adminHome.cfm">
						<i class="fa fa-home"></i>
						<span>Home</span>
					</a>
				</li>
				<li class="treeview">
					<a href="<cfoutput>#request.webRoot#</cfoutput>view/admin/userData.cfm">
						<i class="fa fa-users"></i>
						<span>Users</span>
					</a>
				</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-edit"></i>
						<span>Category</span>
					</a>
				</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-edit"></i>
						<span>Farming Tips</span>
					</a>
				</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-user-plus"></i>
						<span>Add Admin</span>
					</a>
				</li>
			</ul>
		</section>
	</aside>

    <div class="content-wrapper">
		<section class="content-header">
			<h1>
				<cfoutput> #SESSION.user# </cfoutput>
				Dashboard
				
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</section>

        <!-- Main content -->
        <section class="content">

          <div class="row">
            <div class="col-md-3">

              <!-- Profile Image -->
              <div class="box box-primary">
                <div class="box-body box-profile">
                  <img class="profile-user-img img-responsive img-circle" src="<cfoutput>#request.webRoot#</cfoutput>assets/custom/img/<cfoutput>#SESSION.image#</cfoutput>" alt="User profile picture">

                  <h3 class="profile-username text-center"><cfoutput> #SESSION.user# </cfoutput></h3>

                  <p class="text-muted text-center"></p>


                </div>
                <!-- /.box-body -->
              </div>
              <!-- /.box -->

              <!-- About Me Box -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">About Me</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <strong><i class="fa fa-book margin-r-5"></i> Email</strong>
                  <p class="text-muted">
					<cfoutput> #userDetails.getResult().UserEmail# </cfoutput>
                  </p>

                  <hr>

                  <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

                  <p class="text-muted"><cfoutput> #userDetails.getResult().UserAddress# </cfoutput></p>

                  <hr>

                  <strong><i class="fa fa-pencil margin-r-5"></i> Contact</strong>

                  <p class="text-muted"><cfoutput> #userDetails.getResult().UserNumber# </cfoutput></p>

                  <p>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
                  <li><a href="#editProfile" data-toggle="tab">Edit Profile</a></li>
                </ul>
                <div class="tab-content">
                <div class="active tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                          <span class="username">
                            <a href="#"></a>
                          </span>
                          <div class="row">
                            <div class="col-xs-3">
                              
                              
                            </div>
                          </div>
                      </div>
                    </div>
                </div>
              <div class="tab-pane" id="editProfile">
                    <cfform id="editProfileForm" class="form-horizontal" action="editProfileDealer" method="Post" enctype="multipart/form-data">
                      <div class="form-group">
                        <label for="inputName" class="col-sm-1 control-label">Name</label>
                        <div class="col-sm-10">
                          <cfinput type="text" class="form-control" id="inputName" placeholder="Name" name="Name" value ="#userDetails.getResult().UserName#">
                          <span class="errorMessage" id="nameError"></span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputAddress" class="col-sm-1 control-label">Address</label>
                        <div class="col-sm-10">
                          <cfinput type="text" class="form-control" id="inputAddress" placeholder="Address" name="Address" value ="#userDetails.getResult().UserAddress#">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputContact" class="col-sm-1 control-label">Contact</label>
                        <div class="col-sm-10">
                          <cfinput type="number" class="form-control" id="inputContact" placeholder="Contact" name="Contact" value ="#userDetails.getResult().UserNumber#">
                          <span class="errorMessage" id="contactError"></span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPhoto" class="col-sm-1" >Insert Photo</label>
                        <div class="col-sm-10">
                          <input type="file" id="image" name="imageData">
                        </div>
                      </div>
                      <div class="form-group">
                      <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-10">
                          <button type="submit" id="editSubmit" class="btn btn-danger">Save</button>
                        </div>
                      </div>
                    </cfform>
              </div>
            </div>
          </div>

        </section>
      </div>
      <div class="control-sidebar-bg"></div>
    </div>
	<cfinclude template="#request.webRoot#view/master/footer.cfm">