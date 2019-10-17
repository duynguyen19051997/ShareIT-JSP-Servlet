<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Share IT</title>
		
		<link href="<%=request.getContextPath() %>/templates/admin/css/style.css" rel="stylesheet">
        
		<!-- Bootstrap Core CSS -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<%=request.getContextPath() %>/templates/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery -->
        <script src="<%=request.getContextPath() %>/templates/admin/js/jquery.min.js"></script>
        
        <!-- jQuery CKEditor-->
        <script src="<%=request.getContextPath() %>/templates/admin/js/ckeditor/ckeditor.js"></script>
        
        <!-- jQuery Validate-->
        <script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.min.js"></script>
    </head>
    <body>

        <div id="wrapper">
          <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="header">
                <div class="navbar-header">
                    <a class="navbar-brand" href="https://vinaenter.edu.vn" title="VinaENTER EDU" target="_blank">VinaENTER EDU</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="<%=request.getContextPath() %>/admin/index.jsp"><i class="fa fa-home fa-fw"></i> Website</a></li>
                </ul>
			  <%
          			if(session.getAttribute("userInfor") != null){
          				User objUser = (User)session.getAttribute("userInfor");
          	   %>
                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="<%=request.getContextPath() %>/templates/admin/#">
                            <i class="fa fa-user fa-fw"></i> <%=objUser.getUsername()%> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li class="divider"></li>
                            <li><a href="<%=request.getContextPath() %>/admin/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
              <%} %>
                <!-- /.navbar-top-links -->
		  </nav>
		  <div class="row" id="rowwrapper">
				<div class="col-lg-6" id="col-lg-6">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li id="index"><a href="<%=request.getContextPath() %>/admin/index">Trang chủ</a>
								</li>
								<li id="cats"><a href="<%=request.getContextPath() %>/admin/cat/index?page=1" >Quản lý danh mục</a>
								</li>
								<li id="news"><a href="<%=request.getContextPath() %>/admin/news/index?page=1">Quản lý tin tức</a>
								</li>
								<li id="users" ><a href="<%=request.getContextPath() %>/admin/user/index?page=1">Quản lý người dùng</a>
								</li>
								<li id="comments" ><a href="<%=request.getContextPath() %>/admin/comment/index?page=1">Quản lý bình luận</a>
								</li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="index">
									<h4 style="font-size: 20px">CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN TRỊ WEBSITE TIN TỨC SHAREIT</h4>
								</div>
							</div>
							 <!-- /.row -->