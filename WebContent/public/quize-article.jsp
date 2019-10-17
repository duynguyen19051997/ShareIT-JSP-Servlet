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
                    <h3>Quize</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Trending</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Quize</li>
                        </ol>
                    </nav>
                </div>

                <!-- Add Widget -->
                <div class="col-12 col-md-8">
                    <div class="add-widget">
                        <a href="#"><img src="<%=request.getContextPath()%>/templates/public/img/bg-img/add2.png" alt=""></a>
                    </div>
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

                        <!-- Single Featured Post -->
                        <div class="single-blog-post-details">
                            <!-- Post Thumb -->
                            <div class="post-thumb">
                                <img src="<%=request.getContextPath()%>/templates/public/img/bg-img/21.jpg" alt="">
                            </div>
                            <!-- Post Data -->
                            <div class="post-data mb-70">
                                <a href="#" class="post-catagory">Finance</a>
                                <h2 class="post-title">This Is How Notebooks Who Travels Around The World Look Like</h2>
                                <div class="post-meta">
                                    <!-- Post Details Meta Data -->
                                    <div class="post-details-meta-data mb-50 d-flex align-items-center justify-content-between">
                                        <!-- Post Author & Date -->
                                        <div class="post-authors-date">
                                            <p class="post-author">By <a href="#">Michael Smithson</a></p>
                                            <p class="post-date">5 Hours Ago</p>
                                        </div>
                                        <!-- View Comments -->
                                        <div class="view-comments">
                                            <p class="views">1281 Views</p>
                                            <a href="#comments" class="comments">3 comments</a>
                                        </div>
                                    </div>
                                    <p>Donec turpis erat, scelerisque id euismod sit amet, fermentum vel dolor. Nulla facilisi. Sed pellentesque lectus et accumsan aliquam. Fusce lobortis cursus quam, id mattis sapien. Aliquam erat volutpat. Aliquam placerat, est quis sagittis tincidunt, ipsum eros posuere mi, ut finibus quam sem eget ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec commodo quis enim ac auctor. Ut et mollis felis, sit amet ultricies est. Suspendisse sed faucibus tortor.</p>
                                </div>
                            </div>

                            <!-- Single Questions Area -->
                            <div class="single-questions-area mb-70">
                                <h3 class="mb-70">01. What color does DJ Jessy prefer?</h3>

                                <div class="questions-thumb">
                                    <img src="<%=request.getContextPath()%>/templates/public/img/bg-img/22.jpg" alt="">
                                </div>

                                <div class="questions-options">
                                    <!-- Single Option -->
                                    <input type="radio" id="radio1" name="radio" value="Dark Yellow">
                                    <label for="radio1">Dark Yellow</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio2" name="radio" value="Light Blue">
                                    <label for="radio2">Light Blue</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio3" name="radio" value="Ruby Rose">
                                    <label for="radio3">Ruby Rose</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio4" name="radio" checked value="Black">
                                    <label for="radio4">Black</label>
                                </div>
                            </div>

                            <!-- Single Questions Area -->
                            <div class="single-questions-area mb-70">
                                <h3 class="mb-70">02. What is Paul’s Boy favorite music genre?</h3>

                                <div class="questions-thumb">
                                    <img src="<%=request.getContextPath()%>/templates/public/img/bg-img/23.jpg" alt="">
                                </div>

                                <div class="questions-options">
                                    <!-- Single Option -->
                                    <input type="radio" id="radio5" name="radio2" checked value="Drum & base">
                                    <label for="radio5">Drum &amp; base</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio6" name="radio2" value="Pop / Rock">
                                    <label for="radio6">Pop / Rock</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio7" name="radio2" value="Rmb & Soul">
                                    <label for="radio7">Rmb &amp; Soul</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio8" name="radio2" value="Electronic Music">
                                    <label for="radio8">Electronic Music</label>
                                </div>
                            </div>

                            <!-- Single Questions Area -->
                            <div class="single-questions-area mb-70">
                                <h3 class="mb-70">03. Choose the corect name of this location</h3>

                                <div class="questions-thumb">
                                    <img src="<%=request.getContextPath()%>/templates/public/img/bg-img/24.jpg" alt="">
                                </div>

                                <div class="questions-options">
                                    <!-- Single Option -->
                                    <input type="radio" id="radio9" name="radio3" value="The Atlantic Ocean">
                                    <label for="radio9">The Atlantic Ocean</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio10" name="radio3" checked value="San Francisco Bridge">
                                    <label for="radio10">San Francisco Bridge</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio11" name="radio3" value="Rocky Mountains">
                                    <label for="radio11">Rocky Mountains</label>

                                    <!-- Single Option -->
                                    <input type="radio" id="radio12" name="radio3" value="New York">
                                    <label for="radio12">New York</label>
                                </div>
                            </div>

                            <!-- Login with Facebook to post comments -->
                            <div class="login-with-facebook my-5">
                                <a href="#">Login with Facebook to post comments</a>
                            </div>
                        </div>

                        <!-- Related Articles Area -->
                        <div class="related-articles-">
                            <h4 class="mb-70">Related Articles</h4>

                            <div class="row">
                                <!-- Single Post -->
                                <div class="col-12">
                                    <div class="single-blog-post style-3 style-5 d-flex align-items-center mb-50">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <a href="#"><img src="<%=request.getContextPath()%>/templates/public/img/bg-img/19.jpg" alt=""></a>
                                        </div>
                                        <!-- Post Data -->
                                        <div class="post-data">
                                            <a href="#" class="post-catagory">Finance</a>
                                            <a href="#" class="post-title">
                                                <h6>This Is How Notebooks Of An Artist Who Travels Around The World Look</h6>
                                            </a>
                                            <div class="post-meta">
                                                <p class="post-author">By <a href="#">Michael Smithson</a></p>
                                                <p class="post-date">5 Hours Ago</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Single Post -->
                                <div class="col-12">
                                    <div class="single-blog-post style-3 style-5 d-flex align-items-center mb-50">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <a href="#"><img src="<%=request.getContextPath()%>/templates/public/img/bg-img/20.jpg" alt=""></a>
                                        </div>
                                        <!-- Post Data -->
                                        <div class="post-data">
                                            <a href="#" class="post-catagory">Finance</a>
                                            <a href="#" class="post-title">
                                                <h6>This Is How Notebooks Of An Artist Who Travels Around The World Look</h6>
                                            </a>
                                            <div class="post-meta">
                                                <p class="post-author">By <a href="#">Michael Smithson</a></p>
                                                <p class="post-date">5 Hours Ago</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Area -->
                <%@include file="/templates/public/inc/right_bar.jsp" %>
                
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
   <%@include file="/templates/public/inc/footer.jsp"%>