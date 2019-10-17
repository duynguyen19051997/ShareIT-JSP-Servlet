<%@page import="model.bean.aboutMe"%>
<%@page import="model.DAO.aboutMeDAO"%>
<%@page import="util.StringUtil"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-12 col-lg-4">
                    <div class="sidebar-area">
                    
                        <!-- Trending Articles Widget -->
                        <div class="treading-articles-widget mb-70">
                            <h4>Bài viết mới đăng:</h4>
							<%
								NewsDAO newsDAO = new NewsDAO();
								ArrayList<News> tt = newsDAO.getItemsLatest();
								if(tt.size() > 0){
									int i = 1;
									for(News objNews : tt){
										String urlDetail = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objNews.getName())
                    					+ "/" + objNews.getId() + ".html";
							%>
							<!-- Single Trending Articles -->
                            <div class="single-blog-post style-4">
                                <!-- Post Thumb -->
                                <div class="post-thumb">
                                    <a href="<%=urlDetail%>"><img width="350px" height="220px" src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" alt=""></a>
                                    <span class="serial-number"><%=i %>.</span>
                                </div>
                                <!-- Post Data -->
                                <div class="post-data">
                                    <a href="<%=urlDetail%>" class="post-title">
                                        <h6><%if(objNews.getName().length() > 50) out.print(objNews.getName().substring(0, 50) + "..."); else out.print(objNews.getName()); %></h6>
                                    </a>
                                    <div class="post-meta">
                                    	<p class="post-author">Lượt xem: <a href="<%=urlDetail%>"><%=objNews.getView() %></a></p>
                                        <p class="post-author">By <a href="<%=urlDetail%>"><%=objNews.getCreat_by() %></a></p>
                                    </div>
                                </div>
                            </div>
							<%	i++;}} %>
                        </div>
                        
                        <!-- Latest Comments -->
                        <div class="latest-comments-widget">
                            <h4>About Me</h4>
							<%	
								aboutMeDAO about = new aboutMeDAO();
								aboutMe me = about.myInfor();
								if(me != null){
							%>
							<!-- Single Comment Widget -->
                            <div class="single-comments d-flex">
                                <div class="comments-text">
                                    <p id="aboutme"><%=me.getMe() %></p>
                                    <p id="aboutme">SDT: <%=me.getPhone() %></p>
                                    <p id="aboutme">Email: <%=me.getEmail() %></p>
                                    <p id="aboutme">Facebook: <%=me.getFacebook() %></p>
                                </div>
                            </div>
							<%	} %>

                        </div>

                    </div>
                </div>