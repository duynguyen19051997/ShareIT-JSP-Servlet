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
									<a href="<%=request.getContextPath()%>/admin/cat/add" title=""><button type="button" class="btn btn-outline btn-success">Thêm</button></a>
									 <div class="input-group custom-search-form" id="search">
									 	<%
									 		String search = "";
									 		if(request.getAttribute("search") != null){
									 			search = request.getAttribute("search").toString();
									 		}
									 	%>
										<form action="<%=request.getContextPath()%>/admin/cat/search" method="get" name="formsearch">
											<input id="searchinput" name="seach" type="text" value="<%=search %>" class="form-control" placeholder="Search...">
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
            	                         		if(request.getAttribute("listSearch") != null){
            	                         			@SuppressWarnings("unchecked")
            	                         			ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listSearch");
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
                                                						out.print(objCat.getName());
                                                					}
                                                				}
                                                			}
                                                		}
                                                	%>
                                                </td>
                                                <th class="center"><%=objCat.getCreate_by() %></th>
                                                <td class="center"><%=objCat.getSort()%></td>
                                                <td class="center">
													<a href="<%=request.getContextPath()%>/admin/cat/edit?id=<%=objCat.getId() %>" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a onclick="return confirm('Bạn có muốn chắc chắn xóa không?')" href="<%=request.getContextPath()%>/admin/cat/delete?id=<%=objCat.getId() %>" title="Xóa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                        	<%
                                        		}}else{
                                        			
                                        	%>
                                        	<tr>
                                        		<td colspan="5" style="text-align: center; font-weight: bold">Tìm kiếm không có!</td>
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
			document.getElementById("cats").classList.add('active');
		</script>
<!-- /footer -->
<%@include file="/templates/admin/inc/footer.jsp" %>
