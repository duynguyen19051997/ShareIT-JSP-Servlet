<%@page import="util.StringUtil"%>
<%@page import="model.bean.News"%>
<%@page import="model.DAO.NewsDAO"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer-area">

        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="footer-widget-area">
                            <!-- Footer Logo -->
	                        <div class="footer-logo">
	                        	<a href="<%=request.getContextPath()%>/trang-chu/1.html"><h1 style="color: #f26535">ShareIT</h1></a>
	                        </div>
                            <!-- Footer Nav -->
                            <div class="footer-nav">
                                <ul>
                                	<%
	                                	int id = 0;
	                        			try{
	                        				if(request.getParameter("page") != null){
	                        					id = Integer.valueOf(request.getParameter("page"));
	                            				if(id < 0){
	                            					id = 0;
	                            				}
	                            			}
	                        			} catch(NumberFormatException e){}
                                		CatDAO catDAO = new CatDAO();
                                		ArrayList<Category> listCat = (ArrayList<Category>)catDAO.getItemsParent_Id();
                                		if(listCat.size() > 0){
                                			for(Category objCat : listCat){
                                				String urlCat = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(objCat.getName())
                            					+ "/" + objCat.getId() + "/" + 1 + ".html";
                                	%>
                                	<li style="color: <%if(objCat.getId() == id) out.print("#f16039"); else out.print("black");%>"><a href="<%=urlCat%>"><%=objCat.getName() %></a></li>
                                	<%	}} %>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="footer-widget-area">
                            <!-- Widget Title -->
                            <h4 class="widget-title">Tin mới đăng</h4>
							<%
								NewsDAO newsDAOt = new NewsDAO();
								ArrayList<News> list = (ArrayList<News>)newsDAOt.getItemsLatest();
								if(list.size() > 0){
									for(News objNews : list){
										String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
										+ "/" + objNews.getId() + ".html";
							%>
                            <!-- Single Latest Post -->
                            <div class="single-blog-post style-2 d-flex align-items-center">
                                <div class="post-thumb">
                                    <a href="<%=urlDetail%>"><img width="200px" height="140px" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                                </div>
                                <div class="post-data">
                                    <a href="<%=urlDetail%>" class="post-title">
                                    	<h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                    </a>
                                    <div class="post-meta">
                                    	<p class="post-date"><a href="<%=urlDetail%>"><%=objNews.getObjCat().getName()%></a></p>
                                    </div>
                                </div>
                            </div>
							<%	}} %>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bottom Footer Area -->
        <div class="bottom-footer-area">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <!-- Copywrite -->
                        <p><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Designed By <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/duy.justinnguyen" target="_blank">Duy Nguyen</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->
    <!-- Popper js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="<%=request.getContextPath()%>/templates/public/js/active.js"></script>
    
</body>

</html>