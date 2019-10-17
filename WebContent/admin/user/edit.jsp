<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
					<div id="content_add" class="col-lg-12">
						<%
							String msgText = "";
							if(request.getParameter("msg")!=null){
								int msg = Integer.parseInt(request.getParameter("msg"));
								if(msg==0 || msg == 9 || msg == 10){
						%>
							<div class="alert alert-danger">
				    			<p class="success"><strong><%=msgText %></strong><p>
							</div>
						<%}} %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span style="font-weight:bold; font-size: 17px">Sửa Người Dùng</span>
                            </div>
                            <%
                            	String userName = "";
                            	String fullName = "";
                            	if(request.getAttribute("objUser") != null){
                            		User objUser = (User)request.getAttribute("objUser");
                            		userName = objUser.getUsername();
                            		fullName = objUser.getFullname();
                            	}
                            %>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="formcss" class="col-lg-6">
                                        <form id="form" role="form" action="" method="post">
											<div class="form-group">
                                                <label>Username:</label>
                                                <input class="form-control" type="text" name="username" value="<%=userName %>" disabled="disabled">
                                            </div>
                                            <div class="form-group">
                                                <label>Password:</label>
                                                <input class="form-control" type="password" name="password" value="">
                                            </div>
                                            <div class="form-group">
                                                <label>Fullname:</label>
                                                <input class="form-control" type="text" name="fullname" value="<%=fullName%>">
                                            </div>
                                            <button type="submit" class="btn btn-default">Thêm</button>
                                        </form>
                                    </div>
									</div>
								<!-- /.col-lg-6 (nested) -->
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
					</div>
					<!-- /.panel -->
                 </div>
			</div>
			<script type="text/javascript">
				document.getElementById("users").classList.add('active');
				$(document).ready(function(){
					$('#form').validate({
						rules:{
							fullname:{
								required: true
							}
						},
						messages:{
							fullname:{
								required: 'Vui lòng nhập Fullname!'
							}
						},					
					});
				});
			</script>
				<!-- /footer -->
            <!-- /footer -->
			<%@include file="/templates/admin/inc/footer.jsp" %>