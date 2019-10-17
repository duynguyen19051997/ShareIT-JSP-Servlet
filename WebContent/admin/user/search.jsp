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
								<div class="panel-heading">
									<%
											String search = "";
											if(request.getAttribute("search") != null){
												search = request.getAttribute("search").toString();
											}
                                        	User userLogin = (User) session.getAttribute("userInfor");
                                        	if("admin".equals(userLogin.getUsername())){
                                     %>
                                     <a href="<%=request.getContextPath()%>/admin/user/add" title="Thêm"><button type="button" class="btn btn-outline btn-success">Thêm</button></a>
                                	<%	} %>
									 <div class="input-group custom-search-form" id="search">
										<form action="<%=request.getContextPath()%>/admin/user/search" method="get" name="formsearch" id="formsearch">
											<input id="searchinput" name="seach" type="text" value="<%=search %>" class="form-control" placeholder="Search...">
											<span id="searchicon" class="input-group-btn">
												<button class="btn btn-primary" type="submit">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</form>
									</div>
								</div>
                                <div class="dataTable_wrapper" id="usertable">
                                	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th class="center" width="120px">Id</th>
                                                <th class="center">Username</th>
                                                <th class="center">Fullname</th>
                                                <th class="center">Trạng Thái</th>
                                                <th class="center" width="140px">Chức Năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
            	                         		if(request.getAttribute("listSearch") != null){
            	                         			@SuppressWarnings("unchecked")
            	                         			ArrayList<User> listSearch = (ArrayList<User>) request.getAttribute("listSearch");
            	                         			if(listSearch.size() > 0){
            	                         				for(User objUser : listSearch){
                                        	%>
                                        	<tr class="odd gradeA">
                                                <td class="center"><%=objUser.getId() %></td>
                                                <td class="center"><%=objUser.getUsername() %></td>
                                                <td class="center"><%=objUser.getFullname() %></td>
                                                <td id="active">
                                                	<%
                                                		if("admin".equals(userLogin.getUsername()) && objUser.getId() != userLogin.getId()){
                                                	%>
                                                	<a href="javascript:void(0)" title="" ><img id="<%=objUser.getId() %>" class="image_div_name"
													src="<%=request.getContextPath()%>/templates/admin/images/<%=objUser.getActive() %>"
													alt="" /></a>
                                                	<%	}else{ %>
                                                	<img id="<%=objUser.getId() %>" class="image_div_name"
													src="<%=request.getContextPath()%>/templates/admin/images/<%=objUser.getActive() %>"
													alt="" />
                                                	<% 	} %>
                                                </td>
                                                <%
                                        			if("admin".equals(userLogin.getUsername())){
                                        		%>
                                        		<td class="center"">
                                        			<a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=objUser.getId() %>" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
                                           		 <%
                                            		if(objUser.getId() != 3){
                                           		 %>	
                                           			 <a onclick="return confirm('Bạn có muốn chắc chắn xóa không?')" href="<%=request.getContextPath()%>/admin/cat/delete?id=<%=objUser.getId() %>" title="Xóa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
                                        		<%	} %>
                                        		</td>
                                       			 <%	}else{ %>
                                        		<td class="center">
                                        		<%
                                        		if(objUser.getId() == userLogin.getId()){
                                        		%>
                                        			<a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=objUser.getId() %>" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
                                       			</td>
                                      			<%	}} %>
                                            </tr>
                                        	<%
                                        		}}else{
		                                        			
                                        	%>
                                        	<tr>
                                        		<td colspan="6" style="text-align: center; font-weight: bold;">Không có dữ liệu!</td>
                                        	</tr>
                                        	<%
                                        			}
                                        		}
                                        	%>
                                        </tbody>
                                    </table>
                                </div>
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
			document.getElementById("users").classList.add('active');
			$(document).ready(function(){
				$('#formsearch').validate({
					rules:{
						seach:{
							required: true
						}
					},
					messages:{
						seach:{
							required: 'Vui lòng không để trống!'
						}
					},					
				});
			});
			$(document).ready(function () {
		        $('#active img').click(function () {
		        	var src = $(this).attr('src');
		        	var id = $(this).attr('id');
		            $.ajax({
						url: '<%=request.getContextPath()%>/admin/user/active',
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
