<%@page import="util.StringUtil"%>
<%@page import="model.bean.Category"%>
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
                	<%
                		if(request.getAttribute("catName") != null){
                			Category objCat = (Category)request.getAttribute("catName");
                	%>
                	<h3><%=objCat.getName() %></h3>
                	<%	} %>
                </div>

            </div>
        </div>
    </div>
    <!-- ##### Viral News Breadcumb Area End ##### -->

    <!-- ##### Blog Post Area Start ##### -->
    <div class="viral-story-blog-post section-padding-0-50">
		<%
			if(request.getAttribute("newsMaxViewByCatID") != null){
				News objNews = (News)request.getAttribute("newsMaxViewByCatID");
				String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
				+ "/" + objNews.getId() + ".html";
		%>
		<!-- Catagory Featured Post -->
        <div class="catagory-featured-post section-padding-100">
            <div class="container">
                <div class="row">
                    <!-- Catagory Thumbnail -->
                    <div class="col-12 col-md-7">
                        <div class="cata-thumbnail">
                            <a href="<%=urlDetail%>"><img width="640px" height="380px" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                        </div>
                    </div>
                    <!-- Catagory Content -->
                    <div class="col-12 col-md-5">
                        <div class="cata-content">
                            <a href="<%=urlDetail%>">
                                <h2><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h2>
                            </a>
                            <div class="post-meta">
                                <p class="post-author">By <a href="<%=urlDetail%>"><%=objNews.getCreat_by() %></a></p>
                                <p class="post-date"><%=objNews.getDate_create() %></p>
                                <p class="post-date">Lượt xem: <%=objNews.getView() %></p>
                            </div>
                            <p class="post-excerp"><%=objNews.getPreview()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<%	} %>

        <div class="container">
            <div class="row">
                <!-- Blog Posts Area -->
                <div class="col-12 col-lg-8">
                    <div class="row">
						<%
							int numberOfPage = (Integer)request.getAttribute("numberOfPage");
	                        int currentPage = (Integer)request.getAttribute("currentPage");
							if(request.getAttribute("listNewsByCatId") != null){
								ArrayList<News> listNews = (ArrayList<News>)request.getAttribute("listNewsByCatId");
								if(listNews.size() > 0){
									for(News objNews : listNews){
										String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
										+ "/" + objNews.getId() + ".html";
						%>
						<!-- Single Blog Post -->
                        <div class="col-12 col-lg-6">
                            <div class="single-blog-post style-3">
                                <!-- Post Thumb -->
                                <div class="post-thumb">
                                    <a href="<%=urlDetail%>"><img width="350px" height="220px" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                                </div>
                                <!-- Post Data -->
                                <div class="post-data">
                                    <a href="<%=urlDetail%>" class="post-title">
                                        <h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                    </a>
                                    <div class="post-meta">
                                        <p class="post-author">By <a href="<%=urlDetail%>"><%=objNews.getCreat_by() %></a></p>
                                        <p class="post-date"><%=objNews.getDate_create() %></p>
                                        <p class="post-date">Lược xem: <%=objNews.getView() %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
						<%	}}} %>
                    </div>
                    
                    <%
	  					if(numberOfPage > 1){
				  			if(request.getAttribute("catName") != null){
				  				Category objCat = (Category)request.getAttribute("catName");
  					%>
                    <div class="row">
                        <div class="col-12">
                            <div class="viral-news-pagination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item <%if(currentPage == 1) out.print("disabled"); %>"><a class="page-link" href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(objCat.getName()) %>/<%=objCat.getId() %>/<%if(currentPage - 1 >= 1) out.print(currentPage - 1);else out.print(1);%>.html">Previous</a></li>
                                        <%
	                                        /* <from>/danh-muc/(.*)/([0-9]+)/([0-9])+.html</from>
	                                		<to>/public/cat?id=$2&amp;page=$3</to> */
                                        	String active = "";
                                        	for(int i = 1; i <= numberOfPage; i++){
                                        		String urlCat = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(objCat.getName())
                            					+ "/" + objCat.getId() + "/" + i + ".html";
                                        		if(i == currentPage){
                                        			active = "active";
                                        		}else{
                                        			active = "";
                                        		}
                                        %>
                                        <li class="page-item <%=active%>"><a class="page-link" href="<%=urlCat%>"><%=i %></a></li>
                                        <%	} %>
                                        <li class="page-item <%if(currentPage == numberOfPage) out.print("disabled"); %>"><a class="page-link" href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(objCat.getName()) %>/<%=objCat.getId() %>/<%if(currentPage + 1 <= numberOfPage) out.print(currentPage + 1);else out.print(numberOfPage);%>.html">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <%}} %>
                </div>

                <!-- Sidebar Area -->
                <%@include file="/templates/public/inc/right_bar.jsp" %>
                
            </div>
        </div>
    </div>
    <!-- ##### Blog Post Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="/templates/public/inc/footer.jsp"%>