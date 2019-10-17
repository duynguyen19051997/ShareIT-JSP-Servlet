<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
                <div id="editcontent" class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <!-- /.panel-heading -->
							<div class="panel-heading">
                                <%
                                	String search = "";
                                	if(request.getAttribute("search") != null){
                                		search = request.getAttribute("search").toString();
                                	}
									if (request.getParameter("msg") != null) {
										int msg = Integer.valueOf(request.getParameter("msg"));
										String msgText = StringUtil.returnMessage(request, msg);
										if(msg == 0 || msg == 8 || msg == 7){
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
									<a href="<%=request.getContextPath()%>/admin/news/add" title=""><button type="button" class="btn btn-outline btn-success">Thêm</button></a>
									 <div class="input-group custom-search-form" id="search">
										<form action="<%=request.getContextPath()%>/admin/news/search" method="get" name="formsearch" id="formsearch">
											<input id="searchinput" name="seach" type="text" class="form-control" value="<%=search %>" placeholder="Search...">
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
                                                <th class="center" width="50px">Id</th>
                                                <th class="center">Tên Tin Tức</th>
                                                <th class="center">Ngày Tạo</th>
                                                <th class="center">Mô Tả</th>
                                                <th class="center" width="200px">Hình Ảnh</th>
                                                <th class="center">Tên Danh mục</th>
                                                <th class="center">Được tạo bởi</th>
                                                <th class="center">Trạng thái</th>
                                                <th class="center" width="140px">Chức Năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        	if(request.getAttribute("listSearch") != null){
                                        		@SuppressWarnings("unchecked")
                                        		ArrayList<News> listSearch = (ArrayList<News>)request.getAttribute("listSearch");
                                        		if(listSearch.size() > 0){
                                        			for(News objNews : listSearch){
                                        %>
                                        	<tr class="even gradeC">
                                                <td class="center"><%=objNews.getId()%></td>
                                                <td class="center"><%=objNews.getName() %></td>
                                                <td class="center"><%=objNews.getDate_create() %></td>
                                                <td class="center"><%=objNews.getPreview() %></td>
                                                 <%
		                                        	if(!objNews.getPicture().isEmpty()){
			                                        %>
			                                        <td class="center">
														<img width="200px" height="200px" src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" alt="<%=objNews.getPicture()  %>"/>
			                                        </td>
			                                        <%}else{ %>
			                                        <td class="center">
			                                        	<img width="200px" height="200px" src="<%=request.getContextPath() %>/templates/admin/images/images.jpg" width="177" height="213" alt="Không có hình ảnh"/>
			                                        </td>
	                                       		 <%} %>
                                                <td class="center"><%=objNews.getObjCat().getName() %></td>
                                                <td class="center"><%=objNews.getCreat_by()%></td>
                                                <td id="active">
                                                	<a href="javascript:void(0)" title="" ><img id="<%=objNews.getId() %>" class="image_div_name"
													src="<%=request.getContextPath()%>/templates/admin/images/<%=objNews.getActive() %>"
													alt="" /></a>
                                                </td>
                                                <td class="center">
													<a href="<%=request.getContextPath()%>/admin/news/edit?id=<%=objNews.getId() %>&page=<%=1 %>" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="<%=request.getContextPath()%>/admin/news/delete?id=<%=objNews.getId() %>&page=<%=1 %>" title="Xóa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
													<a id="iconcomment" href="#" title="Comment"><button type="button" class="btn btn-outline btn-warning">Commment</button></a>
												</td>
                                            </tr>
                                        <%
                                        	}}else{
                                        %>
                                        	<tr>
                                        		<td colspan="9" style="text-align: center; font-weight: bold">Không có dữ liệu!</td>
                                        	</tr>
                                        <%	}} %>
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
		<script type="text/javascript">
			document.getElementById("news").classList.add('active');
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
						url: '<%=request.getContextPath()%>/admin/news/active',
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
