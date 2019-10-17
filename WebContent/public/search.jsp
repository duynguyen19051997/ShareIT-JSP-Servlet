<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/inc/header.jsp" %>
    <!-- ##### Header Area End ##### -->



    <!-- ##### Blog Post Area Start ##### -->
    <div class="viral-story-blog-post section-padding-0-50">
        <div class="container">
            <div class="row">
                <!-- Blog Posts Area -->
                <div class="col-12 col-lg-8">
                    <div class="row">
						<%
                            if(request.getAttribute("listNewsBySearch") != null){
                            	ArrayList<News> listNewsSearch = (ArrayList<News>)request.getAttribute("listNewsBySearch");
                            	if(listNewsSearch.size() > 0){
                            		for(News objNews : listNewsSearch){
						%>
                        <!-- Single Blog Post -->
                        <div class="col-12 col-lg-6">
                            <div class="single-blog-post style-3">
                                <!-- Post Thumb -->
                                <div class="post-thumb">
                                    <a href="<%=request.getContextPath()%>/public/detail?id=<%=objNews.getId()%>"><img width="350px" height="220px" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                                </div>
                                <!-- Post Data -->
                                <div class="post-data">
                                    <a href="<%=request.getContextPath()%>/public/cat?id=<%=objNews.getObjCat().getId()%>" class="post-catagory" style="width: 200px"><%=objNews.getObjCat().getName() %></a>
                                    <a href="<%=request.getContextPath()%>/public/detail?id=<%=objNews.getId()%>" class="post-title">
                                        <h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                    </a>
                                    <div class="post-meta">
                                        <p class="post-author">By <a href="#"><%=objNews.getCreat_by() %></a></p>
                                        <p class="post-date"><%=objNews.getDate_create() %></p>
                                        <p class="post-date">Lược xem: <%=objNews.getView() %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%	}}else{ %>
                        <h2>Tìm kiếm không có</h2>
						<%	}} %>
                    </div>
		
                </div>

                <!-- Sidebar Area -->
                <%@include file="/templates/public/inc/right_bar.jsp" %>
            </div>
        </div>
    </div>
    <!-- ##### Blog Post Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="/templates/public/inc/footer.jsp"%>