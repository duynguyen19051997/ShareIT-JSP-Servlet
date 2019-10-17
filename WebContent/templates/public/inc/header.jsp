<%@page import="util.DeQuy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>ShareIT</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath()%>/public/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/style.css">
    
    <!-- jQuery-2.2.4 js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- jQuery-2.2.4 js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/jquery/jquery.validate.min.js"></script>
    
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Navbar Area -->
        <div class="viral-news-main-menu" id="stickyMenu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="viralnewsNav">

                        <!-- Header Logo -->
                        <div class="header-logo">
                            <a href="<%=request.getContextPath()%>/trang-chu/1.html"><h1 style="color: #f26535">ShareIT</h1></a>                        </div>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <%
                                	DeQuy.CreateMenu(out, request);
                                %>
                                
                                <!-- Search Button -->
                                <div class="search-btn">
                                    <i id="searchbtn" class="fa fa-search" aria-hidden="true"></i>
                                </div>

                                <!-- Search Form -->
                                <div class="viral-search-form">
                                    <form id="search" action="<%=request.getContextPath()%>/public/search" method="get">
                                        <input type="text" id="searchterms" value="" name="searchterms" placeholder="Enter your keywords ...">
                                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                    </form>
                                </div>
                                
                                 <script type="text/javascript">
	                                 $(document).ready(function(){
	                     				$('#search').validate({
	                     					rules:{
	                     						searchterms:{
	                     							required: true
	                     						}
	                     					},
	                     					messages:{
	                     						searchterms:{
	                     							required: 'Vui lòng không để trống!'
	                     						}
	                     					},					
	                     				});
	                     			  });
                                 </script>

                                <!-- Video Post Button -->
                                <div class="add-post-button">
                                    <a href="<%=request.getContextPath()%>/dang-nhap.html" class="btn add-post-btn">Đến trang quản trị</a>
                                </div>

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>