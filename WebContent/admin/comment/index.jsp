<%@page import="model.DAO.NewsDAO"%>
<%@page import="model.bean.Comment"%>
<%@page import="model.bean.User"%>
<%@page import="model.DAO.CatDAO"%>
<%@page import="util.DeQuy"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
                <div id="editcontent" class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <%
                                	User userLogin = (User) session.getAttribute("userInfor");
									if (request.getParameter("msg") != null) {
										int msg = Integer.valueOf(request.getParameter("msg"));
										String msgText = StringUtil.returnMessage(request, msg);
										if(msg == 0){
								%>
									<div class="alert alert-danger">
									    <p class="success"><strong><%=msgText %></strong><p>
									</div>
								<%} else {%>
									<div class="alert alert-success">
									  	<p class="success"><strong><%=msgText %></strong><p>
									</div>
								<%}} %>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="dataTable_wrapper" id="usertable">
                                	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th class="center" width="120px">Id</th>
                                                <th class="center">Email</th>
                                                <th class="center">Comment</th>
                                                <th class="center">Date-create</th>
                                                <th class="center">News</th>
                                                <th class="center">Active</th>
                                                <th class="center" width="140px">Chức Năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        		NewsDAO newsDAO = new NewsDAO();
                                        	    int numberOfPages = (Integer)request.getAttribute("numberOfPages");
            	                        	    int currentPages = (Integer)request.getAttribute("currentPages");
            	                         		if(request.getAttribute("listCmt") != null){
            	                         			@SuppressWarnings("unchecked")
            	                         			ArrayList<Comment> listCmt = (ArrayList<Comment>) request.getAttribute("listCmt");
            	                         			if(listCmt.size() > 0){
            	                         				for(Comment objCmt : listCmt){
                                        	%>
                                        	<tr class="odd gradeA">
                                                <td class="center"><%=objCmt.getId() %></td>
                                                <td class="center"><%=objCmt.getEmail() %></td>
                                                <td class="center"><%=objCmt.getMessage() %></td>
                                                <td class="center"><%=objCmt.getDate_creat() %></td>
                                                <td class="center"><%=newsDAO.getItem(objCmt.getNew_id()).getName()%></td>
                                                <td id="active">
                                                	<%
                                                		if("admin".equals(userLogin.getUsername())){
                                                	%>
                                                	<a href="javascript:void(0)" title="" ><img id="<%=objCmt.getId() %>" class="image_div_name"
													src="<%=request.getContextPath()%>/templates/admin/images/<%=objCmt.getActive() %>"
													alt="" /></a>
                                                	<%	}else{ %>
                                                	<img id="<%=objCmt.getId() %>" class="image_div_name"
													src="<%=request.getContextPath()%>/templates/admin/images/<%=objCmt.getActive() %>"
													alt="" />
                                                	<% 	} %>
                                                </td>
                                                <%
                                        			if("admin".equals(userLogin.getUsername())){
                                        		%>
                                        		<td class="center">
                                           			 <a onclick="return confirm('Bạn có muốn chắc chắn xóa không?')" href="<%=request.getContextPath()%>/admin/comment/delete?id=<%=objCmt.getId() %>" title="Xóa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
                                        		</td>
                                        		<%	} %>
                                        	<%
                                        		}}else{
		                                        			
                                        	%>
                                        	<tr>
                                        		<td colspan="6" style="text-align: center; font-weight: bold;">Không có dữ liệu!</td>
                                        	</tr>
                                        	<%
                                        		}
                                        	%>
                                        </tbody>
                                    </table>
                                </div>
                                 <%
	                            	if(numberOfPages > 1){
		                            	if(request.getAttribute("listUser") != null){
		                            		@SuppressWarnings("unchecked")
		                            		ArrayList<User> listUser = (ArrayList<User>)request.getAttribute("listUser");
		                            		if(listUser.size() > 0){
	                            %>
                                <div id="pagination" class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous <%if(currentPages == 1) out.print("disabled"); %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/user/index?page=<%if(currentPages - 1 < 1) out.print(1); else out.print(currentPages - 1);%>">Trang trước</a></li>
                                            <%
                                            	String active = "";
                                            	for(int i = 1; i <= numberOfPages; i++){
                                            		if(currentPages == i){
                                            			active = "active";
                                            		}else{
                                            			active = "";
                                            		}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/user/index?page=<%=i%>"><%=i %></a></li>
                                            <%	} %>
                                            <li class="paginate_button next <%if(currentPages == numberOfPages) out.print("disabled"); %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/user/index?page=<%if(currentPages + 1 > numberOfPages) out.print(numberOfPages); else out.print(currentPages + 1);%>">Trang tiếp</a></li>
                                        </ul>
                                    </div>
                                </div>
                                 <%}}}} %>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
						</div>
				</div>
			</div>
		</div>
		<script language="javascript">
			document.getElementById("comments").classList.add('active');
			$(document).ready(function () {
		        $('#active img').click(function () {
		        	var src = $(this).attr('src');
		        	var id = $(this).attr('id');
		            $.ajax({
		            	url: '<%=request.getContextPath()%>/admin/comment/active',
						type: 'POST',
						cache: false,
						data: {
							aSrc: src, aId : id
						},
						success: function(data){
							$('#' + id).attr('src', data);
						},
						error: function (){
							alert('Có lỗi xảy ra');
						}
					});
		        });
		 	});
		</script>
<!-- /footer -->
<%@include file="/templates/admin/inc/footer.jsp" %>
