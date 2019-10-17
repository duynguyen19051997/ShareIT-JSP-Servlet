<%@page import="model.DAO.CatDAO"%>
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
									<a href="<%=request.getContextPath()%>/admin/cat/add" title=""><button type="button" class="btn btn-outline btn-success">Thêm</button></a>
									 <div class="input-group custom-search-form" id="search">
										<form action="<%=request.getContextPath()%>/admin/cat/search" method="get" name="formsearch" id="formsearch">
											<input id="searchinput" name="seach" type="text" class="form-control" placeholder="Search...">
											<span id="searchicon" class="input-group-btn">
												<button class="btn btn-primary" type="submit">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</form>
									</div>
								</div>
                                <div class="dataTable_wrapper">
                                	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th class="center" width="120px">Id Danh Mục</th>
                                                <th class="center">Tên Danh Mục</th>
                                                <th class="center">Tên Mục Cha</th>
                                                <th class="center">Được Tạo Bởi</th>
                                                <th class="center">Sort</th>
                                                <th class="center" width="140px">Chức Năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        	    int numberOfPages = (Integer)request.getAttribute("numberOfPages");
            	                        	    int currentPages = (Integer)request.getAttribute("currentPages");
            	                         		if(request.getAttribute("listCat") != null){
            	                         			@SuppressWarnings("unchecked")
            	                         			ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listCat");
            	                         			if(listCat.size() > 0){
            	                         				for(Category objCat : listCat){
                                        	%>
                                        	<tr class="odd gradeA">
                                                <td class="center"><%=objCat.getId() %></td>
                                                <td class="center"><%=objCat.getName() %></td>
                                                <td class="center">
                                                	<%
                                                		if(objCat.getParent_id() == 0){
                                                			out.print("NONE");
                                                		} else if(request.getAttribute("listCatCha") != null){
                                                			@SuppressWarnings("unchecked")
                                                			ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("listCatCha");
                                                			if(list.size() > 0){
                                                				for(Category cat : list){
                                                					if(objCat.getParent_id() == cat.getId()){
                                                						out.print(cat.getName());
                                                						break;
                                                					}
                                                				}
                                                			}
                                                		}
                                                	%>
                                                </td>
                                                <th class="center" style="font-weight: normal;"><%=objCat.getCreate_by() %></th>
                                                <td class="center"><%=objCat.getSort()%></td>
                                                <td class="center">
													<a href="<%=request.getContextPath()%>/admin/cat/edit?id=<%=objCat.getId() %>&page=<%=currentPages %>" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a onclick="return confirm('Bạn có muốn chắc chắn xóa không?')" href="<%=request.getContextPath()%>/admin/cat/delete?id=<%=objCat.getId() %>&page=<%=currentPages %>" title="Xóa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
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
                                 <%
	                            	if(numberOfPages > 1){
		                            	if(request.getAttribute("listCat") != null){
		                            		@SuppressWarnings("unchecked")
		                            		ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
		                            		if(listCat.size() > 0){
	                            %>
                                <div id="pagination" class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous <%if(currentPages == 1) out.print("disabled"); %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%if(currentPages - 1 < 1) out.print(1); else out.print(currentPages - 1);%>">Trang trước</a></li>
                                            <%
                                            	String active = "";
                                            	for(int i = 1; i <= numberOfPages; i++){
                                            		if(currentPages == i){
                                            			active = "active";
                                            		}else{
                                            			active = "";
                                            		}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%=i%>"><%=i %></a></li>
                                            <%	} %>
                                            <li class="paginate_button next <%if(currentPages == numberOfPages) out.print("disabled"); %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%if(currentPages + 1 > numberOfPages) out.print(numberOfPages); else out.print(currentPages + 1);%>">Trang tiếp</a></li>
                                        </ul>
                                    </div>
                                </div>
                                 <%}}} %>
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
			document.getElementById("cats").classList.add('active');
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
		</script>
<!-- /footer -->
<%@include file="/templates/admin/inc/footer.jsp" %>
