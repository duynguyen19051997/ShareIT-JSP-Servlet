<%@page import="util.StringUtil"%>
<%@page import="model.bean.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/inc/header.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Viral News Breadcumb Area Start ##### -->
    <div class="viral-news-breadcumb-area section-padding-50">
        <div class="container h-100">
            <div class="row h-100 align-items-center">

                <!-- Breadcumb Area -->
                <div class="col-12 col-md-4">
                    <h3>Articles</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Trending</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Articles</li>
                        </ol>
                    </nav>
                </div>

            </div>
        </div>
    </div>
    <!-- ##### Viral News Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="blog-posts-area">
						<%
							if(request.getAttribute("news") != null){
								News objNews = (News)request.getAttribute("news");
						%>
						
                        <!-- Single Featured Post -->
                        <div class="single-blog-post-details">
                            <div class="post-thumb">
                                <img width="730px" height="430px" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt="">
                            </div>
                            <div class="post-data">
                                <a href="<%=request.getContextPath()%>/public/cat?id=<%=objNews.getObjCat().getId() %>&page=1" class="post-catagory" style="width: 200px"><%=objNews.getObjCat().getName() %></a>
                                <h2 class="post-title"><%=objNews.getName() %></h2>
                                <div class="post-meta">

                                    <!-- Post Details Meta Data -->
                                    <div class="post-details-meta-data mb-50 d-flex align-items-center justify-content-between">
                                        <!-- Post Author & Date -->
                                        <div class="post-authors-date">
                                            <p class="post-author">By <%=objNews.getCreat_by() %></p>
                                            <p class="post-date"><%=objNews.getDate_create() %></p>
                                        </div>
                                        <!-- View Comments -->
                                        <div class="view-comments">
                                            <p class="views"><%=objNews.getView() %></p>
                                            <a href="#comments" class="comments"><%=request.getAttribute("coutComment") %> comments</a>
                                        </div>
                                    </div>
                                    <p><%=objNews.getDetail() %></p>
                                </div>
                            </div>
                        </div>
                        <%	} else{ %>
                        <p>Không có dữ liệu%></p>
						<%	} %>

                        <!-- Related Articles Area -->
                        <div class="related-articles-">
                            <h4 class="mb-70">Bài viết liên quan</h4>
                            
                            <div class="row">
                            <%
                            	if(request.getAttribute("listNewsRelated")!= null){
                            		ArrayList<News> listNews = (ArrayList<News>)request.getAttribute("listNewsRelated");
                            		if(listNews.size() > 0){
                            			for(News objNews : listNews){
                            				String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
                        					+ "/" + objNews.getId() + ".html";
                                			String urlCat = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(objNews.getObjCat().getName())
                                					+ "/" + objNews.getObjCat().getId() + "/" + 1 + ".html";
                            %>
                            <!-- Single Post -->
                                <div class="col-12">
                                    <div class="single-blog-post style-3 style-5 d-flex align-items-center mb-50">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                                        </div>
                                        <!-- Post Data -->
                                        <div class="post-data">
                                            <a href="<%=urlCat%>" class="post-catagory" style="width: 200px"><%=objNews.getObjCat().getName() %></a>
                                            <a href="<%=urlDetail%>" class="post-title">
                                                <h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                            </a>
                                            <div class="post-meta">
                                                <p class="post-author">By <a href="<%=urlDetail%>"><%=objNews.getCreat_by() %></a></p>
                                                <p class="post-date"><%=objNews.getDate_create() %></p>
                                                <p class="post-date">Lượt xem: <%=objNews.getView() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <%	}}} %>

                            </div>
                        </div>

                        <!-- Comment Area Start -->
                        <div class="comment_area clearfix" id="comments">
                        	<h4 class="title mb-70">Comment</h4>
                            <%
                            	if(request.getAttribute("listCmt") != null){
                            		ArrayList<Comment> listCmt = (ArrayList<Comment>)request.getAttribute("listCmt");
                            		if(listCmt.size() > 0){
                            %>
                            <%
                           				for(Comment objCmt : listCmt){
                            %>
                            <!-- Single Comment Area -->
							<div class="single_comment_area">
								<!-- Comment Content -->
								<div class="comment-content d-flex">
									<!-- Comment Author -->
									<div class="comment-author">
										<img src="<%=request.getContextPath() %>/templates/public/img/core-img/comment.png" alt="author">
									</div>
									<!-- Comment Meta -->
									<div class="comment-meta">
										<h6><%=objCmt.getEmail() %></h6>
										<p>"<%=objCmt.getMessage()%>"</p>
										<p><%=objCmt.getDate_creat() %></p>
									</div>
								</div>
							</div>
                            <%	}}} %>
                            
                            <!-- Single Comment Area -->
                            <div id="ajaxcmt" class="single_comment_area">
                            </div>
                            
                        </div>

                        <div class="post-a-comment-area">
                            <!-- Reply Form -->
                            <div class="contact-form-area">
                                <form method="post" action="" id="formcomment">
                                    <div class="row">
                                        <div class="col-12 col-lg-6">
                                            <input type="email" class="form-control" name="emailcomment" id="emailcomment" placeholder="Email*">
                                        </div>
                                        <div class="col-12">
                                            <input type="text" class="form-control" name="messagecomment" id="messagecomment" placeholder="Comment*">
                                        </div>
                                        <div class="col-12">
                                            <button class="btn viral-btn mt-30" type="submit">Gửi</button></a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <script type="text/javascript">
	                 $(document).ready(function(){
	 					$('#formcomment').validate({
	 						rules:{
	 							emailcomment:{
	 								required: true,
	 								email: true
	 							},
	 							messagecomment:{
	 								required: true
	 							}
	 						},
	 						messages:{
	 							emailcomment:{
	 								required: 'Vui lòng nhập Email',
	 								email: 'Nhập đúng định dạng Email'
	 							},
	 							messagecomment:{
	 								required: 'Vui lòng nhập nội dung comment'
	 							}
	 						},
	 						submitHandler: function(form){
	 							var id = <%=Integer.valueOf(request.getParameter("id"))%>;
	 							var email = $('#emailcomment').val();
	 							var message = $('#messagecomment').val();
	 							$.ajax({
	 								url: '<%=request.getContextPath()%>/comment',
	 								type: 'POST',
	 								cache: false,
	 								error: function(){
	 									alert('Có lỗi xảy ra');
	 								},
	 								data: {
	 									aId: id, aEmail: email, aMessage: message
	 								},
	 								success: function(data){
	 									$('#ajaxcmt').html(data);
	 								},
	 							});
	 						}
 						});
 					});
                 </script>

                <!-- Sidebar Area -->
                <%@include file="/templates/public/inc/right_bar.jsp" %>
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="/templates/public/inc/footer.jsp"%>