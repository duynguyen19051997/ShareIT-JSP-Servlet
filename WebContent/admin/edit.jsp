<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Header -->
					<div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span style="font-weight:bold; font-size: 17px">Sửa danh mục</span>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="formcss" class="col-lg-6">
                                        <form role="form" action="" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label>Tên Tin</label>
                                                <input class="form-control" type="text" name="text" value="" placeholder="Tên Tin">
                                            </div>
											<div class="form-group">
                                                <label>Tên Danh Mục</label>
                                                <input class="form-control" type="text" name="text" value="" placeholder="Tên Danh Mục">
                                            </div>
											<div class="form-group">
                                                <label>Hình ảnh</label>
                                                <input class="form-control" type="file" name="picture">
                                            </div>
											<div class="form-group">
                                                <label>Mô tả</label>
                                                <input class="form-control" type="text" name="preview" value="" placeholder="Mô tả">
                                            </div>
											<div class="form-group">
                                                <label>Chi tiết</label>
                                                <input class="form-control" type="text" name="detail" value="" placeholder="Chi tiết">
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
				<!-- /footer -->
            <!-- /footer -->
			<%@include file="/templates/admin/inc/footer.jsp" %>