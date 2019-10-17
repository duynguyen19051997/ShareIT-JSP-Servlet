<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
                <div id="editcontent" class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
								<div class="alert alert-success alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a href="#" class="alert-link">Alert Link</a>.
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
								<div class="panel-heading">
									<button type="button" class="btn btn-outline btn-success">Thêm</button>
									 <div class="input-group custom-search-form" id="search">
										<form action="" method="get" name="formsearch">
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
                                                <th width="120px">Id Danh Mục</th>
                                                <th>Tên Danh Mục</th>
                                                <th>Sort</th>
                                                <th width="140px">Chức Năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="odd gradeX">
                                                <td>1</td>
                                                <td>Internet Explorer 4.0
													<ul>
														<li id="danhmuccon">
															<p>Java</p>
															<i id="edit" class="fa fa-fw btn" data-toggle="modal" data-target="#myModal" aria-hidden="true" title="Sửa">&#xf1fb </i>
															<i id="delete" class="fa fa-fw" aria-hidden="true" ><a href="#" title="Xóa">&#xf1f8 </a></i>
															<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																			<h4 style="text-align:center" class="modal-title" id="myModalLabel">Sửa danh mục tin</h4>
																		</div>
																		<div class="modal-body">
																			<form role="form" action="" method="" class="">
																				<fieldset>
																					<div class="form-group">
																						<label for="disabledSelect">Tên Danh mục</label>
																						<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input">
																					</div>
																					<div class="form-group">
																						<label for="disabledSelect">Danh mục cha</label>
																						<select id="disabledSelect" class="form-control">
																							<option>Danh mục 1</option>
																							<option>Danh mục 2</option>
																							<option>Danh mục 3</option>
																						</select>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
																						<button type="submit" class="btn btn-primary">Lưu</button>
																					</div>
																				</fieldset>
																			</form>
																		</div>
																		<!-- /.modal-content -->
																	</div>
																	<!-- /.modal-dialog -->
																</div>
																<!-- /.modal -->
															</div>
														</li>
														<li id="danhmuccon">
															<p>Python</p>
															<i id="edit" class="fa fa-fw btn" data-toggle="modal" data-target="#myModal" aria-hidden="true" title="Sửa">&#xf1fb </i>
															<i id="delete" class="fa fa-fw" aria-hidden="true"><a href="#" title="Xóa">&#xf1f8 </a></i>
															<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																			<h4 style="text-align:center" class="modal-title" id="myModalLabel">Sửa danh mục tin</h4>
																		</div>
																		<div class="modal-body">
																			<form role="form" action="" method="" class="">
																				<fieldset>
																					<div class="form-group">
																						<label for="disabledSelect">Tên Danh mục</label>
																						<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input">
																					</div>
																					<div class="form-group">
																						<label for="disabledSelect">Danh mục cha</label>
																						<select id="disabledSelect" class="form-control">
																							<option>Danh mục 1</option>
																							<option>Danh mục 2</option>
																							<option>Danh mục 3</option>
																						</select>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
																						<button type="submit" class="btn btn-primary">Lưu</button>
																					</div>
																				</fieldset>
																			</form>
																		</div>
																		<!-- /.modal-content -->
																	</div>
																<!-- /.modal-dialog -->
															</div>
															<!-- /.modal -->
														</div>
														</li>
													</ul>
												</td>
                                                <td class="center">4</td>
                                                <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>2</td>
                                                <td>Internet Explorer 5.0</td>
                                                <td class="center">5</td>
                                                <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                            <tr class="odd gradeA">
                                                <td>3</td>
                                                <td>Internet Explorer 5.5</td>
                                                <td class="center">5.5</td>
                                               <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                            <tr class="even gradeA">
                                                <td>4</td>
                                                <td>Internet Explorer 6</td>
                                                <td class="center">6</td>
                                                <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                            <tr class="odd gradeA">
                                                <td>5</td>
                                                <td>Internet Explorer 7</td>
                                                <td class="center">7</td>
                                                <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                            <tr class="gradeA">
                                                <td>6</td>
                                                <td>Mozilla 1.5</td>
                                                <td class="center">1.5</td>
                                                <td class="center">
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-primary">Sửa</button></a>
													<a href="#" title="Sửa"><button type="button" class="btn btn-outline btn-danger">Xóa</button></a>
												</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="pagination" class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Trang trước</a></li>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="">1</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">2</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">3</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">4</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">5</a></li>
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Trang tiếp</a></li>
                                        </ul>
                                    </div>
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
<!-- /footer -->
<%@include file="/templates/admin/inc/footer.jsp" %>
