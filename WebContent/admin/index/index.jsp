<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/admin/inc/header.jsp" %>
<!-- header_end -->
							<div id="slide">
										<div id="myCarousel" class="carousel slide" data-ride="carousel">
										  <!-- Indicators -->
										  <ol class="carousel-indicators">
											<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
											<li data-target="#myCarousel" data-slide-to="1"></li>
											<li data-target="#myCarousel" data-slide-to="2"></li>
											<li data-target="#myCarousel" data-slide-to="3"></li>
										  </ol>

										  <!-- Wrapper for slides -->
										  <div class="carousel-inner">
											<div class="item active">
											  <img src="<%=request.getContextPath() %>/templates/admin/images/slide1.jpg" alt="Share IT">
											</div>
											
											<div class="item">
											  <img src="<%=request.getContextPath() %>/templates/admin/images/slide2.jpg" alt="Share IT">
											</div>

											<div class="item">
											  <img src="<%=request.getContextPath() %>/templates/admin/images/slide3.jpg" alt="Share IT">
											</div>

											<div class="item">
											  <img src="<%=request.getContextPath() %>/templates/admin/images/slide4.jpg" alt="Share IT">
											</div>
										  </div>

										  <!-- Left and right controls -->
										  <a class="left carousel-control" href="<%=request.getContextPath() %>/templates/admin/#myCarousel" data-slide="prev">
											<span class="glyphicon glyphicon-chevron-left"></span>
											<span class="sr-only">Previous</span>
										  </a>
										  <a class="right carousel-control" href="<%=request.getContextPath() %>/templates/admin/#myCarousel" data-slide="next">
											<span class="glyphicon glyphicon-chevron-right"></span>
											<span class="sr-only">Next</span>
										  </a>
										</div>
									</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<%
						int numberOfCat = 0, numberOfNews = 0, numberOfUser = 0, numberOfCmt = 0;
						if(request.getAttribute("numberOfCat") != null){
							numberOfCat = (Integer)request.getAttribute("numberOfCat");
						}
						if(request.getAttribute("numberOfNews") != null){
							numberOfNews = (Integer)request.getAttribute("numberOfNews");
						}
						if(request.getAttribute("numberOfUser") != null){
							numberOfUser = (Integer)request.getAttribute("numberOfUser");
						}
						if(request.getAttribute("numberOfCmt") != null){
							numberOfCmt = (Integer)request.getAttribute("numberOfCmt");
						}
					%>
					<div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=numberOfCat %></div>
                                        <div>Danh mục</div>
                                    </div>
                                </div>
                            </div>
                            <a href="<%=request.getContextPath() %>/admin/cat/index?page=1">
                                <div class="panel-footer">
                                    <span class="pull-left">Xem chi tiết</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>       
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=numberOfNews %></div>
                                        <div>Tin tức</div>
                                    </div>
                                </div>
                            </div>
                            <a href="<%=request.getContextPath() %>/admin/news/index?page=1">
                                <div class="panel-footer">
                                    <span class="pull-left">Xem chi tiết</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
					 <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=numberOfUser %></div>
                                        <div>Người dùng</div>
                                    </div>
                                </div>
                            </div>
                            <a href="<%=request.getContextPath() %>/admin/user/index?page=1">
                                <div class="panel-footer">
                                    <span class="pull-left">Xem chi tiết</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
					</div>
					 <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=numberOfCmt %></div>
                                        <div>Bình luận</div>
                                    </div>
                                </div>
                            </div>
                            <a href="<%=request.getContextPath() %>/admin/comment/index?page=1">
                                <div class="panel-footer">
                                    <span class="pull-left">Xem chi tiết</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
			</div>
			<script type="text/javascript">
				document.getElementById("index").classList.add('active');
			</script>
				<!-- /footer -->
            <!-- /footer -->
			<%@include file="/templates/admin/inc/footer.jsp"%>
			