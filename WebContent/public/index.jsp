<%@page import="util.StringUtil"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/inc/header.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <div class="hero-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="hero-slides owl-carousel">
                    	<%
                    		if(request.getAttribute("listNewsLatest") != null){
                    			ArrayList<News> listNewsLatest = (ArrayList<News>)request.getAttribute("listNewsLatest");
                    			if(listNewsLatest.size() > 0){
                    				for(News objNews : listNewsLatest){
                    					String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
                    					+ "/" + objNews.getId() + ".html";
                    					
                    					/* <rule>
                    					<from>/chi-tiet/(.*)/([0-9]+).html</from>
                    					<to>/public/detail?id=$2</to>
                    				</rule> */
                    	%>
                    	<!-- Single Blog Post -->
                        <div class="single-blog-post d-flex align-items-center mb-50">
                            <div class="post-thumb">
                                <a href="<%=urlDetail%>"><img src="<%=request.getContextPath()%>/files/<%=objNews.getPicture() %>" alt=""></a>
                            </div>
                            <div class="post-data">
                                <a href="<%=urlDetail%>" class="post-title">
                                    <h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                </a>
                                <div class="post-meta">
                                    <p class="post-date"><a href="<%=urlDetail%>"><%=objNews.getDate_create() %></a></p>
                                    <p class="post-date"><a href="<%=urlDetail%>">Lượt xem: <%=objNews.getView() %></a></p>
                                </div>
                            </div>
                        </div>
                    	<%	}}} %>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Welcome Slide Area Start ##### -->
    <div class="welcome-slide-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="welcome-slides owl-carousel">
						
						<%
							if(request.getAttribute("listNewsViewMax") != null){
								ArrayList<News> listNews = (ArrayList<News>)request.getAttribute("listNewsViewMax");
								if(listNews.size() > 5){
						%>
						<!-- Single Welcome Slide -->
                        <div class="single-welcome-slide">
                            <div class="row no-gutters">
                                <div class="col-12 col-lg-8">
                                    <!-- Welcome Post -->
                                    <div class="welcome-post">
                                        <img width="740px" height="464px" src="<%=request.getContextPath()%>/files/<%=listNews.get(0).getPicture() %>" alt="">
                                        <div class="post-content" data-animation="fadeInUp" data-duration="500ms">
                                            <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(0).getObjCat().getName()) %>/<%=listNews.get(0).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(0).getObjCat().getName() %></a>
                                            <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(0).getName()) %>/<%=listNews.get(0).getId() %>.html" class="post-title"><%if(listNews.get(0).getName().length() > 50) out.print(listNews.get(0).getName().substring(0, 50) + "..."); else out.print(listNews.get(0).getName()); %></a>
                                            <p><%=listNews.get(0).getDate_create() %></p>
                                            <p>Lược xem: <%=listNews.get(0).getView() %></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-4">
                                    <div class="welcome-posts--">
                                        <!-- Welcome Post -->
                                        <div class="welcome-post style-2">
                                            <img width="370px" height="232px" src="<%=request.getContextPath()%>/files/<%=listNews.get(2).getPicture() %>" alt="">
                                            <div class="post-content" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">
                                                <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(2).getObjCat().getName()) %>/<%=listNews.get(2).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(2).getObjCat().getName() %></a>
                                                <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(2).getName()) %>/<%=listNews.get(2).getId() %>.html" class="post-title"><%if(listNews.get(2).getName().length() > 50) out.print(listNews.get(2).getName().substring(0, 50) + "..."); else out.print(listNews.get(2).getName()); %></a>
                                                <p><%=listNews.get(2).getDate_create() %></p>
                                                <p>Lược xem: <%=listNews.get(2).getView() %></p>
                                            </div>
                                        </div>

                                        <!-- Welcome Post -->
                                        <div class="welcome-post style-2">
                                            <img width="370px" height="232px" src="<%=request.getContextPath()%>/files/<%=listNews.get(3).getPicture() %>" alt="">
                                            <div class="post-content" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">
                                                <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(3).getObjCat().getName())%>/<%=listNews.get(3).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(3).getObjCat().getName() %></a>
                                                <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(3).getName()) %>/<%=listNews.get(3).getId() %>.html" class="post-title"><%if(listNews.get(3).getName().length() > 50) out.print(listNews.get(3).getName().substring(0, 50) + "..."); else out.print(listNews.get(3).getName()); %></a>
                                                <p><%=listNews.get(3).getDate_create() %></p>
                                                <p>Lược xem: <%=listNews.get(3).getView() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Single Welcome Slide -->
                        <div class="single-welcome-slide">
                            <div class="row no-gutters">
                                <div class="col-12 col-lg-8">
                                    <!-- Welcome Post -->
                                    <div class="welcome-post">
                                        <img width="740px" height="464px" src="<%=request.getContextPath()%>/files/<%=listNews.get(1).getPicture() %>" alt="">
                                        <div class="post-content" data-animation="fadeInUp" data-duration="500ms">
                                            <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(1).getObjCat().getName())%>/<%=listNews.get(1).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(1).getObjCat().getName() %></a>
                                            <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(1).getName()) %>/<%=listNews.get(1).getId() %>.html" class="post-title"><%if(listNews.get(1).getName().length() > 50) out.print(listNews.get(1).getName().substring(0, 50) + "..."); else out.print(listNews.get(1).getName()); %></a>
                                            <p><%=listNews.get(1).getDate_create() %></p>
                                            <p>Lược xem: <%=listNews.get(1).getView() %></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-4">
                                    <div class="welcome-posts--">
                                        <!-- Welcome Post -->
                                        <div class="welcome-post style-2">
                                            <img width="370px" height="232px" src="<%=request.getContextPath()%>/files/<%=listNews.get(4).getPicture() %>" alt="">
                                            <div class="post-content" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">
                                                <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(4).getObjCat().getName())%>/<%=listNews.get(4).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(4).getObjCat().getName() %></a>
                                                <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(4).getName()) %>/<%=listNews.get(4).getId() %>.html" class="post-title"><%if(listNews.get(4).getName().length() > 50) out.print(listNews.get(4).getName().substring(0, 50) + "..."); else out.print(listNews.get(4).getName()); %></a>
                                                <p><%=listNews.get(4).getDate_create() %></p>
                                                <p>Lược xem: <%=listNews.get(4).getView() %></p>
                                            </div>
                                        </div>

                                        <!-- Welcome Post -->
                                        <div class="welcome-post style-2">
                                            <img width="370px" height="232px" src="<%=request.getContextPath()%>/files/<%=listNews.get(5).getPicture() %>" alt="">
                                            <div class="post-content" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">
                                                <a href="<%=request.getContextPath()%>/danh-muc/<%=StringUtil.makeSlug(listNews.get(5).getObjCat().getName())%>/<%=listNews.get(5).getObjCat().getId() %>/1.html" class="tag" style="width: 200px"><%=listNews.get(5).getObjCat().getName() %></a>
                                                <a href="<%=request.getContextPath()%>/chi-tiet/<%=StringUtil.makeSlug(listNews.get(5).getName()) %>/<%=listNews.get(5).getId() %>.html" class="post-title"><%if(listNews.get(5).getName().length() > 50) out.print(listNews.get(5).getName().substring(0, 50) + "..."); else out.print(listNews.get(5).getName()); %></a>
                                                <p><%=listNews.get(5).getDate_create() %></p>
                                                <p>Lược xem: <%=listNews.get(5).getView() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<%	}} %>
                        

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Welcome Slide Area End ##### -->

    <!-- ##### Blog Post Area Start ##### -->
    <div class="viral-story-blog-post section-padding-0-50">
        <div class="container">
            <div class="row">
                <!-- Blog Posts Area -->
                <div class="col-12 col-lg-8">
                    <div class="row">
						<%
							int numberOfPage = (Integer)request.getAttribute("numberOfPage");
                            int currentPage = (Integer)request.getAttribute("currentPage");
                            if(request.getAttribute("listNews") != null){
                            	ArrayList<News> listNewsT = (ArrayList<News>)request.getAttribute("listNews");
                            	if(listNewsT.size() > 0){
                            		for(News objNews : listNewsT){
                            			String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
                    					+ "/" + objNews.getId() + ".html";
                            			String urlCat = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(objNews.getObjCat().getName())
                            					+ "/" + objNews.getObjCat().getId() + "/" + 1 + ".html";
                            					/* <from>/danh-muc/(.*)/([0-9]+)/([0-9])+.html</from>
                            					<to>/public/cat?id=$2&amp;page=$3</to> */
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
                                    <a href="<%=urlCat%>" class="post-catagory" style="width: 200px"><%=objNews.getObjCat().getName() %></a>
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
				  			if(request.getAttribute("listNews") != null){
					  			@SuppressWarnings("unchecked")
					  			ArrayList<News> listNews = (ArrayList<News>) request.getAttribute("listNews");
					  			if(listNews.size() > 0){
  					%>
                    <div class="row">
                        <div class="col-12">
                            <div class="viral-news-pagination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item <%if(currentPage == 1) out.print("disabled"); %>"><a class="page-link" href="<%=request.getContextPath()%>/trang-chu/<%if(currentPage - 1 > 1) out.print(currentPage - 1);%>.html">Previous</a></li>
                                        <%
                                        	String active = "";
                                        	for(int i = 1; i <= numberOfPage; i++){
                                        		if(i == currentPage){
                                        			active = "active";
                                        		}else{
                                        			active = "";
                                        		}
                                        %>
                                        <li class="page-item <%=active%>"><a class="page-link" href="<%=request.getContextPath()%>/trang-chu/<%=i%>.html"><%=i %></a></li>
                                        <%	} %>
                                        <li class="page-item <%if(currentPage == numberOfPage) out.print("disabled"); %>"><a class="page-link" href="<%=request.getContextPath()%>/trang-chu/<%if(currentPage + 1 < numberOfPage) out.print(currentPage + 1);%>.html">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <%}}} %>
                </div>

                <!-- Sidebar Area -->
                <%@include file="/templates/public/inc/right_bar.jsp" %>
            </div>
        </div>
    </div>
    <!-- ##### Blog Post Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@include file="/templates/public/inc/footer.jsp"%>