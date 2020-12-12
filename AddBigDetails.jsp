<%@include file="../header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@  taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<%@ page language="java" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- Karishma -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Inventory Management System | Big products</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/assassin.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/skin-red.css">
<!-- Date Picker -->
<link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
<!-- Select2 -->
<link rel="stylesheet" href="../plugins/select2/select2.min.css">

<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript"
	src="../_js/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript"
	src="../_js/functions.js"></script>
<script language="javascript" type="text/javascript"
	src="../_js/scripts.js"></script>
<script language="javascript" type="text/javascript"
	src="../_js/scripts.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


</head>
<%
	if(request.getSession(false)!=null && session.getAttribute("userID")!=null)
    {
    	String role=(String)session.getAttribute("role");
    	if(role!=null && !role.equalsIgnoreCase("readwrite"))
    	{
    		session.setAttribute("errorno","101");
    		response.sendRedirect("../Error");	
    	}
	}
   	else
	{
		response.sendRedirect("../Login.jsp");
    }
 %>
<body onLoad="scanstartup()"
	class="hold-transition skin-red sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <a
			href="QuickView" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><img
				src="../dist/img/assassin_icon.png" alt="logo" class="mini" /></span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><span><img
					src="../dist/img/assassin_icon.png" alt="logo"
					class="logo-icon img" /><img src="../dist/img/assassin-text.png"
					alt="logotext" class="logo-text img" /> </span> </span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav	class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->

				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="../dist/img/user_32.png" class="user-image" alt="User Image">
						<span class="hidden-xs"><s:property
								value="#session['loggedInUser']" /></span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="../dist/img/user_32.png"
							class="img-circle" alt="User Image">

							<p>
								<s:property value="#session['loggedInUser']" />
							</p></li>

						<!-- Menu Footer-->
						<li class="user-footer">
							<!-- <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div> -->
							<div class="pull-center">
								<a href="../Logout" class="btn btn-default btn-flat">Sign
									out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		</nav> 
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel --> <!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			<li class="treeview"><a href="Search"> <i
					class="fa fa-dashboard"></i> <span>Search Inventory</span>

			</a></li>
			<li class="treeview active"><a href="#"> <i
					class="fa fa-files-o"></i> <span>Inward Entry<small
						class="label bg-red"></small>
				</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="NewProject.jsp"><i
							class="fa fa-plus"></i>Big products</a></li>
					<li><a href="ViewAllProjects.jsp"><i class="fa fa-plus"></i>Small
							products<small class="label bg-yellow"></small></a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>Outward Entry<small class="label bg-red"></small>
				</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class=""><a href="NewReleaseK"><i class="fa fa-plus"></i>Big
							products</a></li>
					<li><a href="ViewAllRelease.jsp"><i class="fa fa-plus"></i>Small
							products<small class="label bg-yellow"></small></a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-barcode"></i>
					<span>Stock Transfer<small class="label bg-red"></small>
				</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="NewScan"><i class="fa fa-plus"></i>Big
							products</a></li>
					<li><a href="ViewAllScans.jsp"><i class="fa fa-plus"></i>Small
							products<small class="label bg-yellow"><s:property
									value="#session['totalscan']" /></small></a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-barcode"></i>
					<span>Reports<small class="label bg-red"></small>
				</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class=""><a href="NewScan"><i class="fa fa-eye"></i>Generate
							Reports</a></li>
				</ul></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Add Inventory</h1>
			<ol class="breadcrumb">
				<li><a href="Search"><i class="fa fa-dashboard"></i> Home</a></li>
				<li>Add Inventory</li>
				<li class="active">Add Inventory - Big products</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content"> <!-- Small boxes (Stat box) --> <!-- /.row -->
			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<section class="col-lg-12 "> <!-- scan -->
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title">Add Inventory - Big products</h3>
					</div>
					<div class="box-body">
						<s:form cssClass="form-horizontal" name="my_form"
							action="addInventorybig" method="post"
							enctype="multipart/form-data" autocomplete="off">
							<%-- <div class="ui-state-error ui-corner-all"
								style="padding-bottom: 0.5em; padding-left: 0.7em; padding-right: 0.7em; padding-top: 0.5em;">
								<span class="ui-icon ui-icon-alert"
									style="float: left; margin-right: 0.3em;"></span>
								<s:iterator value="actionErrors">
									<s:property escapeHtml="false" />
									<br />
								</s:iterator>
							</div> --%>

							<s:token name="CSRFToken" />
							
							<div class="form-group">
								<label for="grade" class="col-sm-2 control-label">Grade<span
									class="control-label text-danger">*</span></label>

								 <div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" name="grade"
										id="grade" placeholder="Grade" />
								</div>
							</div>

							<div class="form-group">
								<label for="diameter" class="col-sm-2 control-label">Size<span
									class="control-label text-danger">*</span></label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control"
										name="diameter" id="diameter" placeholder="Size" />
								</div>
							</div>

							<div class="form-group">
								<label for="length" class="col-sm-2 control-label">Length<span
									class="control-label text-danger">*</span></label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" name="length"
										id="length" placeholder="Length" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="purDate" class="col-sm-2 control-label">Purchase Date<span
									class="control-label text-danger">*</span></label>

								<div class="col-sm-10">
									<s:textfield type="date" cssClass="form-control" name="purDate"
										id="purDate" placeholder="Purchase Date" />
								</div>
							</div>

							<div class="form-group">
								<label for="seriesNo" class="col-sm-2 control-label">Series
									Number<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control"
										name="seriesNo" id="seriesNo" placeholder="Series Number" />
								</div>
							</div>

							<div class="form-group">
								<label for="weight" class="col-sm-2 control-label">Weight<span
									class="control-label text-danger"></span></label>

								<%-- 	<s:radio list="{'Round','Square'}" name="rolesRadio" multiple="false" id="weightCal" value = "Round"></s:radio>
								 --%>
								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" name="weight"
										id="weight" placeholder="Weight" />
								</div>
							</div>

							<div class="form-group">
								<label for="HSNCode" class="col-sm-2 control-label">HSN
									Code<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" name="HSNCode"
										id="HSNCode" placeholder="HSN Code" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="prodType" class="col-sm-2 control-label">Product Type
									<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:radio list="{'Rolled','Forged'}" name="prodType" multiple="false" id="prodType"></s:radio>
								</div>
							</div>

							<div class="form-group">
								<label for="HeatNo" class="col-sm-2 control-label">Heat
									No<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" name="heatNo"
										id="heatNo" placeholder="Heat No" />
								</div>
							</div>

							<div class="form-group">
								<label for="WarehouseNumber" class="col-sm-2 control-label">Warehouse
									Number<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control"
										name="warehouse" id="warehouse" placeholder="Warehouse Number" />
								</div>
							</div>

							<div class="form-group">
								<label for="ManufacturerName" class="col-sm-2 control-label">Manufacturer
									Name<span class="control-label text-danger"></span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control"
										name="manufacturerName" id="manufacturerName"
										placeholder="Manufacturer Name" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="invoiceNo" class="col-sm-2 control-label">Invoice
									Number<span class="control-label text-danger">*</span>
								</label>
								<div class="col-sm-10">
									<s:textfield type="text" cssClass="form-control" id="invoiceNo"
										name="invoiceNo" placeholder="Invoice Number" />
								</div>
							</div>

							<div class="form-group">
								<label for="invoiceDate" class="col-sm-2 control-label">Invoice
									Date <span class="control-label text-danger">*</span>
								</label>

								<div class="col-sm-10">
									<s:textfield type="date" cssClass="form-control"
										id="invoiceDate" name="invoiceDate" placeholder="Invoice Date" />
								</div>
							</div>
							


							<div class="form-group ">
								<div class="col-sm-offset-2 col-sm-2">

									<s:submit id="submit" cssClass="btn btn-danger"
										action="NewScanK" theme="simple" />
									<!-- <button type="submit" class="btn btn-danger">Submit</button> -->
								</div>
								<div class="col-sm-8">
									<div class="control-label text-danger">
										<span class=""></span>
										<s:iterator value="actionErrors">
											<s:property escapeHtml="false" />
											<br />
										</s:iterator>
										 <s:if test="hasActionMessages()">
     									   <s:actionmessage />    
    									</s:if>
									</div>
								</div>
							</div>
						</s:form>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /scan --> </section>
				<!-- /.Left col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<footer class="text-center pD10 mT50">
		 <div class="pull-right hidden-xs">
		 </div>
		<strong>Copyright &copy; 2020 <a
			href="http://www.forgecast.com" target="_blank">Forge Cast Alloy
				Pvt. Ltd.</a></strong> All rights reserved. </footer>
		</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();
		});
	</script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- datepicker -->
	<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="../plugins/chartjs/Chart.min.js"></script>
	<!-- Slimscroll 
	<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>-->
	<!-- FastClick -->
	<script src="../plugins/fastclick/fastclick.js"></script>
	<!-- Assassin App -->
	<script src="../dist/js/app.min.js"></script>
	<!-- Assassin dashboard demo (This is only for demo purposes) -->
	<script src="../dist/js/dashboard.js"></script>
	<script src="../plugins/select2/select2.full.min.js"></script>
</body>
</html>
