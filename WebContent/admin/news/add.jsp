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
								if(msg==0){
									msgText = "Có lỗi trong quá trình thêm, vui lòng kiểm tra lại";
								}
						%>
							<div class="alert alert-danger">
				    			<p class="success"><strong><%=msgText %></strong><p>
							</div>
						<%} %>
						<%
                            if(request.getAttribute("name-error") != null){
                      	%>
                           	<p id="name-error-by-java"><%=request.getAttribute("name-error") %></p>
                       	<%	
                         	}
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span style="font-weight:bold; font-size: 17px">Thêm Tin Tức</span>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="formcss" class="col-lg-6">
                                        <form id="form" role="form" action="" method="post" enctype="multipart/form-data">
											<div class="form-group">
                                                <label>Tên Tin Tức:</label>
                                                <input class="form-control" type="text" name="nameNews" value="" placeholder="Tên Danh Mục">
                                            </div>
                                            <%
                                            	CatDAO catDao = new CatDAO();
                                            	ArrayList<Category> listCat = catDao.getItems();
                                            	if(listCat.size() > 0){
                                            %>
                                            <div class="form-group">
                                                <label>Danh mục</label>
                                                <select name="parent_cat" required title="Vui lòng chọn danh mục!">
                                                	<option value="">
                                                		-Danh mục-
                                                	</option>
                                                	<%
                                                		for(Category objCat : listCat){
                                                	%>
                                                	<option value="<%=objCat.getId()%>">
                                                		<%=objCat.getName() %>
                                                	</option>
                                                	<%	} %>
                                                </select>
                                            </div>
                                            <%	} %>
                                            <div class="form-group">
                                                <label>Hình Ảnh</label>
                                                <input class="form-control" type="file" name="picture" value="">
                                            </div>
                                            <div class="form-group">
                                                <label>Mô tả:</label>
                                                 <textarea class="ckeditor" id="preview" class="form-control" rows="3" name="preview"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Chi Tiết:</label>
                                                 <textarea class="ckeditor" id="detail" class="form-control" rows="3" name="detail"></textarea>
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
				document.getElementById("news").classList.add('active');
				$(document).ready(function(){
					$('#form').validate({
						ignore: [],
						rules:{
							nameNews:{
								required: true
							},
							createBy:{
								required: true
							},
							active:{
								required: true
							},
							preview:{
								required: true
							},
							detail:{
								required: true
							}
						},
						messages:{
							nameNews:{
								required: 'Vui lòng nhập không để trống!'
							},
							createBy:{
								required: 'Vui lòng nhập không để trống!'
							},
							active:{
								required: 'Vui lòng nhập 0 hoặc 1!'
							},
							preview:{
								required: 'Vui lòng nhập không để trống!'
							},
							detail:{
								required: 'Vui lòng nhập không để trống!'
							}
						},					
					});
				});
			</script>
				<!-- /footer -->
            <!-- /footer -->
			<%@include file="/templates/admin/inc/footer.jsp" %>