<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (request.getAttribute("listCmt") != null) {
		ArrayList<Comment> cmt = (ArrayList<Comment>) request.getAttribute("listCmt");
		if(cmt.size() > 0){
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
			<h6><%=cmt.get(0).getEmail() %></h6>
			<p>"<%=cmt.get(0).getMessage()%>"</p>
			<p><%=cmt.get(0).getDate_creat() %></p>
		</div>
	</div>
</div>
<%
	}}
%>