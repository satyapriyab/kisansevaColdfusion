<!DOCTYPE html>
<!--
* File    : index.blade.php
* Author  : Satyapriya Baral
* Date    : 22-Mar-2017
* Purpose : Farmers home Screen  -->
<html>
<head>
	<title>Farmer | Home</title>
	<cfinclude template="../master/header.cfm">
	<cfif  SESSION.type NEQ 3>
		<cflocation url="../../view/login/login.cfm" addToken="false"></cflocation>
	</cfif>
	<aside class="main-sidebar">
		<section class="sidebar">
			<div class="user-panel">
				<div class="pull-left image">
					<img src="" class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p><cfoutput> #SESSION.user# </cfoutput></p>
					<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
			<ul class="sidebar-menu">
				<li class="header">MAIN NAVIGATION</li>
				<li class="active treeview">
					<a href="#">
						<i class="fa fa-home"></i>
						<span>Home</span>
					</a>
				</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-files-o"></i>
						<span>View Crop Posts</span>
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
				<small>Dealer</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<div class="inner">
							<h3>Rs </h3>
							<p>Total Earning</p>
						</div>
						<div class="icon">
							<i class="fa fa-money"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h3></h3>
							<p>Crop Post Active</p>
						</div>
						<div class="icon">
							<i class=""></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow">
						<div class="inner">
							<h3></h3>
							<p>Crop Post Sold</p>
						</div>
						<div class="icon">
							<i class=""></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">
							<h3></h3>
							<p>Crop Post Expired</p>
						</div>
						<div class="icon">
							<i class=""></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<section class="col-lg-7 connectedSortable">
					<div class="box box-info">
						<div class="box-header">
							<i class="fa fa-envelope"></i>
							<h3 class="box-title">Quick Email</h3>
							<!-- tools box -->
							<div class="pull-right box-tools">
								<button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i></button>
							</div>
						<!-- /. tools -->
						</div>
						<div class="box-body">
							<form action="email" method="post">
								<div class="form-group">
									<input type="email" class="form-control" name="emailto" placeholder="Email to:">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="subject" placeholder="Subject">
								</div>
								<div>
									<textarea class="textarea" placeholder="Message" name="content" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
								</div>
								<div class="box-footer clearfix">
									<button type="submit" class="pull-right btn btn-default" id="sendEmail">Send
									<i class="fa fa-arrow-circle-right"></i></button>
								</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</section>
	</div>
</div>
	<cfinclude template="../master/footer.cfm">
