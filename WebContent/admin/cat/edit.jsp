<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
					<div class="col-lg-12">
                        <div class="panel panel-default">
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
                            <div class="panel-heading">
                                <span style="font-weight:bold; font-size: 17px">Sửa danh mục</span>
                            </div>
                            <div class="panel-body">
                            	<%
                            		Category catById = null;
                            		int id = 0;
                            		int parent_id = 0;
                            		int sort = 500;
                            		String name = "";
                            		if(request.getAttribute("objCat") != null){
                            			catById = (Category) request.getAttribute("objCat");
                            			parent_id = catById.getParent_id();
                            			sort = catById.getSort();
                            			name = catById.getName();
                            			id = catById.getId();
                            		}
                            	%>
                                <div class="row">
                                    <div id="formcss" class="col-lg-6">
                                        <form role="form" action="" method="post" id="form" enctype="multipart/form-data">
											<div class="form-group">
                                                <label>Tên Danh Mục</label>
                                                <input class="form-control" type="text" name="name" value="<%=name %>" placeholder="Tên Danh Mục">
                                            </div>
                                            <div class="form-group">
                                                <label>Sort</label>
                                                <input class="form-control" type="number" name="number" value="<%=sort %>" placeholder="500">
                                            </div>
											<div class="form-group">
                                                <label>Danh Mục Cha</label>
                                                <select name="danhmuccha">
                                                	<option value="0">-Chọn danh mục cha-</option>
                                                	<%
                                                		CatDAO catDAO = new CatDAO();
                                                		ArrayList<Category> listCat = catDAO.getItems();
                                                		if(listCat.size() > 0){
                                                			for(Category objCat : listCat){
                                                				if(objCat.getId() != id){
                                                	%>
                                                	<option value="<%=objCat.getId()%>" <%if(objCat.getId() == parent_id && parent_id != 0) out.print("selected"); %>> <%=objCat.getName() %></option>
                                                	<%	}}} %>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-default">Sửa</button>
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
				document.getElementById("cats").classList.add('active');
				$(document).ready(function(){
					$('#form').validate({
						rules:{
							name:{
								required: true
							},
							number:{
								required: true
							}
						},
						messages:{
							name:{
								required: 'Vui lòng không để trống!'
							},
							number:{
								required: 'Vui lòng không để trống!'
							}
						},					
					});
				});
			</script>
				<!-- /footer -->
            <!-- /footer -->
			<%@include file="/templates/admin/inc/footer.jsp" %>