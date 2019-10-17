<%@page import="util.StringUtil"%>
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
								msgText = StringUtil.returnMessage(request, msg);
								if(msg==0 || msg == 9 || msg == 10){
						%>
							<div class="alert alert-danger">
				    			<p class="success"><strong><%=msgText %></strong><p>
							</div>
						<%}} %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span style="font-weight:bold; font-size: 17px">Thêm Người Dùng</span>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="formcss" class="col-lg-6">
                                        <form id="form" role="form" action="" method="post">
											<div class="form-group">
                                                <label>Username:</label>
                                                <input class="form-control" type="text" name="username" value="" placeholder="Username">
                                            </div>
                                            <div class="form-group">
                                                <label>Password:</label>
                                                <input class="form-control" type="password" name="password" value="">
                                            </div>
                                            <div class="form-group">
                                                <label>Fullname:</label>
                                                <input class="form-control" type="text" name="fullname" value="">
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
							username:{
								required: true
							},
							password:{
								required: true
							},
							fullname:{
								required: true
							}
						},
						messages:{
							username:{
								required: 'Vui lòng nhập Username!'
							},
							password:{
								required: 'Vui lòng nhập Password!'
							},
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